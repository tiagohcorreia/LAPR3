package ui.utils;

import ui.user.GestorAgricolaUI;
import ui.user.ProductOwnerUI;

public class ChooseRoleUI implements Runnable{

    @Override
    public void run() {

        System.out.println("1.Gestor Agricola");
        System.out.println("2.Product Owner");

        int option = Utils.readIntegerFromConsole("Choose your role");

        switch (option) {

            case 1:

                GestorAgricolaUI gestorAgricolaUI = new GestorAgricolaUI();
                gestorAgricolaUI.run();
                break;

            case 2:

                ProductOwnerUI productOwnerUI = new ProductOwnerUI();
                productOwnerUI.run();
                break;

            default:

                System.out.println("Opção Inválida");
        }
    }
}
