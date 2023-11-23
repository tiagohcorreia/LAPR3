package ui.funcionalidades;

import controller.ColheitaRegisterController;
import controller.MondaRegisterController;
import controller.OperacaoAgricolaRegisterController;
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
            System.out.println("Register a new Monda");

            System.out.print("OperacaoId: ");
            int operacaoId = controllerop.getNextId();
            System.out.printf("Using %d\n", operacaoId);


            String strDate = Utils.readLineFromConsole("Date (yyyy-mm-dd): ");
            SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
            formatter.setLenient(false);  // Set leniency to false

            Date date = null;
            boolean validDate = false;
            while (!validDate) {
                try {
                    date = formatter.parse(strDate);
                    validDate = true;
                } catch (ParseException e) {
                    Utils.readLineFromConsole("Error: Invalid date format. Please enter the date in yyyy-mm-dd format.");
                    strDate = Utils.readLineFromConsole("Date (yyyy-mm-dd): ");
                }
            }


            int parcelaId = Utils.readIntegerFromConsole("ParcelaId: ");

            int variedadeId = Utils.readIntegerFromConsole("VariedadeId: ");

            int fatorProducaoId = Utils.readIntegerFromConsole("FatorProducaoId: ");

            int metodoExecucaoId = Utils.readIntegerFromConsole("MetodoExecucaoId: ");

            float quantidade = Utils.readFloatFromConsole("Quantidade: ");

            while (quantidade < 0) {
                System.out.println("Error: Quantity cannot be a negative number. Please enter a non-negative quantity.");
                quantidade = Utils.readFloatFromConsole("Quantidade: ");
            }


            controllerop.operacaoAgricolaRegister(operacaoId, date);
            controller.mondaRegister(operacaoId, parcelaId, variedadeId,fatorProducaoId, metodoExecucaoId, quantidade);

            System.out.println("\nMonda registered.");
        } catch (SQLException e) {


            System.out.println("\nMonda was not registered!\n" + e.getMessage());

        }
    }
}

