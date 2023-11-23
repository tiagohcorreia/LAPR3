package ui.funcionalidades;

import controller.ColheitaRegisterController;
import controller.OperacaoAgricolaRegisterController;

import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Scanner;

public class ColheitaRegisterUI implements Runnable {

    private ColheitaRegisterController controller;
    private OperacaoAgricolaRegisterController controllerop;

    public ColheitaRegisterUI() {
        controller = new ColheitaRegisterController();
        controllerop = new OperacaoAgricolaRegisterController();
    }

    public void run() {
        try {
            System.out.println("Register a new Colheita");

            Scanner scanner = new Scanner(System.in);
            System.out.print("OperacaoId: ");
            int operacaoId = controllerop.getNextId();
            System.out.printf("Usando id %d\n", operacaoId);

            System.out.print("Date (yyyy-mm-dd): ");
            String strDate = scanner.next();
            SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
            formatter.setLenient(false);

            Date currentDate = new Date();

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

            int parcelaId;
            do {
                System.out.print("ParcelaId: ");
                parcelaId = scanner.nextInt();
                if (!controller.isIdValid("PARCELA", parcelaId)) {
                    System.out.println("Erro: ParcelaId nao registado na base de dados. Insira um Id existente.");
                }
            } while (!controller.isIdValid("PARCELA", parcelaId));

            controllerop.getTableData("Produto");
            controllerop.printTableData("Produto");

            int produtoId;
            do {
                System.out.print("ProdutoId: ");
                produtoId = scanner.nextInt();
                if (!controller.isIdValid("Produto", produtoId)) {
                    System.out.println("Erro: ProdutoId nao registado na base de dados. Insira um Id existente.");
                }
            } while (!controller.isIdValid("Produto", produtoId));

            System.out.print("MetodoExecucaoId: ");
            int metodoExecucaoId = scanner.nextInt();

            float quantidade;

            while (true) {
                System.out.print("Quantidade: ");

                try {
                    String input = scanner.next();
                    quantidade = Float.parseFloat(input);

                    if (quantidade > 0) {
                        break;
                    } else {
                        System.out.println("Erro: Quantidade nao pode ser um valor negativo.");
                    }
                } catch (NumberFormatException e) {
                    System.out.println("Erro: Quantidade deve ser um numero valido.");
                }
            }

            controllerop.operacaoAgricolaRegister(operacaoId, date);
            controller.colheitaRegister(operacaoId, parcelaId, produtoId, metodoExecucaoId, quantidade);

            System.out.println("\nColheita registada.");
        } catch (SQLException e) {


            System.out.println("\nColheita nao registada!\n" + e.getMessage());

        }
    }
}

