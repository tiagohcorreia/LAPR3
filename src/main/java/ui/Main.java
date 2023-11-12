package ui;

import controller.RegaController;
import Class.estadoRega;
import ui.utils.ChooseRoleUI;
import ui.utils.MainMenuUI;

import java.util.List;

public class Main {

    public static void main(String[] args) {

        try {

            MainMenuUI mainMenuUI = new MainMenuUI();
            mainMenuUI.run();

        } catch (Exception e) {

            e.printStackTrace();
        }
    }
}

