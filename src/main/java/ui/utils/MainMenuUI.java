package ui.utils;

import java.util.ArrayList;
import java.util.List;

public class MainMenuUI implements Runnable {

    public MainMenuUI() {
    }

    public void run() {

        List<MenuItem> options = new ArrayList<MenuItem>();

        options.add(new MenuItem("Choose role", new ChooseRoleUI()));
        options.add(new MenuItem("Know the DevTeam", new DevTeamUI()));

        int option = 0;

        do {

            option = Utils.showAndSelectIndex(options, "\n\n=============== Projeto Integrador ===============");

            if ((option >= 0) && (option < options.size())) {

                options.get(option).run();
            }

        } while (option != -1);

    }
}
