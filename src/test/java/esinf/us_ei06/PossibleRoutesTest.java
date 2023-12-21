package esinf.us_ei06;

import esinf.IntegerBinaryOperator;
import esinf.IntegerComparator;
import esinf.map.MapGraphLoader;
import esinf.model.Local;
import esinf.store.GraphStore;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import java.sql.SQLOutput;
import java.util.*;
import java.util.function.BinaryOperator;

class PossibleRoutesTest {

    GraphStore graphStore = new GraphStore();
    BinaryOperator<Integer> operator = new IntegerBinaryOperator();
    Comparator<Integer> comparator = new IntegerComparator();
    Integer neutralValue = 0;

    @BeforeEach
    void setUp() {
        graphStore.clean();
    }

    public void testPossibleRoutes(String localsFilePath,
                                   String distancesFilePath,
                                   int autonomy) {

        MapGraphLoader.loadGraph(localsFilePath, distancesFilePath);
        PossibleRoutes possibleRoutes = new PossibleRoutes<>(graphStore.getGraph(), operator, comparator, neutralValue);
        Local a = graphStore.getGraph().vertices().get(0);
        Local d = graphStore.getGraph().vertices().get(3);

        possibleRoutes.calculatePossibleRoutes(a, d, autonomy);

        System.out.println("routes: \n" + possibleRoutes.getRoutes());
        System.out.println();
        System.out.println("routes and simple distances: \n" + possibleRoutes.getRoutesAndSimpleDistances());
        System.out.println();
        System.out.println("routes and total distances: \n" + possibleRoutes.getRoutesAndTotalDistances());
    }

    @Test
    public void possibleRoutesTest1() {

        testPossibleRoutes("docs\\sprint3\\esinf\\us-ei06\\test-files\\locals\\us-ei06-locals-1.txt",
                "docs\\sprint3\\esinf\\us-ei06\\test-files\\distances\\us-ei06-distances-1.txt",
                3);
    }

    @Test
    public void possibleRoutesTest2() {;

        testPossibleRoutes("docs\\sprint3\\esinf\\us-ei06\\test-files\\locals\\us-ei06-locals-1.txt",
                "docs\\sprint3\\esinf\\us-ei06\\test-files\\distances\\us-ei06-distances-1.txt",
                3);
    }

}