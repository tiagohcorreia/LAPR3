package ui.funcionalidades;

import esinf.Edge;
import esinf.IntegerBinaryOperator;
import esinf.IntegerComparator;
import esinf.model.Hub;
import esinf.model.Local;
import esinf.model.Path;
import esinf.store.GraphStore;
import esinf.us_ei06.PossibleRoutes;
import ui.utils.Utils;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Scanner;

public class GetPossibleRoutesUI implements Runnable {

    Scanner in = new Scanner(System.in);
    private GraphStore graphStore = new GraphStore();
    private Local origin;
    private Hub destiny;
    private int autonomy;
    private int vehicleSpeed;
    private PossibleRoutes<Local, Integer> possibleRoutes = new PossibleRoutes<>(
            graphStore.getGraph(),
            new IntegerBinaryOperator(),
            new IntegerComparator(),
            0);

    @Override
    public void run() {
        ArrayList<Local> locals = graphStore.getGraph().vertices();
        getOrigin(locals);
        getDestiny(locals);
        getAutonomy();
        getVehicleSpeed();
        possibleRoutes.calculatePossibleRoutes(origin, destiny, autonomy);
        printRoutes();
    }

    public void getOrigin(ArrayList<Local> locals) {
        origin = showAndSelectLocal(locals, "Selecione o local de partida:");
    }

    public void getDestiny(ArrayList<Local> locals) {
        ArrayList<Hub> hubs = new ArrayList<>();

        for (Local l : locals) {
            if (!l.equals(origin) &&
                    l instanceof Hub) {
                hubs.add((Hub) l);
            }
        }

        destiny = showAndSelectLocal(hubs, "Selecione o hub de destino:");
    }

    public void getAutonomy() {
        autonomy = Utils.readIntegerFromConsole("Introduza a autonomia (em Km) do veículo:");
    }

    public void getVehicleSpeed() {
        vehicleSpeed = Utils.readIntegerFromConsole("Introduza a velocidade média (em Km/h) do veículo:");
    }

    public void printRoutes() {
        ArrayList<Path<Local>> paths = possibleRoutes.getRoutes();
        Map<Path<Local>, ArrayList<Edge<Local, Integer>>> routesAndSimpleDistances = possibleRoutes.getRoutesAndSimpleDistances();
        Map<Path<Local>, Integer> routesAndTotalDistances = possibleRoutes.getRoutesAndTotalDistances();

        System.out.printf("Rotas entre %s e %s, considerando uma autonomia de %d km %n%n", origin.getLocalId(), destiny.getLocalId(), autonomy);

        for (int i = 0; i < paths.size(); i++) {
            Path<Local> path = paths.get(i);
            System.out.printf("Rota %d: %n", (i + 1));

            for (Local l : path.getRoute()) {
                if (l instanceof Hub) {
                    System.out.printf("Local: %s (Hub) %n", l.getLocalId());
                } else {
                    System.out.printf("Local: %s %n", l.getLocalId());
                }
            }
            System.out.println();

            System.out.println("Distâncias entre os locais:");
            ArrayList<Edge<Local, Integer>> simpleDistances = routesAndSimpleDistances.get(path);
            for (Edge<Local, Integer> e : simpleDistances) {
                System.out.printf("%s - %s: %d km %n", e.getVOrig().getLocalId(), e.getVDest().getLocalId(), e.getWeight());
            }
            System.out.println();

            int totalDistance = routesAndTotalDistances.get(path);
            System.out.printf("Distância total da rota: %d %n", totalDistance);
            System.out.printf("Duração média da rota: %d %n", autonomy / totalDistance);
            System.out.println();
            System.out.println();
            System.out.println();
        }
    }

    private <E extends Local> E showAndSelectLocal(List<E> list, String header) {
        showList(list, header);
        return selectLocal(list);
    }

    private <E extends Local> void showList(List<E> list, String header) {
        System.out.println(header);

        int index = 0;
        for (Local o : list) {
            index++;
            System.out.println(index + ". " + o.getLocalId());
        }
        System.out.println();
        System.out.println("0 - Cancel");
    }

    private <E extends Local> E selectLocal(List<E> list) {
        String input;
        int value;

        do {
            input = Utils.readLineFromConsole("Insira uma opcao: ");
            value = Integer.parseInt(input);
        } while (value < 0 || value > list.size());

        if (value == 0) {
            return null;
        } else {
            return list.get(value - 1);
        }
    }
}
