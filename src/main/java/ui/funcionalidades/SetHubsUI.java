package ui.funcionalidades;

import controller.SetHubsCtrl;
import esinf.dataStructure.VertexMetrics;
import esinf.model.Local;
import ui.utils.Utils;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class SetHubsUI implements Runnable {

    SetHubsCtrl ctrl = new SetHubsCtrl();
    private int numberOfHubs;
    List<VertexMetrics<Local, Integer>> idealLocals;
    Map<Local, Integer> localsAndDischargeTimes;

    @Override
    public void run() {
        numberOfHubs=getNumberOFHubs();

        if (numberOfHubs > 0){

            displayIdealLocals();
            boolean in = askToGenerateHubs();

            if (in) {
                askDischargeTimes();
                boolean out = ctrl.generateHubs(localsAndDischargeTimes);

                if (out) {
                    System.out.println("Hubs gerados com sucesso\n");
                } else System.out.println("Houve um erro ao gerar os hubs\n");
            }
        }
    }

    public int getNumberOFHubs() {
        int numberOfHubs;
        boolean valid = false;
        int numberOfSimpleLocals=ctrl.getNumberOfSimpleLocals();

        do {
            numberOfHubs = Utils.readPositiveIntegerFromConsole("Introduza o número de locais ideais pretendidos:");

            if (numberOfHubs > numberOfSimpleLocals) {
                System.out.println("ERRO: O número indicado é maior que o número de locais registrados no sistema\n");
            } else valid = true;

        } while (!valid);

        return numberOfHubs;
    }

    public void displayIdealLocals() {
        idealLocals = ctrl.getIdealLocalsForHubs(numberOfHubs);
        for (VertexMetrics<Local, Integer> vm : idealLocals) {
            System.out.printf("Local: %-10s | Centrality: %-10d | Influence: %-10d | Proximity: %-10d%n", vm.getVertex().getLocalId(), vm.getCentrality(), vm.getInfluence(), vm.getProximity());
        }
        System.out.println();
    }

    public boolean askToGenerateHubs() {

        return Utils.getBooleanAnswer("Pretende gerar os hubs?");
    }

    public void askDischargeTimes() {
        localsAndDischargeTimes = new HashMap<>();
        System.out.println("Introduza os tempos de descarga, em minutos, para cada hub:\n");

        for (VertexMetrics<Local, Integer> vm : idealLocals) {
            Local local = vm.getVertex();
            int dischargeTime = Utils.readPositiveIntegerFromConsole(String.format("Local: %s", local.getLocalId()));
            localsAndDischargeTimes.put(local, dischargeTime);
        }
    }
}
