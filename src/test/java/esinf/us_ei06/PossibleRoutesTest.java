package esinf.us_ei06;

import esinf.Edge;
import esinf.IntegerBinaryOperator;
import esinf.IntegerComparator;
import esinf.map.MapGraphLoader;
import esinf.model.Local;
import esinf.model.Path;
import esinf.store.GraphStore;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import dataAccess.Repositories;

import java.util.*;
import java.util.function.BinaryOperator;

import static org.junit.jupiter.api.Assertions.*;


class PossibleRoutesTest {

    final String localsFilePath1 = "src\\test\\java\\esinf\\us_ei06\\test_files\\locals\\us-ei06-locals-1.txt";
    final String localsFilePath2 = "src\\test\\java\\esinf\\us_ei06\\test_files\\locals\\us-ei06-locals-2.txt";
    final String localsFilePath3 = "src\\test\\java\\esinf\\us_ei06\\test_files\\locals\\us-ei06-locals-3.txt";

    final String distancesFilePath1 = "src\\test\\java\\esinf\\us_ei06\\test_files\\distances\\us-ei06-distances-1.txt";
    final String distancesFilePath2 = "src\\test\\java\\esinf\\us_ei06\\test_files\\distances\\us-ei06-distances-2.txt";
    final String distancesFilePath3 = "src\\test\\java\\esinf\\us_ei06\\test_files\\distances\\us-ei06-distances-3.txt";

    GraphStore graphStore = Repositories.getInstance().getGraphStore();
    BinaryOperator<Integer> operator = new IntegerBinaryOperator();
    Comparator<Integer> comparator = new IntegerComparator();
    Integer neutralValue = 0;

    @BeforeEach
    void setUp() {
        graphStore.clean();
    }

    @Test
    public void possibleRoutesWithExactAutonomyTest1() {

        final int AUTONOMY=3;
        MapGraphLoader.loadGraph(localsFilePath1, distancesFilePath1);

        ArrayList<Local> vertices = graphStore.getGraph().vertices();
        Local a = vertices.get(0);
        Local b = vertices.get(1);
        Local c = vertices.get(2);
        Local d = vertices.get(3);

        Path<Local> r1 = new Path<>();
        r1.getRoute().add(a);
        r1.getRoute().add(b);
        r1.getRoute().add(c);
        r1.getRoute().add(d);

        Path<Local> r2 = new Path<>();
        r2.getRoute().add(a);
        r2.getRoute().add(b);
        r2.getRoute().add(d);

        ArrayList<Path<Local>> paths =new ArrayList<>();
        paths.add(r1);
        paths.add(r2);

        PossibleRoutes possibleRoutes = new PossibleRoutes<>(graphStore.getGraph(), operator, comparator, neutralValue);
        possibleRoutes.calculatePossibleRoutes(a, d, AUTONOMY);

        assertEquals(paths.toString(), possibleRoutes.getRoutes().toString());

        ArrayList<Edge<Local, Integer>> simpleDistances1=(ArrayList<Edge<Local, Integer>>) possibleRoutes.getRoutesAndSimpleDistances().get(r1);
        ArrayList<Edge<Local, Integer>> simpleDistances2=(ArrayList<Edge<Local, Integer>>) possibleRoutes.getRoutesAndSimpleDistances().get(r2);

        assertEquals(3, simpleDistances1.size());
        assertEquals(2, simpleDistances2.size());

        assertEquals(3, possibleRoutes.getRoutesAndTotalDistances().get(r1));
        assertEquals(2, possibleRoutes.getRoutesAndTotalDistances().get(r2));
    }

