package ui.funcionalidades;

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
    private final ScheduledExecutorService scheduler = Executors.newScheduledThreadPool(1);

    public RegaRegisterUI() throws SQLException {
        this.controller = new RegaRegisterController();
        this.operacaoController = new OperacaoAgricolaRegisterController();
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

            System.out.println("Data Atual: " + currentDate);
            System.out.println("Data Final da Rega: " + endDate);
            Date date = regaTable.getData();

            if (endDate.before(currentDate)) {
                callback.run();
            } else {
                System.out.println("Final da rega programado no futuro as horas: " + dateTimeFormat.format(endDate));

                long delay = endDate.getTime() - System.currentTimeMillis();
                date = regaTable.getData();
                operacaoController.operacaoAgricolaRegister(operacaoId, date);
                scheduler.schedule(() -> performRegistration(index, operacaoId, regaTable, callback), delay, TimeUnit.MILLISECONDS);
                new MainMenuUI();
            }

        } catch (ParseException | SQLException e) {
            System.out.println("Erro parsing time: " + e.getMessage());
        }
    }

    private void performRegistration(int index, int operacaoId, RegaTable regaTable, Runnable callback) {
        try {

            String setor = regaTable.getSetor();
            int duracao = regaTable.getDuracao();
            String hora = regaTable.getHora();

            controller.regaRegister(operacaoId, setor, duracao, hora);

            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            String registrationTime = dateFormat.format(new Date());

            System.out.println("\nRega registada na hora local : " + registrationTime);
            duracao = duracao*60*1000;

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
