package ui.user;

import ui.funcionalidades.ColheitaUI;
import ui.funcionalidades.MondaRegisterUI;
import ui.funcionalidades.SementeiraRegisterUI;
import ui.menu.MenuItem;
import ui.utils.Utils;

import java.util.ArrayList;
import java.util.List;

public class GestorAgricolaUI implements Runnable {

    public GestorAgricolaUI() {

    }

    @Override
    public void run() {

        List<MenuItem> options = new ArrayList<MenuItem>();

        options.add(new MenuItem("Registar Sementeira", new SementeiraRegisterUI()));
        options.add(new MenuItem("Registar Colheita", new ColheitaUI()));
        options.add(new MenuItem("Registar Monda", new MondaRegisterUI()));

        int option = 0;

        do {
            option = Utils.showAndSelectIndex(options, "\n\nMain Menu");

            if ((option >= 0) && (option < options.size())) {
                options.get(option).run();
            }

        } while (option != -1);
    }
}

