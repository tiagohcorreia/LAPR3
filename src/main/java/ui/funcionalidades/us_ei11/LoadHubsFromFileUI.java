package ui.funcionalidades.us_ei11;

import controller.LoadHubsFromFileController;

/**
 * The type Load hubs from file ui.
 */
public class LoadHubsFromFileUI implements Runnable {

    private final LoadHubsFromFileController controller = new LoadHubsFromFileController();

    @Override
    public void run() {

        System.out.println("Carregar Hubs do Ficheiro");

        if (controller.loadHubs()) {

            System.out.println("Ficheiro carregado com successo");

        } else {

            System.out.println("Não foi possível carregar o ficheiro");
        }
    }
}
