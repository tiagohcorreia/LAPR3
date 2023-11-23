package ui.menu;

import ui.*;
import ui.utils.Utils;
import java.util.ArrayList;
import java.util.List;

public class MainMenuUI implements Runnable {

    public MainMenuUI(){
    }

    @Override
    public void run() {
        List<MenuItem> options = new ArrayList<MenuItem>();
        options.add(new MenuItem("Database Connection Test", new DatabaseConnectionTestUI()));
        options.add(new MenuItem("Colheitas", new ColheitaUI()));
        options.add(new MenuItem("Exit", new ExitUI()));
        int option = 0;
        do {
            option = Utils.showAndSelectIndex(options, "\n\nMain Menu");

            if ((option >= 0) && (option < options.size())) {
                options.get(option).run();
            }
        } while (option != -1);
    }
}
