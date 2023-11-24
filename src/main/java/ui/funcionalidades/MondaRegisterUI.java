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

            System.out.println("Registar nova Monda");

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

            ParcelasListController controller1 = new ParcelasListController();
            controller1.showAllParcelas();
            int parcelaId = Utils.readIntegerFromConsole("ParcelaId: ");


            VariedadeListController controller2 = new VariedadeListController();
            controller2.showVariedades();
            int variedadeId = Utils.readIntegerFromConsole("VariedadeId: ");

            FatorProducaoListController controller3 = new FatorProducaoListController();
            controller3.showAllFatoresProducao();
            int fatorProducaoId = Utils.readIntegerFromConsole("FatorProducaoId: ");

            MetodoExecucaoListController controller4 = new MetodoExecucaoListController();
            controller4.showMetodosExecucao();
            int metodoExecucaoId = Utils.readIntegerFromConsole("MetodoExecucaoId: ");

            float quantidade = Utils.readFloatFromConsole("Quantidade: ");

            while (quantidade < 0) {

                System.out.println("Error: Quantity cannot be a negative number. Please enter a non-negative quantity.");
                quantidade = Utils.readFloatFromConsole("Quantidade: ");
            }

            controllerop.operacaoAgricolaRegister(operacaoId, date);
            controller.mondaRegister(operacaoId, parcelaId, variedadeId,fatorProducaoId, metodoExecucaoId, quantidade);

            System.out.println("\nMonda registada.");

        } catch (SQLException e) {

            System.err.println("\nMonda não foi registada!\n" + e.getMessage());

        }
    }
}

