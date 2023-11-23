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
                        System.out.println("Erro: Formato de rega invalido. Insira a data no formato yyyy-mm-dd.");
                    scanner.nextLine();
                    System.out.print("Data (yyyy-mm-dd): ");
                    strDate = scanner.next();
                }
            }


            System.out.print("ParcelaId: ");
            int parcelaId = scanner.nextInt();

            System.out.print("ProdutoId: ");
            int produtoId = scanner.nextInt();

            System.out.print("MetodoExecucaoId: ");
            int metodoExecucaoId = scanner.nextInt();

            System.out.print("Quantidade: ");
            float quantidade = scanner.nextFloat();

            while (quantidade < 0) {
                System.out.println("Error: Quantity cannot be a negative number. Please enter a non-negative quantity.");
                System.out.print("Quantidade: ");
                quantidade = scanner.nextFloat();
            }

            controller.colheitaRegister(operacaoId, parcelaId, produtoId, metodoExecucaoId, quantidade);
            controllerop.operacaoAgricolaRegister(operacaoId, date);

            System.out.println("\nColheita registered.");
        } catch (SQLException e) {


            System.out.println("\nColheita not registered!\n" + e.getMessage());

        }
    }
}

