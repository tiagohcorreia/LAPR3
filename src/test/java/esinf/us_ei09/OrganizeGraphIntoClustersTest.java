package esinf.us_ei09;

import esinf.map.MapGraph;
import esinf.map.MapGraphLoader;
import esinf.model.Local;
import esinf.store.GraphStore;
import esinf.us_ei04.CalculateMinimumSpanningTree;
import org.junit.jupiter.api.Test;

import java.io.IOException;

import static org.junit.jupiter.api.Assertions.*;

class OrganizeGraphIntoClustersTest {

    // Test Small Graph
    @Test
    void testSmallGraph() {

        GraphStore storage = new GraphStore();

        MapGraphLoader.loadGraph("docs/esinf_data/locais_small.csv", "docs/esinf_data/distancias_small.csv");

        MapGraph<Local, Integer> graph = storage.getGraph();

        System.out.println(graph);

        System.out.println(OrganizeGraphIntoClusters.organizeGraph(graph));

        assertNotNull(graph);
    }

    @Test
    void testeNumVerticesSmall() throws IOException {

        GraphStore storage = new GraphStore();

        storage.clean();

        MapGraphLoader.loadGraph("docs/esinf_data/locais_small.csv", "docs/esinf_data/distancias_small.csv");

        MapGraph<Local, Integer> graph = storage.getGraph();

        int expectedNumVertex = 17;
        int result = OrganizeGraphIntoClusters.organizeGraph(graph).size();

        assertNotNull(graph);
        assertEquals(expectedNumVertex, result);
    }

    //=================================================================================================================

    // Test Big graph
    @Test
    void testBigGraph() {

        GraphStore storage = new GraphStore();

        MapGraphLoader.loadGraph("docs/esinf_data/locais_big.csv", "docs/esinf_data/distancias_big.csv");

        MapGraph<Local, Integer> graph = storage.getGraph();

        System.out.println(graph);

        System.out.println(OrganizeGraphIntoClusters.organizeGraph(graph));

        assertNotNull(graph);
    }

    @Test
    void testeNumVerticesBig() throws IOException {

        GraphStore storage = new GraphStore();

        storage.clean();

        MapGraphLoader.loadGraph("docs/esinf_data/locais_big.csv", "docs/esinf_data/distancias_big.csv");

        MapGraph<Local, Integer> graph = storage.getGraph();

        int expectedNumVertex = 323;
        int result = OrganizeGraphIntoClusters.organizeGraph(graph).size();

        assertNotNull(graph);
        assertEquals(expectedNumVertex, result);
    }

    //=================================================================================================================

}