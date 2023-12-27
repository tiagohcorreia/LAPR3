package esinf.usei07;

import esinf.Algorithms;
import esinf.Edge;
import esinf.IntegerBinaryOperator;
import esinf.IntegerComparator;
import esinf.dataStructure.Distance;
import esinf.dataStructure.FurthestPlacesData;
import esinf.dataStructure.VertexMetrics;
import esinf.map.MapGraph;
import esinf.map.MapGraphLoader;
import esinf.model.Local;
import esinf.store.GraphStore;
import esinf.us_ei02.IdealVerticesCalculator;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import dataAccess.Repositories;

import java.io.IOException;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;

import static org.junit.jupiter.api.Assertions.assertEquals;

public class ex07 {

    GraphStore graphStore=new GraphStore();
    Local l1;
    Local l2;
    Local l3;
    Local l4;
    Local l5;
    IdealVerticesCalculator<Local, Integer> calculator;
    ArrayList<VertexMetrics<Local, Integer>> expected;
    @BeforeEach
    void setUp() {
        graphStore.clean();
        MapGraphLoader.loadGraph("docs/esinf_data/locais_small.csv","docs/esinf_data/distancias_small.csv");
        calculator=new IdealVerticesCalculator<>(graphStore.getGraph(), graphStore.getGraph().vertices(), new IntegerComparator(), new IntegerBinaryOperator(), 0);
        ArrayList<Local> vertices=graphStore.getGraph().vertices();

        l1=vertices.get(0);
        l2=vertices.get(1);
        l3=vertices.get(2);
        l4=vertices.get(3);
        l5=vertices.get(4);
    }

    @Test
    public void testRemoveEdgesAboveAutonomy() throws IOException {

        GraphStore storage = new GraphStore();
        storage.clean();

        MapGraphLoader.loadGraph("docs\\esinf_data\\locais_big.csv", "docs\\esinf_data\\distancias_big.csv");
        int num = 4;
        int count = 0;
        MapGraph<Local, Integer> atual = storage.removeEdgesAboveAutonomy(1000);
        for (Edge<Local, Integer> g : atual.edges()) {
            if (g != null) count++;
        }

        // storage.removeEdgesAboveAutonomy(1000);// assertEquals(expected,atual);
        assertEquals(num, count);
        storage.clean();

    }

    @Test
    public void testEX7GetPathThatGoesThroughMostHubs() throws IOException {

        GraphStore storage = Repositories.getInstance().getGraphStore();
        storage.clean();

       // MapGraphLoader.loadGraph("docs\\esinf_data\\locais_small.csv", "docs\\esinf_data\\distancias_small.csv");

        MapGraph clone = storage.getGraph().clone();
        LinkedList<Local> shortPath2 = new LinkedList<>();
        Distance data = storage.getFurthestPlaces();
        Algorithms.shortestPath(clone, data.getLocal1(), data.getLocal2(), Integer::compare, Integer::sum, 0, shortPath2);

        // get hubs ideal location
        ArrayList<VertexMetrics<Local, Integer>> result=calculator.getIdealVertices();


        //



        }
}
