package esinf;

import java.util.Collections;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;

public class AlgorithmsAlternative extends Algorithms {
    public static <V, E> void getPath(Graph<V, E> g, V vOrig, V vDest, List<V> pathKeys, List<V> path) {
        if (g == null || !g.validVertex(vOrig) || !g.validVertex(vDest)) return;

        if (vOrig.equals(vDest)) {
            path.add(vOrig);
            return;
        }

        int vDestKey = g.key(vDest);

        // Build the path iteratively
        while (vDestKey != -1) {
            V vertex = g.vertex(vDestKey);
            path.add(vertex);
            vDestKey = g.key(pathKeys.get(vDestKey));
        }

        Collections.reverse(path);
    }


    public static <V> void clean(LinkedList<V> source, V v) {
        LinkedList<V> destination = new LinkedList<>();
        for (V element : source) {
            if (!destination.contains(element)) {
                destination.add(element);
            }
        }

    }
}
