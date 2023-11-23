package esinf.map;

import esinf.model.Local;
import org.junit.jupiter.api.Test;

import java.io.IOException;

import static esinf.map.MapGraphLoader.loadGraph;

class MapGraphLoaderTest {


    @Test
    public void testGraph() {
        try {
            MapGraph<Local, Integer> distributionNetwork = loadGraph("docs\\esinf_data\\locais_big.csv", "docs\\esinf_data\\distancias_big.csv");
            // Now you have a MapGraph representing your distribution network
            System.out.println(distributionNetwork);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }


}