    @Test
    public void possibleRoutesWithExactAutonomyTest2() {

        final int AUTONOMY=3;
        MapGraphLoader.loadGraph(localsFilePath2, distancesFilePath2);

        ArrayList<Local> vertices = graphStore.getGraph().vertices();
        Local a = vertices.get(0);
        Local b = vertices.get(1);
        Local c = vertices.get(2);
        Local d = vertices.get(3);

        Path<Local> r1 = new Path<>();
        r1.getRoute().add(a);
        r1.getRoute().add(b);
        r1.getRoute().add(c);
        r1.getRoute().add(d);

        Path<Local> r2 = new Path<>();
        r2.getRoute().add(a);
        r2.getRoute().add(b);
        r2.getRoute().add(d);

        Path<Local> r3 = new Path<>();
        r3.getRoute().add(a);
        r3.getRoute().add(c);
        r3.getRoute().add(b);
        r3.getRoute().add(d);

        Path<Local> r4 = new Path<>();
        r4.getRoute().add(a);
        r4.getRoute().add(c);
        r4.getRoute().add(d);

        ArrayList<Path<Local>> paths =new ArrayList<>();
        paths.add(r1);
        paths.add(r2);
        paths.add(r3);
        paths.add(r4);

        PossibleRoutes possibleRoutes = new PossibleRoutes<>(graphStore.getGraph(), operator, comparator, neutralValue);
        possibleRoutes.calculatePossibleRoutes(a, d, AUTONOMY);

        assertEquals(paths.toString(), possibleRoutes.getRoutes().toString());

        ArrayList<Edge<Local, Integer>> simpleDistances1=(ArrayList<Edge<Local, Integer>>) possibleRoutes.getRoutesAndSimpleDistances().get(r1);
        ArrayList<Edge<Local, Integer>> simpleDistances2=(ArrayList<Edge<Local, Integer>>) possibleRoutes.getRoutesAndSimpleDistances().get(r2);
        ArrayList<Edge<Local, Integer>> simpleDistances3=(ArrayList<Edge<Local, Integer>>) possibleRoutes.getRoutesAndSimpleDistances().get(r3);
        ArrayList<Edge<Local, Integer>> simpleDistances4=(ArrayList<Edge<Local, Integer>>) possibleRoutes.getRoutesAndSimpleDistances().get(r4);

        assertEquals(3, simpleDistances1.size());
        assertEquals(2, simpleDistances2.size());
        assertEquals(3, simpleDistances3.size());
        assertEquals(2, simpleDistances4.size());

        assertEquals(3, possibleRoutes.getRoutesAndTotalDistances().get(r1));
        assertEquals(2, possibleRoutes.getRoutesAndTotalDistances().get(r2));
        assertEquals(3, possibleRoutes.getRoutesAndTotalDistances().get(r3));
        assertEquals(2, possibleRoutes.getRoutesAndTotalDistances().get(r4));
    }

    @Test
    public void possibleRoutesWithExactAutonomyTest3() {

        final int AUTONOMY=3;
        MapGraphLoader.loadGraph(localsFilePath3, distancesFilePath3);

        ArrayList<Local> vertices = graphStore.getGraph().vertices();
        Local a = vertices.get(0);
        Local b = vertices.get(1);
        Local c = vertices.get(2);
        Local d = vertices.get(3);

        Path<Local> r1 = new Path<>();
        r1.getRoute().add(a);
        r1.getRoute().add(b);
        r1.getRoute().add(c);
        r1.getRoute().add(d);

        Path<Local> r2 = new Path<>();
        r2.getRoute().add(a);
        r2.getRoute().add(b);
        r2.getRoute().add(d);

        Path<Local> r3 = new Path<>();
        r3.getRoute().add(a);
        r3.getRoute().add(c);
        r3.getRoute().add(b);
        r3.getRoute().add(d);

        Path<Local> r4 = new Path<>();
        r4.getRoute().add(a);
        r4.getRoute().add(c);
        r4.getRoute().add(d);

        Path<Local> r5 = new Path<>();
        r5.getRoute().add(a);
        r5.getRoute().add(d);

        ArrayList<Path<Local>> paths =new ArrayList<>();
        paths.add(r1);
        paths.add(r2);
        paths.add(r3);
        paths.add(r4);
        paths.add(r5);

        PossibleRoutes possibleRoutes = new PossibleRoutes<>(graphStore.getGraph(), operator, comparator, neutralValue);
        possibleRoutes.calculatePossibleRoutes(a, d, AUTONOMY);

        assertEquals(paths.toString(), possibleRoutes.getRoutes().toString());

        ArrayList<Edge<Local, Integer>> simpleDistances1=(ArrayList<Edge<Local, Integer>>) possibleRoutes.getRoutesAndSimpleDistances().get(r1);
        ArrayList<Edge<Local, Integer>> simpleDistances2=(ArrayList<Edge<Local, Integer>>) possibleRoutes.getRoutesAndSimpleDistances().get(r2);
        ArrayList<Edge<Local, Integer>> simpleDistances3=(ArrayList<Edge<Local, Integer>>) possibleRoutes.getRoutesAndSimpleDistances().get(r3);
        ArrayList<Edge<Local, Integer>> simpleDistances4=(ArrayList<Edge<Local, Integer>>) possibleRoutes.getRoutesAndSimpleDistances().get(r4);
        ArrayList<Edge<Local, Integer>> simpleDistances5=(ArrayList<Edge<Local, Integer>>) possibleRoutes.getRoutesAndSimpleDistances().get(r5);

        assertEquals(3, simpleDistances1.size());
        assertEquals(2, simpleDistances2.size());
        assertEquals(3, simpleDistances3.size());
        assertEquals(2, simpleDistances4.size());
        assertEquals(1, simpleDistances5.size());

        assertEquals(3, possibleRoutes.getRoutesAndTotalDistances().get(r1));
        assertEquals(2, possibleRoutes.getRoutesAndTotalDistances().get(r2));
        assertEquals(3, possibleRoutes.getRoutesAndTotalDistances().get(r3));
        assertEquals(2, possibleRoutes.getRoutesAndTotalDistances().get(r4));
        assertEquals(1, possibleRoutes.getRoutesAndTotalDistances().get(r5));
    }

