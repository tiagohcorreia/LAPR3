package esinf.exercicios;

import esinf.Edge;
import esinf.map.MapGraph;
import esinf.map.MapGraphLoader;
import esinf.model.Distancia;
import esinf.model.Local;
import esinf.store.GraphStore;
import org.junit.jupiter.api.Test;

import java.io.IOException;
import java.util.ArrayList;
import java.util.LinkedList;

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
        MapGraph<Local, Distancia> atual = storage.removeEdgesAboveAutonomy(1000);
        for (Edge<Local, Distancia> g : atual.edges()) {
            if (g != null) count++;
        }

        storage.removeEdgesAboveAutonomy(1000);       // assertEquals(expected,atual);
        assertEquals(num, count);

    }

    @Test
    public void testGetFurthestPlaces() throws IOException {
        GraphStore storage = new GraphStore();
        MapGraphLoader.loadGraph("docs\\esinf_data\\locais_big.csv", "docs\\esinf_data\\distancias_big.csv");
        String[] data=storage.getFurthestPlaces();

        for (String s:data
             ) {
            System.out.println(s);

        }}

        @Test
        public void testShortestPath() throws IOException {
            GraphStore storage = new GraphStore();
            MapGraph<Local,Distancia> clone=   MapGraphLoader.loadGraph("docs\\esinf_data\\locais_big.csv", "docs\\esinf_data\\distancias_big.csv");
            LinkedList<String> shortPath = new LinkedList<>();
            ArrayList<Integer> dists = new ArrayList<>();

            System.out.println(storage.shortestPaths("CT162","CT111",Integer::compare, Integer::sum, 0, shortPath));   }
    }



