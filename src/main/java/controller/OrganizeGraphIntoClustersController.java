package controller;

import esinf.map.MapGraph;
import esinf.map.MapGraphLoader;
import esinf.model.Local;
import esinf.store.GraphStore;
import esinf.us_ei09.HubLocal;
import esinf.us_ei09.OrganizeGraphIntoClusters;

import java.util.Map;
import java.util.Set;

public class OrganizeGraphIntoClustersController {

    public OrganizeGraphIntoClustersController() {

    }

    public Map<HubLocal, Set<Local>> organizeSmall() {

        GraphStore storage = new GraphStore();

        storage.clean();

        MapGraphLoader.loadGraph("docs/esinf_data/locais_small.csv", "docs/esinf_data/distancias_small.csv");

        MapGraph<Local, Integer> graph = storage.getGraph();

        return OrganizeGraphIntoClusters.organizeGraph(graph);
    }

    public Map<HubLocal, Set<Local>> organizeBig() {

        GraphStore storage = new GraphStore();

        storage.clean();

        MapGraphLoader.loadGraph("docs/esinf_data/locais_big.csv", "docs/esinf_data/distancias_big.csv");

        MapGraph<Local, Integer> graph = storage.getGraph();

        return OrganizeGraphIntoClusters.organizeGraph(graph);
    }

}
