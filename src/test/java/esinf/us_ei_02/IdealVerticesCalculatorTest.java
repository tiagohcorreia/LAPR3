package esinf.us_ei_02;

import esinf.IntegerBinaryOperator;
import esinf.IntegerComparator;
import esinf.map.MapGraphLoader;
import esinf.model.Local;
import esinf.store.GraphStore;
import esinf.us_ei02.IdealVerticesCalculator;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.Map;

import static org.junit.jupiter.api.Assertions.*;

class IdealVerticesCalculatorTest {

    GraphStore graphStore=new GraphStore();
    Local l1;
    Local l2;
    Local l3;
    Local l4;
    Local l5;
    IdealVerticesCalculator<Local, Integer> calculator=new IdealVerticesCalculator<>(graphStore.getGraph(),new IntegerComparator(), new IntegerBinaryOperator(), 0);

    @BeforeEach
    void setUp() {
        graphStore.clean();
        MapGraphLoader.loadGraph("docs\\esinf_data\\other-test-files\\locais-1.csv", "docs\\esinf_data\\other-test-files\\distancias-1.txt");
        calculator=new IdealVerticesCalculator<>(graphStore.getGraph(),new IntegerComparator(), new IntegerBinaryOperator(), 0);
        ArrayList<Local> vertices=graphStore.getGraph().vertices();

        l1=vertices.get(0);
        l2=vertices.get(1);
        l3=vertices.get(2);
        l4=vertices.get(3);
        l5=vertices.get(4);
    }

    @Test
    void getVerticesByIdealOrder() {
        ArrayList<Local> result=calculator.getVerticesByIdealOrder();
        assertEquals(l3, result.get(0));
        assertEquals(l1, result.get(1));
        assertEquals(l5, result.get(2));
        assertEquals(l4, result.get(3));
        assertEquals(l2, result.get(4));
    }

    @Test
    void getAllShortestPathsForAllVertices() {
        Map<Local, ArrayList<LinkedList<Local>>> actual=calculator.getAllShortestPathsForAllVertices();
        Map<Local, ArrayList<LinkedList<Local>>> expected=new HashMap<>();

        LinkedList<Local> l12=new LinkedList<>();
        l12.add(l1);
        l12.add(l2);
        LinkedList<Local> l13=new LinkedList<>();
        l13.add(l1);
        l13.add(l3);
        LinkedList<Local> l14=new LinkedList<>();
        l14.add(l1);
        l14.add(l3);
        l14.add(l5);
        l14.add(l4);
        LinkedList<Local> l15=new LinkedList<>();
        l15.add(l1);
        l15.add(l3);
        l15.add(l5);

        ArrayList<LinkedList<Local>> l1shortPaths=new ArrayList<>();
        l1shortPaths.add(l12);
        l1shortPaths.add(l13);
        l1shortPaths.add(l14);
        l1shortPaths.add(l15);

        expected.put(l1, l1shortPaths);

        LinkedList<Local> l21=new LinkedList<>();
        l21.add(l2);
        l21.add(l1);
        LinkedList<Local> l23=new LinkedList<>();
        l23.add(l2);
        l23.add(l1);
        l23.add(l3);
        LinkedList<Local> l24=new LinkedList<>();
        l24.add(l2);
        l24.add(l1);
        l24.add(l3);
        l24.add(l5);
        l24.add(l4);
        LinkedList<Local> l25=new LinkedList<>();
        l25.add(l2);
        l25.add(l1);
        l25.add(l3);
        l25.add(l5);

        ArrayList<LinkedList<Local>> l2shortPaths=new ArrayList<>();
        l2shortPaths.add(l21);
        l2shortPaths.add(l23);
        l2shortPaths.add(l24);
        l2shortPaths.add(l25);

        expected.put(l2, l2shortPaths);

        LinkedList<Local> l31=new LinkedList<>();
        l31.add(l3);
        l31.add(l1);
        LinkedList<Local> l32=new LinkedList<>();
        l32.add(l3);
        l32.add(l1);
        l32.add(l2);
        LinkedList<Local> l34=new LinkedList<>();
        l34.add(l3);
        l34.add(l5);
        l34.add(l4);
        LinkedList<Local> l35=new LinkedList<>();
        l35.add(l3);
        l35.add(l5);

        ArrayList<LinkedList<Local>> l3shortPaths=new ArrayList<>();
        l3shortPaths.add(l31);
        l3shortPaths.add(l32);
        l3shortPaths.add(l34);
        l3shortPaths.add(l35);

        expected.put(l3, l3shortPaths);

        LinkedList<Local> l41=new LinkedList<>();
        l41.add(l4);
        l41.add(l5);
        l41.add(l3);
        l41.add(l1);
        LinkedList<Local> l42=new LinkedList<>();
        l42.add(l4);
        l42.add(l5);
        l42.add(l3);
        l42.add(l1);
        l42.add(l2);
        LinkedList<Local> l43=new LinkedList<>();
        l43.add(l4);
        l43.add(l5);
        l43.add(l3);
        LinkedList<Local> l45=new LinkedList<>();
        l45.add(l4);
        l45.add(l5);

        ArrayList<LinkedList<Local>> l4shortPaths=new ArrayList<>();
        l4shortPaths.add(l41);
        l4shortPaths.add(l42);
        l4shortPaths.add(l43);
        l4shortPaths.add(l45);

        expected.put(l4, l4shortPaths);

        LinkedList<Local> l51=new LinkedList<>();
        l51.add(l5);
        l51.add(l3);
        l51.add(l1);
        LinkedList<Local> l52=new LinkedList<>();
        l52.add(l5);
        l52.add(l3);
        l52.add(l1);
        l52.add(l2);
        LinkedList<Local> l53=new LinkedList<>();
        l53.add(l5);
        l53.add(l3);
        LinkedList<Local> l54=new LinkedList<>();
        l54.add(l5);
        l54.add(l4);

        ArrayList<LinkedList<Local>> l5shortPaths=new ArrayList<>();
        l5shortPaths.add(l51);
        l5shortPaths.add(l52);
        l5shortPaths.add(l53);
        l5shortPaths.add(l54);

        expected.put(l5, l5shortPaths);
    }

    @Test
    void getVerticesAndCentralities() {
        Map <Local, Integer> result=calculator.getVerticesAndCentralities();
        assertEquals(15, result.get(l1));
        assertEquals(9, result.get(l2));
        assertEquals(17, result.get(l3));
        assertEquals(9, result.get(l4));
        assertEquals(15, result.get(l5));
    }

    @Test
    void getVerticesAndProximities() {
        Map<Local,Integer> result=calculator.getVerticesAndProximities();
        assertEquals(90, result.get(l1));
        assertEquals(150, result.get(l2));
        assertEquals(80, result.get(l3));
        assertEquals(125, result.get(l4));
        assertEquals(95, result.get(l5));
    }
}