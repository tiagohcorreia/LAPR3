package controller;

import esinf.map.MapGraph;
import esinf.map.MapGraphLoader;
import esinf.model.Local;
import esinf.store.GraphStore;
import esinf.us_ei09.HubLocal;
import esinf.us_ei09.OrganizeGraphIntoClusters;

import java.util.Map;
import java.util.Set;

/**
 * The type Organize graph into clusters controller.
 */
public class OrganizeGraphIntoClustersController {

    /**
     * Instantiates a new Organize graph into clusters controller.
     */
    public OrganizeGraphIntoClustersController() {

    }

    /**
     * Organize small map.
     *
     * @return the map
     */
    public Map<HubLocal, Set<Local>> organizeSmall() {

        GraphStore storage = new GraphStore();

        storage.clean();

        MapGraphLoader.loadGraph("docs/esinf_data/locais_small.csv", "docs/esinf_data/distancias_small.csv");

        MapGraph<Local, Integer> graph = storage.getGraph();

        return OrganizeGraphIntoClusters.organizeGraph(graph);
    }

    /**
     * Organize big map.
     *
     * @return the map
     */
    public Map<HubLocal, Set<Local>> organizeBig() {

        GraphStore storage = new GraphStore();

        storage.clean();

        MapGraphLoader.loadGraph("docs/esinf_data/locais_big.csv", "docs/esinf_data/distancias_big.csv");

        MapGraph<Local, Integer> graph = storage.getGraph();

        return OrganizeGraphIntoClusters.organizeGraph(graph);
    }

}
