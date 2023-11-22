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
            int operacaoId = scanner.nextInt();

            System.out.print("Date (yyyy-mm-dd): ");
            String strDate = scanner.next();
            SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
            Date date = formatter.parse(strDate);

            Date currentDate = new Date();
            if (date.after(currentDate)) {
                System.out.println("Error: Cannot register an operation with a future date.");
                return;
            }

            System.out.print("ParcelaId: ");
            int parcelaId = scanner.nextInt();

            System.out.print("ProdutoId: ");
            int produtoId = scanner.nextInt();

            System.out.print("MetodoExecucaoId: ");
            int metodoExecucaoId = scanner.nextInt();

            System.out.print("Quantidade: ");
            float quantidade = scanner.nextFloat();
            controllerop.operacaoAgricolaRegister(operacaoId,date);
            controller.colheitaRegister(operacaoId,parcelaId,produtoId,metodoExecucaoId,quantidade);
            System.out.println("\nColheita registered.");

        } catch (SQLException | ParseException e) {
            System.out.println("\nColheita not registered!\n" + e.getMessage());
        }
    }
}
