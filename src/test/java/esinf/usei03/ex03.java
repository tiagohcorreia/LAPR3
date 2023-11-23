package esinf.usei03;

import dataStructure.Distancia;
import esinf.*;
import esinf.map.MapGraph;
import esinf.map.MapGraphLoader;
import esinf.model.Local;
import esinf.store.GraphStore;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import java.io.IOException;
import java.util.*;

import static org.junit.jupiter.api.Assertions.*;

public class ex03 {

    final Graph<String, Integer> completeMap = new MapGraph<>(false);
    Graph<String, Integer> incompleteMap = new MapGraph<>(false);

    public ex03() {
    }

    @BeforeEach
    public void setUp() {

        completeMap.addVertex("Porto");
        completeMap.addVertex("Braga");
        completeMap.addVertex("Vila Real");
        completeMap.addVertex("Aveiro");
        completeMap.addVertex("Coimbra");
        completeMap.addVertex("Leiria");

        completeMap.addVertex("Viseu");
        completeMap.addVertex("Guarda");
        completeMap.addVertex("Castelo Branco");
        completeMap.addVertex("Lisboa");
        completeMap.addVertex("Faro");

        completeMap.addEdge("Porto", "Aveiro", 75);
        completeMap.addEdge("Porto", "Braga", 60);
        completeMap.addEdge("Porto", "Vila Real", 100);
        completeMap.addEdge("Viseu", "Guarda", 75);
        completeMap.addEdge("Guarda", "Castelo Branco", 100);
        completeMap.addEdge("Aveiro", "Coimbra", 60);
        completeMap.addEdge("Coimbra", "Lisboa", 200);
        completeMap.addEdge("Coimbra", "Leiria", 80);
        completeMap.addEdge("Aveiro", "Leiria", 120);
        completeMap.addEdge("Leiria", "Lisboa", 150);

        incompleteMap = completeMap.clone();

        completeMap.addEdge("Aveiro", "Viseu", 85);
        completeMap.addEdge("Leiria", "Castelo Branco", 170);
        completeMap.addEdge("Lisboa", "Faro", 280);
    }

    private void checkContentEquals(List<String> l1, List<String> l2, String msg) {
        Collections.sort(l1);
        Collections.sort(l2);
        assertEquals(l1, l2, msg);
    }

    @Test
    public void testClone() throws IOException {
        GraphStore storage = new GraphStore();
        MapGraphLoader.loadGraph("docs\\esinf_data\\locais_big.csv", "docs\\esinf_data\\distancias_big.csv");
        System.out.println();
        assertEquals(storage.getGraph(), storage.getCloneGraph());
    }


    @Test
    public void testRemoveEdgesAboveAutonomy() throws IOException {
        GraphStore storage = new GraphStore();
        MapGraphLoader.loadGraph("docs\\esinf_data\\locais_big.csv", "docs\\esinf_data\\distancias_big.csv");
        int num = 4;
        int count = 0;
        MapGraph<Local, Integer> atual = storage.removeEdgesAboveAutonomy(1000);
        for (Edge<Local, Integer> g : atual.edges()) {
            if (g != null) count++;
        }

        storage.removeEdgesAboveAutonomy(1000);       // assertEquals(expected,atual);
        assertEquals(num, count);

    }

    @Test
    public void testGetFurthestPlaces() throws IOException {
        GraphStore storage = new GraphStore();
        MapGraphLoader.loadGraph("docs\\esinf_data\\locais_big.csv", "docs\\esinf_data\\distancias_big.csv");
        Distancia data = storage.getFurthestPlaces();

        System.out.println(data);
    }

    @Test
    public void testShortestPath() throws IOException {
        GraphStore storage = new GraphStore();
      MapGraphLoader.loadGraph("docs\\esinf_data\\locais_small.csv", "docs\\esinf_data\\distancias_small.csv");
      MapGraph clone=storage.getGraph();
      LinkedList<Local> shortPath = new LinkedList<>();
        ArrayList<Local> list = clone.vertices();
        Distancia data = storage.getFurthestPlaces();
        System.out.println(clone.edges());

       // Algorithms.shortestPath(clone, data.getLocal1(), data.getLocal2(), shortPath);

        // LinkedList<String> shortPath = new LinkedList<>();
        Integer lenPath = Algorithms.shortestPath(clone, list.get(0), list.get(1), Integer::compare, Integer::sum, 0, shortPath);
       // assertEquals(335, lenPath, "Length path should be 0 if vertices are the same");
       // assertEquals(Arrays.asList("Porto", "Aveiro", "Coimbra", "Lisboa"), shortPath, "Shortest Path Porto - Lisboa");

    }
}