    @Test
    public void possibleRoutesWithLessAutonomyTest1() {

        final int AUTONOMY=2;
        MapGraphLoader.loadGraph(localsFilePath3, distancesFilePath3);

        ArrayList<Local> vertices = graphStore.getGraph().vertices();
        Local a = vertices.get(0);
        Local b = vertices.get(1);
        Local c = vertices.get(2);
        Local d = vertices.get(3);

        Path<Local> r2 = new Path<>();
        r2.getRoute().add(a);
        r2.getRoute().add(b);
        r2.getRoute().add(d);

        Path<Local> r4 = new Path<>();
        r4.getRoute().add(a);
        r4.getRoute().add(c);
        r4.getRoute().add(d);

        Path<Local> r5 = new Path<>();
        r5.getRoute().add(a);
        r5.getRoute().add(d);

        ArrayList<Path<Local>> paths =new ArrayList<>();
        paths.add(r2);
        paths.add(r4);
        paths.add(r5);

        PossibleRoutes possibleRoutes = new PossibleRoutes<>(graphStore.getGraph(), operator, comparator, neutralValue);
        possibleRoutes.calculatePossibleRoutes(a, d, AUTONOMY);

        assertEquals(paths.toString(), possibleRoutes.getRoutes().toString());

        ArrayList<Edge<Local, Integer>> simpleDistances2=(ArrayList<Edge<Local, Integer>>) possibleRoutes.getRoutesAndSimpleDistances().get(r2);
        ArrayList<Edge<Local, Integer>> simpleDistances4=(ArrayList<Edge<Local, Integer>>) possibleRoutes.getRoutesAndSimpleDistances().get(r4);
        ArrayList<Edge<Local, Integer>> simpleDistances5=(ArrayList<Edge<Local, Integer>>) possibleRoutes.getRoutesAndSimpleDistances().get(r5);

        assertEquals(2, simpleDistances2.size());
        assertEquals(2, simpleDistances4.size());
        assertEquals(1, simpleDistances5.size());

        assertEquals(2, possibleRoutes.getRoutesAndTotalDistances().get(r2));
        assertEquals(2, possibleRoutes.getRoutesAndTotalDistances().get(r4));
        assertEquals(1, possibleRoutes.getRoutesAndTotalDistances().get(r5));
    }

