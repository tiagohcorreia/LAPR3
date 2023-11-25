package esinf.us_ei_02;

import java.util.Comparator;
import java.util.Map;
import java.lang.Integer;

public class CentralityComparator<V> implements Comparator<Map.Entry<V, Integer>> {
    @Override
    public int compare(Map.Entry<V, Integer> o1, Map.Entry<V, Integer> o2) {
        return Integer.compare(o1.getValue(), o2.getValue());
    }
}
