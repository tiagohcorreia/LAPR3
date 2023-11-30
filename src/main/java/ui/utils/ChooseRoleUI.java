package ui.utils;

import ui.user.GestorAgricolaUI;


public class ChooseRoleUI implements Runnable{

    @Override
    public void run() {

        System.out.println("1.Gestor Agricola");

        int option = Utils.readIntegerFromConsole("Escolha o user");

        switch (option) {

            case 1:

                GestorAgricolaUI gestorAgricolaUI = new GestorAgricolaUI();
                gestorAgricolaUI.run();
                break;

            default:

                System.out.println("Opção Inválida");
        }
    }
}
