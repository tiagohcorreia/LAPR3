package ui.funcionalidades;

import controller.FertirregaController;
import controller.OperacaoAgricolaRegisterController;
import controller.RegaRegisterController;
import domain.RegaTable;
import ui.menu.MainMenuUI;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.TimeUnit;

public class RegaRegisterUI implements Runnable {

    private RegaRegisterController controller;
    private OperacaoAgricolaRegisterController operacaoController;
    private FertirregaController fertirregaController;
    private final ScheduledExecutorService scheduler = Executors.newScheduledThreadPool(1);

    public RegaRegisterUI() {
        this.controller = new RegaRegisterController();
        this.operacaoController = new OperacaoAgricolaRegisterController();
        this.fertirregaController = new FertirregaController();
    }

    public void run() {
        System.out.println("=====================================");
        System.out.println("Consumo do Plano de Rega");
        System.out.println("=====================================");

        String filePath = "plano_de_rega.csv";
        controller.readCSV(filePath);

        registerNextOperation(0);
    }

    private void registerNextOperation(int index) {
        if (index < controller.getRegaTableList().size()) {
            RegaTable regaTable = controller.getRegaTable(index);
            String endTime = regaTable.getEndTime();

            registerRegaOperation(index, endTime, () -> registerNextOperation(index + 1));
        }
    }

    private void registerRegaOperation(int index, String endTime, Runnable callback) {
        try {
            System.out.println("=====================================");
            System.out.println("Registando Operacao de Rega");
            System.out.println("=====================================");

            RegaTable regaTable = controller.getRegaTable(index);
            int operacaoId = operacaoController.getNextId();
            System.out.printf("Usando id %d\n", operacaoId);

            SimpleDateFormat dateTimeFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm");
            Date endDate = dateTimeFormat.parse(endTime);

            Date currentDate = new Date();
            boolean check = false;

            System.out.println("Data Atual: " + currentDate);
            System.out.println("Data Final da Rega: " + endDate);

            long fiveSecondsInMillis = 5 * 1000; // 5 seconds in milliseconds

            if (endDate.before(new Date(currentDate.getTime() - fiveSecondsInMillis))) {
                callback.run();
            } else {
                System.out.println("Final da rega programado no futuro as horas: " + dateTimeFormat.format(endDate));

                long delay = endDate.getTime() - System.currentTimeMillis();
                if(regaTable.getMix() != null){
                    check = true;
                }
                boolean finalCheck = check;
                scheduler.schedule(() -> performRegistration(index, operacaoId, regaTable, callback, finalCheck), delay, TimeUnit.MILLISECONDS);
                new MainMenuUI();
            }

        } catch (ParseException e) {
            System.out.println("Erro parsing time: " + e.getMessage());
        }
    }

    private void performRegistration(int index, int operacaoId, RegaTable regaTable, Runnable callback,boolean check) {
        try {

            String setor = regaTable.getSetor();
            String hora = regaTable.getHora();
            Date date = regaTable.getData();
            int duracao = regaTable.getDuracao();
            String mix = "";
            if (check){
                mix = regaTable.getMix();
            }



            operacaoController.operacaoAgricolaRegister(operacaoId, date);
            if (check){
                fertirregaController.registerFpIds(operacaoId, mix,setor);

            }
            controller.regaRegister(operacaoId, setor, duracao, hora);

            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            String registrationTime = dateFormat.format(new Date());

            if(check){
                System.out.println("\nFertirrega registada na hora local : " + registrationTime);
                duracao = duracao*60*1000;
            }
            else{

            System.out.println("\nRega registada na hora local : " + registrationTime);
            duracao = duracao*60*1000; }

            if (index < controller.getRegaTableList().size() - 1) {
                Thread.sleep(duracao);
                callback.run();
            } else {
                System.out.println("\nUltima operacao realizada.");
            }

        } catch (SQLException | InterruptedException e) {
            System.out.println("\nRega nao registada!\n" + e.getMessage());
        }
    }
}
