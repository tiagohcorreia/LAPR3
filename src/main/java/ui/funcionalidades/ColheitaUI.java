package ui.funcionalidades;


import ui.funcionalidades.ColheitaRegisterUI;

import ui.menu.MenuItem;
import ui.utils.Utils;
import java.util.ArrayList;
import java.util.List;

public class ColheitaUI implements Runnable {

    public ColheitaUI(){
    }

    @Override
    public void run() {
        List<MenuItem> options = new ArrayList<MenuItem>();
        options.add(new MenuItem("Registar uma Colheita", new ColheitaRegisterUI()));
        int option = 0;
        do {
            option = Utils.showAndSelectIndex(options, "\n\nColheita Menu");

            if ((option >= 0) && (option < options.size())) {
                options.get(option).run();
            }
        } while (option != -1);
    }
}
