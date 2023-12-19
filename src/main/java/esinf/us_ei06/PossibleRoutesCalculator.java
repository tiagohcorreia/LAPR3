package esinf.us_ei06;

import esinf.Graph;
import esinf.IntegerBinaryOperator;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.LinkedList;
import java.util.function.BinaryOperator;

public class PossibleRoutesCalculator {

    public static <V, E> void getAllPossibleRoutes(Graph<V, E> graph,
                                                   V origin,
                                                   V destiny,
                                                   E autonomy,
                                                   E distanceTravelled,
                                                   BinaryOperator<E> operat,
                                                   Comparator<E> comparat,
                                                   boolean[] visited,
                                                   LinkedList<V> route,
                                                   ArrayList<LinkedList<V>> routes) {
        int origKey = graph.key(origin);
        if (visited[origKey]) return;

        E distance=graph.edge(route.peekFirst(), origin).getWeight();
        distanceTravelled = operat.apply(distanceTravelled, distance);

        if (comparat.compare(distanceTravelled, autonomy) < 0){

            if (origin.equals(destiny)) {
                LinkedList<V> pathCopy = new LinkedList<>(route);
                pathCopy.addFirst(destiny);
                Collections.reverse(pathCopy);
                routes.add(new LinkedList<>(pathCopy));
                return;
            }

            route.push(origin);
            visited[origKey] = true;

            for (V vAdj : graph.adjVertices(origin)) {
                getAllPossibleRoutes(graph, vAdj, destiny, autonomy, distanceTravelled, operat, comparat, visited, route, routes);
            }

        } else return;

        route.pop();
        visited[origKey] = false;
    }
}
