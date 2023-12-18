package esinf.us_ei06;

import esinf.Graph;

import java.util.ArrayList;
import java.util.Collections;
import java.util.LinkedList;

public class PossibleRoutesCalculator {

    public static <V, E> void allPaths(Graph<V, E> graph, V origin, V destiny, boolean[] visited,
                                        LinkedList<V> path, ArrayList<LinkedList<V>> paths) {
        int vKey = graph.key(origin);
        if (visited[vKey]) return;

        if (origin.equals(destiny)) {
            LinkedList<V> pathCopy = new LinkedList<>(path);
            pathCopy.addFirst(destiny);
            Collections.reverse(pathCopy);
            paths.add(new LinkedList<>(pathCopy));
            return;
        }

        path.push(origin);
        visited[vKey] = true;

        for (V vAdj : graph.adjVertices(origin)) {
            allPaths(graph, vAdj, destiny, visited, path, paths);
        }
        path.pop();
        visited[vKey] = false;

    }
}
