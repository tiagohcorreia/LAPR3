package ui.funcionalidades;

import controller.*;
import domain.Variedade;
import ui.utils.Utils;

import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Scanner;

public class MondaRegisterUI implements Runnable {

    private MondaRegisterController controller;
    private OperacaoAgricolaRegisterController controllerop;

    public MondaRegisterUI() {
        controller = new MondaRegisterController();
        controllerop = new OperacaoAgricolaRegisterController();

    }

    public void run() {
        try {
            Scanner scanner = new Scanner(System.in);
            System.out.println("Registar nova Monda");

            System.out.print("OperacaoId: ");
            int operacaoId = controllerop.getNextId();
            System.out.printf("Using %d\n", operacaoId);


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
                    return;
                }
                try {
                    parcelaId = Integer.parseInt(parcelaInput);
                    if (!controllerop.isIdValid("Parcela", parcelaId)) {
                        System.out.println("Erro: ParcelaId nao registado na base de dados. Insira um Id existente.");
                    }
                } catch (NumberFormatException e) {
                    System.out.println("Erro: Insira um número válido para ParcelaId ou E para sair.");
                }
            } while (!controllerop.isIdValid("Parcela", parcelaId));


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
                    // Go back to the main menu or exit the program
                    return;
                }
                try {
                    fatorProducaoId = Integer.parseInt(fatorProducaoInput);
                    if (!controllerop.isIdValid("FATOR_PRODUCAO", fatorProducaoId)) {
                        System.out.println("Erro: FatorProducaoId nao registado na base de dados. Insira um Id existente.");
                    }
                } catch (NumberFormatException e) {
                    System.out.println("Erro: Insira um numero válido para FatorProducaoId ou E para sair.");
                }
            } while (!controllerop.isIdValid("FATOR_PRODUCAO", fatorProducaoId));

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

            float quantidade = Utils.readFloatFromConsole("Quantidade: ");

            while (quantidade < 0) {

                System.out.println("Error: Quantity cannot be a negative number. Please enter a non-negative quantity.");
                quantidade = Utils.readFloatFromConsole("Quantidade: ");
            }

            if (operacaoId != controllerop.getNextId()){
                System.out.println("Erro: Id operacao ja em uso.");
                run();
            }

            controllerop.operacaoAgricolaRegister(operacaoId, date);
            controller.mondaRegister(operacaoId, parcelaId, variedadeId,fatorProducaoId, metodoExecucaoId, quantidade);

            System.out.println("\nMonda registada.");

        } catch (SQLException e) {

            System.err.println("\nMonda não foi registada!\n" + e.getMessage());

        }
    }
}