    @Test
    public void possibleRoutesWithLessAutonomyTest2() {

        final int AUTONOMY=1;
        MapGraphLoader.loadGraph(localsFilePath3, distancesFilePath3);

        ArrayList<Local> vertices = graphStore.getGraph().vertices();
        Local a = vertices.get(0);
        Local b = vertices.get(1);
        Local c = vertices.get(2);
        Local d = vertices.get(3);

        Path<Local> r5 = new Path<>();
        r5.getRoute().add(a);
        r5.getRoute().add(d);

        ArrayList<Path<Local>> paths =new ArrayList<>();
        paths.add(r5);

        PossibleRoutes possibleRoutes = new PossibleRoutes<>(graphStore.getGraph(), operator, comparator, neutralValue);
        possibleRoutes.calculatePossibleRoutes(a, d, AUTONOMY);

        assertEquals(paths.toString(), possibleRoutes.getRoutes().toString());

        ArrayList<Edge<Local, Integer>> simpleDistances5=(ArrayList<Edge<Local, Integer>>) possibleRoutes.getRoutesAndSimpleDistances().get(r5);

        assertEquals(1, simpleDistances5.size());

        assertEquals(1, possibleRoutes.getRoutesAndTotalDistances().get(r5));
    }

    @Test
    public void possibleRoutesWithMoreAutonomyTest() {

        final int AUTONOMY=5;
        MapGraphLoader.loadGraph(localsFilePath3, distancesFilePath3);

        ArrayList<Local> vertices = graphStore.getGraph().vertices();
        Local a = vertices.get(0);
        Local b = vertices.get(1);
        Local c = vertices.get(2);
        Local d = vertices.get(3);

        Path<Local> r1 = new Path<>();
        r1.getRoute().add(a);
        r1.getRoute().add(b);
        r1.getRoute().add(c);
        r1.getRoute().add(d);

        Path<Local> r2 = new Path<>();
        r2.getRoute().add(a);
        r2.getRoute().add(b);
        r2.getRoute().add(d);

        Path<Local> r3 = new Path<>();
        r3.getRoute().add(a);
        r3.getRoute().add(c);
        r3.getRoute().add(b);
        r3.getRoute().add(d);

        Path<Local> r4 = new Path<>();
        r4.getRoute().add(a);
        r4.getRoute().add(c);
        r4.getRoute().add(d);

        Path<Local> r5 = new Path<>();
        r5.getRoute().add(a);
        r5.getRoute().add(d);

        ArrayList<Path<Local>> paths =new ArrayList<>();
        paths.add(r1);
        paths.add(r2);
        paths.add(r3);
        paths.add(r4);
        paths.add(r5);

        PossibleRoutes possibleRoutes = new PossibleRoutes<>(graphStore.getGraph(), operator, comparator, neutralValue);
        possibleRoutes.calculatePossibleRoutes(a, d, AUTONOMY);

        assertEquals(paths.toString(), possibleRoutes.getRoutes().toString());

        ArrayList<Edge<Local, Integer>> simpleDistances1=(ArrayList<Edge<Local, Integer>>) possibleRoutes.getRoutesAndSimpleDistances().get(r1);
        ArrayList<Edge<Local, Integer>> simpleDistances2=(ArrayList<Edge<Local, Integer>>) possibleRoutes.getRoutesAndSimpleDistances().get(r2);
        ArrayList<Edge<Local, Integer>> simpleDistances3=(ArrayList<Edge<Local, Integer>>) possibleRoutes.getRoutesAndSimpleDistances().get(r3);
        ArrayList<Edge<Local, Integer>> simpleDistances4=(ArrayList<Edge<Local, Integer>>) possibleRoutes.getRoutesAndSimpleDistances().get(r4);
        ArrayList<Edge<Local, Integer>> simpleDistances5=(ArrayList<Edge<Local, Integer>>) possibleRoutes.getRoutesAndSimpleDistances().get(r5);

        assertEquals(3, simpleDistances1.size());
        assertEquals(2, simpleDistances2.size());
        assertEquals(3, simpleDistances3.size());
        assertEquals(2, simpleDistances4.size());
        assertEquals(1, simpleDistances5.size());

        assertEquals(3, possibleRoutes.getRoutesAndTotalDistances().get(r1));
        assertEquals(2, possibleRoutes.getRoutesAndTotalDistances().get(r2));
        assertEquals(3, possibleRoutes.getRoutesAndTotalDistances().get(r3));
        assertEquals(2, possibleRoutes.getRoutesAndTotalDistances().get(r4));
        assertEquals(1, possibleRoutes.getRoutesAndTotalDistances().get(r5));
    }
}