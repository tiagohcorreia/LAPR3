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

        options.add(new MenuItem("Definir hubs", new SetHubsUI()));
        options.add(new MenuItem("Obter rotas possíveis para um hub", new GetPossibleRoutesUI()));
        options.add(new MenuItem("Organizar grafo em clusters (USEI09)", new OrganizeGraphIntoClustersUI()));

        Utils.runMenu(options, "MENU GESTOR DISTRIBUIÇÃO");
    }
}

