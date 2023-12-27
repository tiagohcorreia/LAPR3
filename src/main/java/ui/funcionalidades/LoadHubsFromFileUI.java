package ui.funcionalidades;

import controller.LoadHubsFromFileController;

public class LoadHubsFromFileUI implements Runnable {

    private LoadHubsFromFileController controller;

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
