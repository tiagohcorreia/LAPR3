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
        System.out.println("locais file:");
        String localsFilePath = local;

        System.out.println("distancias file:");
        String distancesFilePath = distancias;

        MapGraphLoader.loadGraph(localsFilePath, distancesFilePath);

        System.out.println("O grafo foi generado com sucesso!");

    }
}
