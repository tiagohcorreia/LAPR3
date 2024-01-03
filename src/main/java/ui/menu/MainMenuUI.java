package ui.menu;

import ui.*;
import ui.utils.ChooseRoleUI;
import ui.utils.DevTeamUI;
import ui.utils.Utils;

import java.util.ArrayList;
import java.util.List;

/**
 * The type Main menu ui.
 */
public class MainMenuUI implements Runnable {

    /**
     * Instantiates a new Main menu ui.
     */
    public MainMenuUI() {
    }

    @Override
    public void run() {

        List<MenuItem> options = new ArrayList<MenuItem>();

        options.add(new MenuItem("Teste conexao com base de dados", new DatabaseConnectionTestUI()));
        options.add(new MenuItem("Escolher User", new ChooseRoleUI()));
        options.add(new MenuItem("Conhecer equipa de desenvolvimento", new DevTeamUI()));
        options.add(new MenuItem("Exit", new ExitUI()));

        Utils.runMenu(options, "MENU PRINCIPAL");
        /*int option = 0;

        do {
            option = Utils.showAndSelectIndex(options, "\n\nMenu principal");

            if ((option >= 0) && (option < options.size())) {
                options.get(option).run();
            }
        } while (option != -1);*/
    }
}
