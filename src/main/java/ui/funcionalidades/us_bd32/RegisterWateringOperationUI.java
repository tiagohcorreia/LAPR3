package ui.funcionalidades.us_bd32;

import controller.us_bd32.RegisterWateringOperationController;
import domain.*;
import ui.utils.Utils;

import java.time.LocalDate;
import java.util.List;

public class RegisterWateringOperationUI implements Runnable {

    RegisterWateringOperationController ctrl = new RegisterWateringOperationController();

    private int setorId;
    private LocalDate date;
    private int duration;
    private String hour;
    private int mixId;
    private boolean isFertigation;

    @Override
    public void run() {
        String space = "----------------------------";
        System.out.printf("%s REGISTAR SEMENTEIRA %s\n\n", space, space);

        getSectorId();
        getOperationDate();
        getWateringDuration();
        getHourOfWatering();
        askIfIsFertigation();

        if (isFertigation) {
            getMixId();
        }

        if (getConfirmation()) {
            boolean out;

            if (isFertigation) {
                out = ctrl.registerFertigationOperation(setorId, date, duration, hour, mixId);
            } else {
                out = ctrl.registerWateringOperation(setorId, date, duration, hour);
            }

            if (out){
                System.out.println("Operação registada com sucesso\n");
            } else System.err.println("ERRO: Não foi possível registar a operação");
        }
    }

    private void getSectorId() {
        List<SetorRega> sectors = ctrl.getSetoresRega();
        setorId = Utils.getTableIdFromConsole(sectors, "ID", "SETORES DE REGA", "Introduza o ID do setor de rega:");
    }

    private void getOperationDate() {
        date = Utils.getLocalDateFromConsole("Introduza a data prevista da operação (DD-MM-AAAA)", "dd-MM-yyyy");
    }

    private void getWateringDuration() {
        duration = Utils.readPositiveIntegerFromConsole("Insira a duração, em minutos, da rega:");
    }

    private void getHourOfWatering() {
        boolean valid = false;

        do {
            hour = Utils.readLineFromConsole("Introduza a hora (HH:MM) da rega:");

            if (hour != null && hour.matches("^([0-9]|0[0-9]|1[0-2]):[0-5][0-9]$")) {
                valid = true;
            } else System.out.println("ERRO: Formato inválido\n");

        } while (!valid);
    }

    private void askIfIsFertigation() {
        isFertigation = Utils.getBooleanAnswer("É uma operação de fertirrega?");
    }

    private void getMixId() {
        List<ReceitaFertirrega> mixes = ctrl.getReceitasFertirrega();
        mixId = Utils.getTableIdFromConsole(mixes, "ID", "RECEITAS", "Introduza o id da receita");
    }

    private boolean getConfirmation() {
        if (isFertigation) {
            System.out.println("----------------- Dados da Fertirrega -----------------\n");

            System.out.printf("ID Setor: %d\n", setorId);
            System.out.printf("Data da operação: %s\n", date);
            System.out.printf("Duração da rega: %dmn\n", duration);
            System.out.printf("Hora da rega: %s\n", hour);
            System.out.printf("ID da receita: %d\n", mixId);
        } else {
            System.out.println("----------------- Dados da Rega -----------------\n");

            System.out.printf("ID Setor: %d\n", setorId);
            System.out.printf("Data da operação: %s\n", date);
            System.out.printf("Duração da rega: %dmn\n", duration);
            System.out.printf("Hora da rega: %s\n", hour);
        }

        System.out.println();

        return Utils.getBooleanAnswer("Deseja registrar a operação:");
    }
}
