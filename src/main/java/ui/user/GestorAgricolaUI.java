package ui.user;

import ui.funcionalidades.*;
import ui.menu.MenuItem;
import ui.utils.Utils;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class GestorAgricolaUI implements Runnable {

    public GestorAgricolaUI() {

    }

    @Override
    public void run() {

        List<MenuItem> options = new ArrayList<MenuItem>();

        options.add(new MenuItem("Registar Sementeira", new SementeiraRegisterUI()));
        options.add(new MenuItem("Registar Monda", new MondaRegisterUI()));
        options.add(new MenuItem("Registar Poda", new RegisterPruningUI()));


        int option = 0;

        do {
            option = Utils.showAndSelectIndex(options, "\n\nMain Menu");

            if ((option >= 0) && (option < options.size())) {
                options.get(option).run();
            }

        } while (option != -1);
    }
}

