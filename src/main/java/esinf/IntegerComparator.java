package esinf;

import java.util.ArrayList;
import java.util.Comparator;
import java.util.LinkedList;
import java.util.List;
import java.util.function.BinaryOperator;

import static esinf.Algorithms.getPath;
import static esinf.Algorithms.shortestPathDijkstra;

/**
 * The type Integer comparator.
 */
public class IntegerComparator implements Comparator<Integer> {


    @Override
    public int compare(Integer o1, Integer o2) {

         return Integer.compare(o1, o2);
    }
}
