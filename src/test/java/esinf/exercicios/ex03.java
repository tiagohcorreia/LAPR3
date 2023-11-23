package esinf.exercicios;

import dataStructure.Distancia;
import esinf.*;
import esinf.map.MapGraph;
import esinf.map.MapGraphLoader;
import esinf.model.Local;
import esinf.store.GraphStore;
import org.junit.jupiter.api.Test;

import java.io.IOException;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.Objects;

import static org.junit.jupiter.api.Assertions.*;

public class ex03 {


    @Test
    public void testClone() throws IOException {
        GraphStore storage = new GraphStore();
        MapGraphLoader.loadGraph("docs\\esinf_data\\locais_big.csv", "docs\\esinf_data\\distancias_big.csv");
        System.out.println(GraphStore.getGraph());
        System.out.println();
        assertEquals(GraphStore.getGraph(), storage.getCloneGraph());
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
        Graph<Local, Integer> clone = MapGraphLoader.loadGraph("docs\\esinf_data\\locais_big.csv", "docs\\esinf_data\\distancias_big.csv");
        LinkedList<Local> shortPath = new LinkedList<>();
        ArrayList<Local> list = clone.vertices();
        Distancia data = storage.getFurthestPlaces();

        Algorithms.shortestPath(clone, data.getLocal1(), data.getLocal2(), shortPath);

    }
}



