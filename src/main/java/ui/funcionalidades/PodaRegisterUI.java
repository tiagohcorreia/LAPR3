package ui.funcionalidades;

import controller.ColheitaRegisterController;
import controller.OperacaoAgricolaRegisterController;
import controller.PodaRegisterController;

import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Scanner;

public class PodaRegisterUI implements Runnable {

    private PodaRegisterController controller;
    private OperacaoAgricolaRegisterController controllerop;

    public PodaRegisterUI() {
        controller = new PodaRegisterController();
        controllerop = new OperacaoAgricolaRegisterController();
    }

    public void run() {
        try {
            System.out.println("Registar uma Poda");

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
                    // Go back to the main menu or exit the program
                    return;
                }
                try {
                   variedadeId = Integer.parseInt(variedadeInput);
                    if (!controllerop.isIdValid("Variedade", variedadeId)) {
                        System.out.println("Erro: VariedadeId nao registado na base de dados. Insira um Id existente.");
                    }
                } catch (NumberFormatException e) {
                    System.out.println("Erro: Insira um namero valido para VariedadeId ou E para sair.");
                }
            } while (!controllerop.isIdValid("Variedade", variedadeId));

            System.out.print("MetodoExecucaoId (Insira E para sair): \n");
            String metodoExecucaoIdInput = scanner.next().trim();
            if (metodoExecucaoIdInput.equalsIgnoreCase("E")) {
                // Go back to the main menu or exit the program
                return;
            }
            controllerop.getTableData("Metodo_Execucao");
            controllerop.printTableData("Metodo_Execucao");

            int metodoExecucaoId = 0;
            String metodoExecucaoInput;
            do {
                System.out.print("Metodo Execucao Id (Insira E para sair): \n");
                metodoExecucaoInput = scanner.next().trim();
                if (metodoExecucaoInput.equalsIgnoreCase("E")) {
                    // Go back to the main menu or exit the program
                    return;
                }
                try {
                    metodoExecucaoId = Integer.parseInt(metodoExecucaoInput);
                    if (!controllerop.isIdValid("Metodo_Execucao", metodoExecucaoId)) {
                        System.out.println("Erro: ProdutoId nao registado na base de dados. Insira um Id existente.");
                    }
                } catch (NumberFormatException e) {
                    System.out.println("Erro: Insira um numero valido para metodoExecucaoId ou E para sair.");
                }
            } while (!controllerop.isIdValid("Metodo_Execucao", metodoExecucaoId));

            float quantidade;
            String quantidadeInput;
            while (true) {
                System.out.print("Quantidade (Insira E para sair): \n");
                quantidadeInput = scanner.next().trim();
                if (quantidadeInput.equalsIgnoreCase("E")) {
                    // Go back to the main menu or exit the program
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
                    System.out.println("Erro: Insira um número válido para Quantidade ou E para sair.");
                }
            }

            if (operacaoId != controllerop.getNextId()){
                System.out.println("Erro: Id operacao ja em uso.");
                run();
            }

            controllerop.operacaoAgricolaRegister(operacaoId, date);
            controller.podaRegister(operacaoId, parcelaId, variedadeId, quantidade, metodoExecucaoId);

            System.out.println("\nPoda registada.");
        } catch (SQLException e) {


            System.out.println("\nPoda nao registada!\n" + e.getMessage());

        }
    }
}

