package esinf.us_ei11;

import esinf.map.MapGraph;
import esinf.map.MapGraphLoader;
import esinf.model.Local;
import esinf.store.GraphStore;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.assertTrue;

class LoadHubsFromFileTest {

    @Test
    void testLoadHubs1() {

        GraphStore graphStore = new GraphStore();

        MapGraphLoader.loadGraph("docs/esinf_data/locais_small.csv", "docs/esinf_data/distancias_small.csv");

        MapGraph<Local, Integer> graph = graphStore.getGraph();

        assertTrue(LoadHubsFromFile.loadHubsFormFile());
    }


}