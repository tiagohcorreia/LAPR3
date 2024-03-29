package ui.user;

import ui.funcionalidades.*;
import ui.funcionalidades.us_ei02.SetHubsUI;
import ui.funcionalidades.us_ei06.GetPossibleRoutesUI;
import ui.funcionalidades.us_ei09.OrganizeGraphIntoClustersUI;
import ui.funcionalidades.us_ei11.LoadHubsFromFileUI;
import ui.menu.MenuItem;
import ui.utils.Utils;

import java.util.ArrayList;
import java.util.List;

/**
 * The type Gestor distribuicao ui.
 */
public class GestorDistribuicaoUI implements Runnable {

    @Override
    public void run() {

        List<MenuItem> options = new ArrayList<MenuItem>();

        options.add(new MenuItem("Gerar Grafo", new GerarGrafoUI()));
        options.add(new MenuItem("Definir hubs", new SetHubsUI()));
        options.add(new MenuItem("Obter rotas possíveis para um hub", new GetPossibleRoutesUI()));
        options.add(new MenuItem("Organizar grafo em clusters (USEI09)", new OrganizeGraphIntoClustersUI()));
        options.add(new MenuItem("Carregar Hubs do ficheiro (USEI11)", new LoadHubsFromFileUI()));
        options.add(new MenuItem("Encontrar melhor circuito com N Hubs (USEI08)", new FindShortestCircuitWithHubsUI()));

        Utils.runMenu(options, "MENU GESTOR DISTRIBUIÇÃO");
    }
}

