package ui.funcionalidades;

import esinf.map.MapGraphLoader;
import esinf.store.GraphStore;

import java.util.Scanner;

public class GerarGrafoUI implements Runnable {
    String local = "src/test/java/esinf/usei08/files/locais3.csv";
    String distancias = "src/test/java/esinf/usei08/files/distancias3.csv";

    @Override
    public void run() {
        Scanner scanner = new Scanner(System.in);
        GraphStore graphStore = new GraphStore();

        // para testar estou a usar strings ja predefinidas, depois muda-se.
        System.out.println("Enter the file path for the locals CSV:");
        String localsFilePath = local;

        System.out.println("Enter the file path for the distances CSV:");
        String distancesFilePath = distancias;

        MapGraphLoader.loadGraph(localsFilePath, distancesFilePath);

        System.out.println("Graph has been generated successfully!");

        // Return to the menu
        System.out.println("Press Enter to go back to the main menu...");
        scanner.nextLine();
    }
}
