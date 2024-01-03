package ui.utils;

import ui.menu.MenuItem;
import ui.user.gestor_agricola.GestorAgricolaUI;
import ui.user.GestorDistribuicaoUI;

import java.util.ArrayList;
import java.util.List;


public class ChooseRoleUI implements Runnable{

    @Override
    public void run() {

        List<MenuItem> options = new ArrayList<ui.menu.MenuItem>();

        options.add(new ui.menu.MenuItem("Gestor Agrícola", new GestorAgricolaUI()));
        options.add(new ui.menu.MenuItem("Gestor Distribuição", new GestorDistribuicaoUI()));

        Utils.runMenu(options, "MENU UTILIZADORES");
    }
}
