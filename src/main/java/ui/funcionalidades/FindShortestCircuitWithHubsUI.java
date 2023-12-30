package ui.funcionalidades;

import esinf.map.MapGraphLoader;
import ui.menu.MenuItem;
import esinf.us_ei08.HubShortestPathFinder;
import esinf.us_ei08.GreedyTSP;
import esinf.model.Circuit;
import esinf.model.Hub;
import esinf.model.Local;
import esinf.model.Vehicle;
import esinf.store.GraphStore;
import esinf.Edge;
import esinf.Graph;

import java.util.List;
import java.util.Scanner;

public class FindShortestCircuitWithHubsUI implements Runnable {

    private GraphStore graphStore = new GraphStore();
    private MapGraphLoader mapGraphLoader = new MapGraphLoader();

    @Override
    public void run() {
        Scanner scanner = new Scanner(System.in);

        String pathToLocaisCSV = "src/test/java/esinf/usei08/files/locais3.csv";
        String pathToDistanciasCSV = "src/test/java/esinf/usei08/files/distancias3.csv";
        MapGraphLoader.loadGraph(pathToLocaisCSV, pathToDistanciasCSV);

        // Get input for the hub shortest path finder
        System.out.println("Enter the local ID of the origin hub:");
        String originHubId = scanner.nextLine();
        Local originLocal = graphStore.getGraph().vertices().stream()
                .filter(local -> local.getLocalId().equals(originHubId))
                .findFirst()
                .orElse(null);

        if (originLocal == null) {
            System.out.println("Local not found in the graph.");
            return;
        }

        System.out.println("Enter the number of hubs to visit (5, 6, or 7):");
        int numHubs;
        while (true) {
            numHubs = scanner.nextInt();
            if (numHubs == 5 || numHubs == 6 || numHubs == 7) {
                break;
            } else {
                System.out.println("Invalid input. Please enter 5, 6, or 7.");
            }
        }


        Vehicle vehicle = new Vehicle(1, 1500, 60, 90);

        // Create and execute the hub shortest path finder
        HubShortestPathFinder<Local, Integer> pathFinder = new HubShortestPathFinder<>(graphStore.getGraph());
        Circuit result = pathFinder.findShortestCircuitWithHubs(graphStore.getGraph(), originLocal, numHubs, vehicle, graphStore.getGraph().numVertices());

        // Print the result
        result.printDetails();
    }

    @Override
    public String toString() {
        return "Find Shortest Circuit with Hubs";
    }
}
