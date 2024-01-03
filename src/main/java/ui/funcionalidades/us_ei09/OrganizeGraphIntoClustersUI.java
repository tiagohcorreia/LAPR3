package ui.funcionalidades.us_ei09;

import controller.OrganizeGraphIntoClustersController;
import ui.user.GestorDistribuicaoUI;
import ui.utils.Utils;

public class OrganizeGraphIntoClustersUI implements Runnable {

    private final OrganizeGraphIntoClustersController controller = new OrganizeGraphIntoClustersController();

    @Override
    public void run() {

        System.out.println("1. Ficheiro Small");
        System.out.println("2. Ficheiro Big");
        System.out.println();

        try {

            int option = Utils.readIntegerFromConsole("Escolha o ficheiro");

            switch (option) {

                case 1:
                    System.out.println(this.controller.organizeSmall());
                    break;

                case 2:
                    System.out.println(this.controller.organizeBig());
                    break;

                default:
                    System.out.println("Opção Inválida");
                    break;
            }

        } catch (Exception e) {

            System.err.println(e.getMessage());
        }
    }
}
