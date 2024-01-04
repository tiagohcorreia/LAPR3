package esinf.us_ei09;

import esinf.CommonGraph;
import esinf.Graph;
import esinf.map.MapGraph;
import esinf.map.MapGraphLoader;
import esinf.model.Local;
import esinf.store.GraphStore;
import esinf.us_ei04.CalculateMinimumSpanningTree;
import org.junit.jupiter.api.Test;

import java.io.IOException;
import java.util.Map;
import java.util.Set;

import static org.junit.jupiter.api.Assertions.*;

class OrganizeGraphIntoClustersTest {

    // Test Small Graph
    /*@Test
    void testSmallGraph() {

        GraphStore storage = new GraphStore();

        MapGraphLoader.loadGraph("docs/esinf_data/locais_small.csv", "docs/esinf_data/distancias_small.csv");

        MapGraph<Local, Integer> graph = storage.getGraph();

        System.out.println(graph);

        System.out.println(OrganizeGraphIntoClusters.organizeGraph(graph));

        assertNotNull(graph);
    }*/

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
   /* @Test
    void testBigGraph() {

        GraphStore storage = new GraphStore();

        MapGraphLoader.loadGraph("docs/esinf_data/locais_big.csv", "docs/esinf_data/distancias_big.csv");

        MapGraph<Local, Integer> graph = storage.getGraph();

        System.out.println(graph);

        System.out.println(OrganizeGraphIntoClusters.organizeGraph(graph));

        assertNotNull(graph);
    }*/

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

    @Test
    void organizeGraph_shouldReturnCorrectClusters() {

        // Criar um grafo de exemplo
        MapGraph graph = new MapGraph(false);

        // Adicionar localidades ao grafo
        Local localA = new Local("A");
        Local localB = new Local("B");
        Local localC = new Local("C");
        Local localD = new Local("D");


        // Adicionar os vértices
        graph.addVertex(localA);
        graph.addVertex(localB);
        graph.addVertex(localC);
        graph.addVertex(localD);


        // Adicionar arestas ao grafo
        graph.addEdge(localA, localB, 1);
        graph.addEdge(localA, localC, 2);
        graph.addEdge(localB, localC, 1);
        graph.addEdge(localC, localD, 3);

        Map<HubLocal, Set<Local>> result = OrganizeGraphIntoClusters.organizeGraph(graph);

        // Verificar se o resultado está correto
        assertEquals(2, result.size()); // Deve haver 2 hubs (clusters) neste exemplo
    }

}