package esinf.usei04;

import esinf.map.MapGraph;
import esinf.map.MapGraphLoader;
import esinf.matrix.MatrixGraph;
import esinf.model.Local;
import esinf.store.GraphStore;
import org.junit.jupiter.api.Test;

import java.io.IOException;

import static org.junit.jupiter.api.Assertions.*;

class CalculateMinimumSpanningTreeTest {

    //==================================================================================================================
    /*@Test
    void testSmallGraph() throws IOException {

        GraphStore storage = new GraphStore();

        MapGraphLoader.loadGraph("docs/esinf_data/locais_small.csv", "docs/esinf_data/distancias_small.csv");

        MapGraph<Local, Integer> graph = storage.getGraph();

        System.out.println(graph);

        System.out.println(CalculateMinimumSpanningTree.calculateMinimumSpanningTreeWithKruskal(graph));

        assertNotNull(graph);
    }*/

    // Test Small Graph
    @Test
    void testNumEdgesSmall() throws IOException {

        GraphStore storage = new GraphStore();

        storage.clean();

        MapGraphLoader.loadGraph("docs/esinf_data/locais_small.csv", "docs/esinf_data/distancias_small.csv");

        MapGraph<Local, Integer> graph = storage.getGraph();

        int expeted = 16;
        int result = CalculateMinimumSpanningTree.calculateMinimumSpanningTreeWithKruskal(graph).getGraph().numEdges();

        assertEquals(expeted, result);
    }

    @Test
    void testeSmallLocaisDistancias() throws IOException {

        GraphStore storage = new GraphStore();

        storage.clean();

        MapGraphLoader.loadGraph("docs/esinf_data/locais_small.csv", "docs/esinf_data/distancias_small.csv");

        MapGraph<Local, Integer> graph = storage.getGraph();

        int expectedNumVertex = 17;
        int result = CalculateMinimumSpanningTree.calculateMinimumSpanningTreeWithKruskal(graph).getGraph().numVertices();

        assertEquals(expectedNumVertex, result);
    }

    @Test
    void testeTotalPesoSmallLocaisDistancias() throws IOException {

        GraphStore storage = new GraphStore();

        storage.clean();

        MapGraphLoader.loadGraph("docs/esinf_data/locais_small.csv", "docs/esinf_data/distancias_small.csv");

        MapGraph<Local, Integer> graph = storage.getGraph();

        CalculateMinimumSpanningTree.calculateMinimumSpanningTreeWithKruskal(graph);

        int expextedPesoTotal = 1185232;
        int result = CalculateMinimumSpanningTree.calculateMinimumSpanningTreeWithKruskal(graph).getPesoTotal();

        assertEquals(expextedPesoTotal, result);
    }


    //==================================================================================================================

    /*@Test
    void testGraph2() throws IOException {

        GraphStore storage = new GraphStore();

        MapGraphLoader.loadGraph("docs/esinf_data/locais_big.csv", "docs/esinf_data/distancias_big.csv");

        MapGraph<Local, Integer> graph = storage.getGraph();

        //System.out.println(graph);

        System.out.println(CalculateMinimumSpanningTree.calculateMinimumSpanningTreeWithKruskal(graph));

        assertNotNull(graph);
    }*/

    // Test Big Graph
    @Test
    void testNumEdgesBig() throws IOException {

        GraphStore storage = new GraphStore();

        storage.clean();

        MapGraphLoader.loadGraph("docs/esinf_data/locais_big.csv", "docs/esinf_data/distancias_big.csv");

        MapGraph<Local, Integer> graph = storage.getGraph();

        int expeted = 322;
        int result = CalculateMinimumSpanningTree.calculateMinimumSpanningTreeWithKruskal(graph).getGraph().numEdges();

        assertEquals(expeted, result);
    }

    @Test
    void testeVertexBigLocaisDistancias() throws IOException {

        GraphStore storage = new GraphStore();

        storage.clean();

        MapGraphLoader.loadGraph("docs/esinf_data/locais_big.csv", "docs/esinf_data/distancias_big.csv");

        MapGraph<Local, Integer> graph = storage.getGraph();

        int expectedNumVertex = 323;
        int result = CalculateMinimumSpanningTree.calculateMinimumSpanningTreeWithKruskal(graph).getGraph().numVertices();

        assertEquals(expectedNumVertex, result);
    }

    @Test
    void testeTotalPesoBigLocaisDistancias() throws IOException {

        GraphStore storage = new GraphStore();

        storage.clean();

        MapGraphLoader.loadGraph("docs/esinf_data/locais_big.csv", "docs/esinf_data/distancias_big.csv");

        MapGraph<Local, Integer> graph = storage.getGraph();

        CalculateMinimumSpanningTree.calculateMinimumSpanningTreeWithKruskal(graph);

        int expextedPesoTotal = 4231982;
        int result = CalculateMinimumSpanningTree.calculateMinimumSpanningTreeWithKruskal(graph).getPesoTotal();

        assertEquals(expextedPesoTotal, result);
    }
}