package esinf.usei04;

import esinf.map.MapGraph;
import esinf.map.MapGraphLoader;
import esinf.matrix.MatrixGraph;
import org.junit.jupiter.api.Test;

import java.io.IOException;

import static org.junit.jupiter.api.Assertions.*;

class CalculateMinimumSpanningTreeTest {

    @Test
    void testeSmallLocaisDistancias() throws IOException {

       MapGraph<String, Integer> graph =  MapGraphLoader.loadGraph("docs/esinf_data/locais_small.csv", "docs/esinf_data/distancias_small.csv");
    }

    @Test
    void testeBigLocaisDistancias() throws IOException {

        MapGraph<String, Integer> graph =  MapGraphLoader.loadGraph("docs/esinf_data/locais_big.csv", "docs/esinf_data/distancias_big.csv");
    }

}