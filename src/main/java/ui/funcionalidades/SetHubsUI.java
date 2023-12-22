package ui.funcionalidades;

import controller.SetHubsCtrl;
import esinf.dataStructure.VertexMetrics;
import esinf.model.Local;
import ui.user.GestorDistribuicaoUI;
import ui.utils.Utils;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class SetHubsUI implements Runnable {

    SetHubsCtrl ctrl = new SetHubsCtrl();
    private int numberOFHubs;
    List<VertexMetrics<Local, Integer>> idealLocals;
    Map<Local, Integer> localsAndDischargeTimes;

    @Override
    public void run() {
        int numberOfHubs=getNumberOFHubs();

        if (numberOfHubs>0){

            displayIdealLocals();

            boolean in = askToGenerateHubs();
            if (in) {
                askDischargeTimes();
                boolean out = ctrl.generateHubs(localsAndDischargeTimes);
                if (out) {
                    System.out.println("Hubs gerados com sucesso");
                } else System.out.println("Houve um erro ao gerar os hubs");
            }
        }

        System.out.println();
    }

    public int getNumberOFHubs() {
        boolean b = false;

        do {
            numberOFHubs = Utils.readIntegerFromConsole("Introduza o número de locais ideais pretendidos:");

            if (numberOFHubs > ctrl.getNumberOfLocals()) {
                System.out.println("O número indicado é maior que o número de locais registrados no sistema");
            } else b = true;

        } while (!b);

        return numberOFHubs;
    }

    public void displayIdealLocals() {
        idealLocals = ctrl.getIdealLocalsForHubs(numberOFHubs);
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
        System.out.println("Introduza os tempos de descarga para cada hub:");
        System.out.println();

        for (VertexMetrics<Local, Integer> vm : idealLocals) {
            Local local = vm.getVertex();
            System.out.printf("Local: %s", local.getLocalId());
            int dischargeTime = Utils.readIntegerFromConsole("");
            localsAndDischargeTimes.put(local, dischargeTime);
        }
    }

    public void exit(){
        new GestorDistribuicaoUI().run();
    }
}
