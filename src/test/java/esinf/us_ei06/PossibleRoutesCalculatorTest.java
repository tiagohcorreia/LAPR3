package esinf.us_ei06;

import domain.Hub;
import esinf.Graph;
import esinf.IntegerBinaryOperator;
import esinf.IntegerComparator;
import esinf.gps.GPS;
import esinf.model.Local;
import esinf.store.GraphStore;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import java.time.LocalTime;
import java.util.Comparator;
import java.util.function.BinaryOperator;

import static org.junit.jupiter.api.Assertions.*;

class PossibleRoutesCalculatorTest {

    GraphStore graphStore=new GraphStore();
    BinaryOperator<Integer> operator=new IntegerBinaryOperator();
    Comparator<Integer> comparator=new IntegerComparator();

    @BeforeEach
    void setUp() {
        graphStore.clean();
        graphStore.getGraph();
    }

    @Test
    public void testRoutesWithinAutonomy(){

    }

}