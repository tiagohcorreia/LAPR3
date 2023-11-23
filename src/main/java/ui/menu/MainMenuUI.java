package ui.menu;

import ui.*;
import ui.funcionalidades.ColheitaUI;
import ui.funcionalidades.EstadoRegaUI;
import ui.funcionalidades.SimularSistemaRegaUI;
import ui.utils.ChooseRoleUI;
import ui.utils.Utils;

import java.util.ArrayList;
import java.util.List;

public class MainMenuUI implements Runnable {

    public MainMenuUI() {
    }

    @Override
    public void run() {

        List<MenuItem> options = new ArrayList<MenuItem>();

        options.add(new MenuItem("Teste conexao com base de dados", new DatabaseConnectionTestUI()));
        options.add(new MenuItem("Database Connection Test", new DatabaseConnectionTestUI()));
        options.add(new MenuItem("Gerar Plano de Rega", new SimularSistemaRegaUI()));
        options.add(new MenuItem("Verificar Estado da Rega", new EstadoRegaUI()));
        options.add(new MenuItem("Escolher User", new ChooseRoleUI()));
        options.add(new MenuItem("Exit", new ExitUI()));

        int option = 0;

        do {
            option = Utils.showAndSelectIndex(options, "\n\nMenu principal");

            if ((option >= 0) && (option < options.size())) {
                options.get(option).run();
            }
        } while (option != -1);
    }
}
