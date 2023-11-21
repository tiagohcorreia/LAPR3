package esinf.map;

import esinf.Algorithms;
import esinf.Graph;
import esinf.store.GraphStore;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import java.io.IOException;
import java.util.*;

import static esinf.map.MapGraphLoader.loadGraph;
import static org.junit.jupiter.api.Assertions.*;

class MapGraphLoaderTest {


    @Test
    public void testGraph() {
        try {
            MapGraph<String, Integer> distributionNetwork = loadGraph("docs\\esinf_data\\locais_big.csv", "docs\\esinf_data\\distancias_big.csv");
            // Now you have a MapGraph representing your distribution network
            System.out.println(distributionNetwork);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

}