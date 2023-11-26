package ui.funcionalidades;

import controller.ColheitaRegisterController;
import controller.FatorProducaoRegisterController;
import controller.OperacaoAgricolaRegisterController;

import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Scanner;

public class AplicacaoFP_UI implements Runnable {

    private FatorProducaoRegisterController controller;
    private OperacaoAgricolaRegisterController controllerop;

    public AplicacaoFP_UI() {
        controller = new FatorProducaoRegisterController();
        controllerop = new OperacaoAgricolaRegisterController();
    }

    public void run() {
        try {
            System.out.println("Registar Aplicacao FP");

            Scanner scanner = new Scanner(System.in);
            System.out.print("OperacaoId: ");
            int operacaoId = controllerop.getNextId();
            System.out.printf("Usando id %d\n", operacaoId);

            System.out.print("Date (yyyy-mm-dd): (Insira E para sair) \n");
            String strDate = scanner.next();
            SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
            formatter.setLenient(false);

            Date currentDate = new Date();
            if (strDate.equalsIgnoreCase("E")) {
                return;
            }
            Date date = null;
            boolean validDate = false;
            while (!validDate) {
                try {
                    date = formatter.parse(strDate);
                    if (date.after(currentDate)) {
                        System.out.println("Erro: Data invalida.Insira uma data que nao se encontre no futuro.");
                        System.out.print("Data (yyyy-mm-dd): ");
                        strDate = scanner.next();
                    } else {
                        validDate = true;
                    }
                } catch (ParseException e) {
                    System.out.println("Erro: Formato de data invalido. Insira a data no formato yyyy-mm-dd.");
                    scanner.nextLine();
                    System.out.print("Data (yyyy-mm-dd): ");
                    strDate = scanner.next();
                }
            }

            controllerop.getTableData("Parcela");
            controllerop.printTableData("Parcela");

            int parcelaId = 0;
            String parcelaInput;
            do {
                System.out.print("ParcelaId (Insira E para sair): \n");
                parcelaInput = scanner.next().trim();
                if (parcelaInput.equalsIgnoreCase("E")) {
                    // Go back to the main menu or exit the program
                    return;
                }
                try {
                    parcelaId = Integer.parseInt(parcelaInput);
                    if (!controllerop.isIdValid("PARCELA", parcelaId)) {
                        System.out.println("Erro: ParcelaId nao registado na base de dados. Insira um Id existente.");
                    }
                } catch (NumberFormatException e) {
                    System.out.println("Erro: Insira um número válido para ParcelaId ou E para sair.");
                }
            } while (!controllerop.isIdValid("PARCELA", parcelaId));

            controllerop.getTableData("Variedade");
            controllerop.printTableData("Variedade");
            int variedadeId = 0;
            String variedadeInput;
            do {
                System.out.print("VariedadeId (Insira E para sair): \n");
                variedadeInput = scanner.next().trim();
                if (variedadeInput.equalsIgnoreCase("E")) {
                    return;
                }
                try {
                    variedadeId = Integer.parseInt(variedadeInput);
                    if (!controllerop.isIdValid("Variedade", variedadeId)) {
                        System.out.println("Erro: VariedadeId nao registado na base de dados. Insira um Id existente.");
                    }
                } catch (NumberFormatException e) {
                    System.out.println("Erro: Insira um número válido para VariedadeId ou E para sair.");
                }
            } while (!controllerop.isIdValid("Variedade", variedadeId));

            controllerop.getTableData("Fator_Producao");
            controllerop.printTableData("Fator_Producao");
            int fatorProducaoId = 0;
            String fatorProducaoInput;
            do {
                System.out.print("Fator Producao Id (Insira E para sair): \n");
                fatorProducaoInput = scanner.next().trim();
                if (fatorProducaoInput.equalsIgnoreCase("E")) {
                    return;
                }
                try {
                    fatorProducaoId = Integer.parseInt(fatorProducaoInput);
                    if (!controllerop.isIdValid("FATOR_PRODUCAO", fatorProducaoId)) {
                        System.out.println("Erro: FatorProducaoId nao registado na base de dados. Insira um Id existente.");
                    }
                } catch (NumberFormatException e) {
                    System.out.println("Erro: Insira um numero valido para FatorProducaoId ou E para sair.");
                }
            } while (!controllerop.isIdValid("FATOR_PRODUCAO", fatorProducaoId));


                    List<String[]> data = controllerop.getTableDataByFatorProducaoId("FP_Metodo_Aplicacao", fatorProducaoId);

            if (data.isEmpty()) {
                System.out.println("Data nao encontrada para o Fator Producao ID.");
            } else {

                controllerop.printTableDataByFatorId("FP_Metodo_Aplicacao", data,fatorProducaoId);
            }
            int metodoAplicacaoId = 0;
            String metodoAplicacaoInput;

                System.out.print("Metodo Aplicacao Id (Insira E para sair): \n");
                metodoAplicacaoInput = scanner.next().trim();
                if (metodoAplicacaoInput.equalsIgnoreCase("E")) {
                    return;
                }
                    metodoAplicacaoId = Integer.parseInt(metodoAplicacaoInput);


            float quantidade;
            String quantidadeInput;
            while (true) {
                System.out.print("Quantidade (Insira E para sair): \n");
                quantidadeInput = scanner.next().trim();
                if (quantidadeInput.equalsIgnoreCase("E")) {
                    return;
                }
                try {
                    quantidade = Float.parseFloat(quantidadeInput);
                    if (quantidade > 0) {
                        break;
                    } else {
                        System.out.println("Erro: Quantidade nao pode ser um valor negativo.");
                    }
                } catch (NumberFormatException e) {
                    System.out.println("Erro: Insira um numero valido para Quantidade ou E para sair.");
                }
            }

            float area;
            String areaInput;
            while (true) {
                System.out.print("Area (Insira E para sair): \n");
                areaInput = scanner.next().trim();
                if (areaInput.equalsIgnoreCase("E")) {
                    return;
                }
                try {
                    area = Float.parseFloat(areaInput);
                    if (area > 0) {
                        break;
                    } else {
                        System.out.println("Erro: Area nao pode ser um valor negativo.");
                    }
                } catch (NumberFormatException e) {
                    System.out.println("Erro: Insira um numero valido para area ou E para sair.");
                }
            }

            if (operacaoId != controllerop.getNextId()){
                System.out.println("Erro: Id operacao ja em uso.");
                run();
            }

            controllerop.operacaoAgricolaRegister(operacaoId, date);
            controller.fatorProducaoRegister(operacaoId,parcelaId,variedadeId,fatorProducaoId,metodoAplicacaoId,quantidade,area);

            System.out.println("\nAplicacao FP registada.");
        } catch (SQLException e) {


            System.out.println("\nAplicacao FP nao registada!\n" + e.getMessage());

        }
    }
}

