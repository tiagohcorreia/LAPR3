package ui.funcionalidades;

import controller.ColheitaRegisterController;
import controller.MondaRegisterController;
import controller.OperacaoAgricolaRegisterController;

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
            System.out.println("Register a new Monda");

            Scanner scanner = new Scanner(System.in);
            System.out.print("OperacaoId: ");
            int operacaoId = controllerop.getNextId();
            System.out.printf("Using %d\n", operacaoId);

            System.out.print("Date (yyyy-mm-dd): ");
            String strDate = scanner.next();
            SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
            formatter.setLenient(false);  // Set leniency to false

            Date date = null;
            boolean validDate = false;
            while (!validDate) {
                try {
                    date = formatter.parse(strDate);
                    validDate = true;
                } catch (ParseException e) {
                    System.out.println("Error: Invalid date format. Please enter the date in yyyy-mm-dd format.");
                    scanner.nextLine();
                    System.out.print("Date (yyyy-mm-dd): ");
                    strDate = scanner.next();
                }
            }

            System.out.print("ParcelaId: ");
            int parcelaId = scanner.nextInt();

            System.out.print("VariedadeId: ");
            int variedadeId = scanner.nextInt();

            System.out.print("FatorProducaoId: ");
            int fatorProducaoId = scanner.nextInt();

            System.out.print("MetodoExecucaoId: ");
            int metodoExecucaoId = scanner.nextInt();

            System.out.print("Quantidade: ");
            float quantidade = scanner.nextFloat();

            while (quantidade < 0) {
                System.out.println("Error: Quantity cannot be a negative number. Please enter a non-negative quantity.");
                System.out.print("Quantidade: ");
                quantidade = scanner.nextFloat();
            }


            controllerop.operacaoAgricolaRegister(operacaoId, date);
            controller.mondaRegister(operacaoId, parcelaId, variedadeId,fatorProducaoId, metodoExecucaoId, quantidade);

            System.out.println("\nMonda registered.");
        } catch (SQLException e) {


            System.out.println("\nMonda was not registered!\n" + e.getMessage());

        }
    }
}

