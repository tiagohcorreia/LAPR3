package esinf.us_ei02;

import esinf.IntegerBinaryOperator;
import esinf.IntegerComparator;
import esinf.dataStructure.VertexMetrics;
import esinf.map.MapGraphLoader;
import esinf.model.Local;
import esinf.store.GraphStore;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import dataAccess.Repositories;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.Map;

import static org.junit.jupiter.api.Assertions.*;

class IdealVerticesCalculatorTest {

    GraphStore graphStore= Repositories.getInstance().getGraphStore();
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
        MapGraphLoader.loadGraph("src\\test\\java\\esinf\\us_ei02\\test_files\\locais-1.csv", "src\\test\\java\\esinf\\us_ei02\\test_files\\distancias-1.csv");
        calculator=new IdealVerticesCalculator<>(graphStore.getGraph(), graphStore.getGraph().vertices(), new IntegerComparator(), new IntegerBinaryOperator(), 0);
        ArrayList<Local> vertices=graphStore.getGraph().vertices();

        l1=vertices.get(0);
        l2=vertices.get(1);
        l3=vertices.get(2);
        l4=vertices.get(3);
        l5=vertices.get(4);

        expected=new ArrayList<>();
        expected.add(new VertexMetrics<>(l3, 17, 2, 80));
        expected.add(new VertexMetrics<>(l1, 15, 3, 90));
        expected.add(new VertexMetrics<>(l5, 15, 2, 95));
        expected.add(new VertexMetrics<>(l4, 9, 2, 125));
        expected.add(new VertexMetrics<>(l2, 9, 1, 150));
    }

    @Test
    void getAllShortestPathsForAllVertices() {
        Map<Local, ArrayList<LinkedList<Local>>> actual = calculator.getVerticesAndAllShortestPaths();
        Map<Local, ArrayList<LinkedList<Local>>> expected = new HashMap<>();

        LinkedList<Local> l12 = new LinkedList<>();
        l12.add(l1);
        l12.add(l2);
        LinkedList<Local> l13 = new LinkedList<>();
        l13.add(l1);
        l13.add(l3);
        LinkedList<Local> l14 = new LinkedList<>();
        l14.add(l1);
        l14.add(l3);
        l14.add(l5);
        l14.add(l4);
        LinkedList<Local> l15 = new LinkedList<>();
        l15.add(l1);
        l15.add(l3);
        l15.add(l5);

        ArrayList<LinkedList<Local>> l1shortPaths = new ArrayList<>();
        l1shortPaths.add(l12);
        l1shortPaths.add(l13);
        l1shortPaths.add(l14);
        l1shortPaths.add(l15);

        expected.put(l1, l1shortPaths);

        LinkedList<Local> l21 = new LinkedList<>();
        l21.add(l2);
        l21.add(l1);
        LinkedList<Local> l23 = new LinkedList<>();
        l23.add(l2);
        l23.add(l1);
        l23.add(l3);
        LinkedList<Local> l24 = new LinkedList<>();
        l24.add(l2);
        l24.add(l1);
        l24.add(l3);
        l24.add(l5);
        l24.add(l4);
        LinkedList<Local> l25 = new LinkedList<>();
        l25.add(l2);
        l25.add(l1);
        l25.add(l3);
        l25.add(l5);

        ArrayList<LinkedList<Local>> l2shortPaths = new ArrayList<>();
        l2shortPaths.add(l21);
        l2shortPaths.add(l23);
        l2shortPaths.add(l24);
        l2shortPaths.add(l25);

        expected.put(l2, l2shortPaths);

        LinkedList<Local> l31 = new LinkedList<>();
        l31.add(l3);
        l31.add(l1);
        LinkedList<Local> l32 = new LinkedList<>();
        l32.add(l3);
        l32.add(l1);
        l32.add(l2);
        LinkedList<Local> l34 = new LinkedList<>();
        l34.add(l3);
        l34.add(l5);
        l34.add(l4);
        LinkedList<Local> l35 = new LinkedList<>();
        l35.add(l3);
        l35.add(l5);

        ArrayList<LinkedList<Local>> l3shortPaths = new ArrayList<>();
        l3shortPaths.add(l31);
        l3shortPaths.add(l32);
        l3shortPaths.add(l34);
        l3shortPaths.add(l35);

        expected.put(l3, l3shortPaths);

        LinkedList<Local> l41 = new LinkedList<>();
        l41.add(l4);
        l41.add(l5);
        l41.add(l3);
        l41.add(l1);
        LinkedList<Local> l42 = new LinkedList<>();
        l42.add(l4);
        l42.add(l5);
        l42.add(l3);
        l42.add(l1);
        l42.add(l2);
        LinkedList<Local> l43 = new LinkedList<>();
        l43.add(l4);
        l43.add(l5);
        l43.add(l3);
        LinkedList<Local> l45 = new LinkedList<>();
        l45.add(l4);
        l45.add(l5);

        ArrayList<LinkedList<Local>> l4shortPaths = new ArrayList<>();
        l4shortPaths.add(l41);
        l4shortPaths.add(l42);
        l4shortPaths.add(l43);
        l4shortPaths.add(l45);

        expected.put(l4, l4shortPaths);

        LinkedList<Local> l51 = new LinkedList<>();
        l51.add(l5);
        l51.add(l3);
        l51.add(l1);
        LinkedList<Local> l52 = new LinkedList<>();
        l52.add(l5);
        l52.add(l3);
        l52.add(l1);
        l52.add(l2);
        LinkedList<Local> l53 = new LinkedList<>();
        l53.add(l5);
        l53.add(l3);
        LinkedList<Local> l54 = new LinkedList<>();
        l54.add(l5);
        l54.add(l4);

        ArrayList<LinkedList<Local>> l5shortPaths = new ArrayList<>();
        l5shortPaths.add(l51);
        l5shortPaths.add(l52);
        l5shortPaths.add(l53);
        l5shortPaths.add(l54);

        expected.put(l5, l5shortPaths);
    }

    @Test
    void testGetMetrics(){
        ArrayList<VertexMetrics<Local, Integer>> result=calculator.getIdealVertices();

        for (int i=0; i<expected.size(); i++){
            String vertexID=result.get(i).getVertex().getLocalId();
            assertEquals(expected.get(i).getVertex(), result.get(i).getVertex(), String.format("vértice incorreto no vertice %s", vertexID));
            assertEquals(expected.get(i).getCentrality(), result.get(i).getCentrality(), String.format("centralidade incorreta no vertice %s", vertexID));
            assertEquals(expected.get(i).getInfluence(), result.get(i).getInfluence(), String.format("influencia incorreta no vertice %s", vertexID));
            assertEquals(expected.get(i).getProximity(), result.get(i).getProximity(), String.format("proximidade incorreta no vertice %s", vertexID));
        }
    }
}