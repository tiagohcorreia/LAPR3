package ui.funcionalidades;

import controller.GenerateWateringPlanCtrl;
import ui.utils.Utils;
import watering_system_manager.WateringPlanGenerator;

import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.sql.SQLException;
import java.util.Scanner;

public class SimularSistemaRegaUI implements Runnable {

    private final int NUMBER_OF_PLAN_DAYS = 30;
    private GenerateWateringPlanCtrl ctrl = new GenerateWateringPlanCtrl();

    @Override
    public void run() {

        BufferedReader fileReader = getFileReader();
        if (fileReader != null) {
            ctrl.generateWateringPlan(fileReader, NUMBER_OF_PLAN_DAYS);
            System.out.println("Plano de rega gerado com sucesso\n");
        }
        /*wateringPlanGenerator.adjustWateringSchedule("plano_de_rega.csv");
        RegaRegisterUI regaRegisterUI = null;
        try {
            regaRegisterUI = new RegaRegisterUI();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        assert regaRegisterUI != null;
        regaRegisterUI.run();*/
    }

    public BufferedReader getFileReader() {
        boolean validIn = false;
        BufferedReader reader = null;
        String input;

        do {
            input = Utils.readLineFromConsole("Insira a localizacao do ficheiro ou 0 para cancelar: ");

            try {
                if (Integer.parseInt(input)==0){
                    validIn=true;
                }
            } catch (NumberFormatException e){

                try {
                    reader = new BufferedReader(new FileReader(input));
                    validIn = true;

                } catch (FileNotFoundException f) {
                    System.out.println("O ficheiro indicado é inválido\n");
                }
            }
        } while (!validIn);

        return reader;
    }
}

