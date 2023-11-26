package esinf.map;

import esinf.model.Local;
import esinf.store.GraphStore;
import org.junit.jupiter.api.Test;

import java.io.IOException;

import static esinf.map.MapGraphLoader.loadGraph;

class MapGraphLoaderTest {


    @Test
    public void testGraph() {

        MapGraphLoader.loadGraph("docs\\esinf_data\\locais_big.csv", "docs\\esinf_data\\distancias_big.csv");
        GraphStore storage = new GraphStore();
        MapGraph<Local, Integer> distributionNetwork = storage.getGraph();  // Now you have a MapGraph representing your distribution network
        System.out.println(distributionNetwork);

    }


}