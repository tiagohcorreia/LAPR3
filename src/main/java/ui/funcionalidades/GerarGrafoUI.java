package ui.funcionalidades;

import esinf.map.MapGraphLoader;
import esinf.store.GraphStore;
import ui.utils.Utils;

import java.util.Scanner;

/**
 * The type Gerar grafo ui.
 */
public class GerarGrafoUI implements Runnable {
    /**
     * The Local.
     */
    String local = "src/test/java/esinf/usei08/files/locais3.csv";
    /**
     * The Distancias.
     */
    String distancias = "src/test/java/esinf/usei08/files/distancias3.csv";

    @Override
    public void run() {
        Scanner scanner = new Scanner(System.in);
        GraphStore graphStore = new GraphStore();

        // para testar estou a usar strings ja predefinidas, depois muda-se.
        //System.out.println("locais file:");
        String localsFilePath = Utils.readLineFromConsole("Introduza o caminho do ficheiro com os locais");

        //System.out.println("distancias file:");
        String distancesFilePath = Utils.readLineFromConsole("Introduza o caminho do ficheiro com as distâncias entre os locais");;

        MapGraphLoader.loadGraph(localsFilePath, distancesFilePath);

        System.out.println("O grafo foi generado com sucesso!");

    }
}
