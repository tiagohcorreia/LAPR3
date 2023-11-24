package esinf.usei04;

import esinf.map.MapGraph;
import esinf.map.MapGraphLoader;
import esinf.matrix.MatrixGraph;
import esinf.model.Local;
import org.junit.jupiter.api.Test;

import java.io.IOException;

import static org.junit.jupiter.api.Assertions.*;

class CalculateMinimumSpanningTreeTest {

    @Test
    void testGraph() throws IOException {

        MapGraph<Local, Integer> graph = MapGraphLoader.loadGraph("docs/esinf_data/locais_small.csv", "docs/esinf_data/distancias_small.csv");
        System.out.println(graph);
        assertNotNull(graph);
    }

    @Test
    void testGraph2() throws IOException {

        MapGraph<Local, Integer> graph = MapGraphLoader.loadGraph("docs/esinf_data/locais_big.csv", "docs/esinf_data/distancias_big.csv");
        System.out.println(graph);
        assertNotNull(graph);
    }

    @Test
    void testeSmallLocaisDistancias() throws IOException {

       MapGraph<Local, Integer> graph =  MapGraphLoader.loadGraph("docs/esinf_data/locais_small.csv", "docs/esinf_data/distancias_small.csv");
    }

    @Test
    void testeBigLocaisDistancias() throws IOException {

        MapGraph<Local, Integer> graph =  MapGraphLoader.loadGraph("docs/esinf_data/locais_big.csv", "docs/esinf_data/distancias_big.csv");
    }

}