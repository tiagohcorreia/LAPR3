package ui.user;

import ui.funcionalidades.*;
import ui.menu.MenuItem;
import ui.utils.Utils;

import java.util.ArrayList;
import java.util.List;

public class GestorDistribuicaoUI implements Runnable {

    @Override
    public void run() {

        List<MenuItem> options = new ArrayList<MenuItem>();

        options.add(new MenuItem("Obter rotas possíveis para um hub", new GetPossibleRoutesUI()));

        Utils.runMenu(options, "MENU GESTOR DISTRIBUIÇÃO:");
    }
}
