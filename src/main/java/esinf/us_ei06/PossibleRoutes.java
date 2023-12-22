package esinf.us_ei06;

import esinf.Edge;
import esinf.Graph;
import esinf.model.Path;

import java.util.*;
import java.util.function.BinaryOperator;

public class PossibleRoutes<V, E> {

    private Graph<V, E> graph;
    private BinaryOperator<E> operat;
    private Comparator<E> comparat;
    private E neutralValue;
    private ArrayList<Path<V>> paths;
    private Map<Path<V>, ArrayList<Edge<V, E>>> routesAndSimpleDistances;
    private Map<Path<V>, E> routesAndTotalDistances;

    public PossibleRoutes(Graph<V, E> graph, BinaryOperator<E> operat, Comparator<E> comparat, E neutralValue) {
        this.graph = graph;
        this.operat = operat;
        this.comparat = comparat;
        this.neutralValue = neutralValue;
    }

    public Graph<V, E> getGraph() {
        return graph;
    }

    public BinaryOperator<E> getOperat() {
        return operat;
    }

    public Comparator<E> getComparat() {
        return comparat;
    }

    public E getNeutralValue() {
        return neutralValue;
    }

    public ArrayList<Path<V>> getRoutes() {
        return paths;
    }

    public Map<Path<V>, ArrayList<Edge<V, E>>> getRoutesAndSimpleDistances() {
        return routesAndSimpleDistances;
    }

    public Map<Path<V>, E> getRoutesAndTotalDistances() {
        return routesAndTotalDistances;
    }

    public boolean calculatePossibleRoutes(V orig,
                                           V dest,
                                           E autonomy) {

        if (graph == null || !graph.validVertex(orig) || !graph.validVertex(dest)) return false;

        E distanceTravelled = neutralValue;

        paths = new ArrayList<>();
        routesAndSimpleDistances = new HashMap<>();
        routesAndTotalDistances = new HashMap<>();

        boolean[] visited = new boolean[graph.vertices().size()];
        ArrayList<Edge<V, E>> simpleDistancesOfRoute = new ArrayList<>();
        Path<V> path = new Path<>();

        calculatePossibleRoutes(
                orig,
                dest,
                autonomy,
                distanceTravelled,
                visited,
                path,
                simpleDistancesOfRoute,
                routesAndSimpleDistances,
                routesAndTotalDistances,
                paths);

        return true;
    }

    private void calculatePossibleRoutes(V origin,
                                         V destiny,
                                         E autonomy,
                                         E distanceTravelled,
                                         boolean[] visited,
                                         Path<V> path,
                                         ArrayList<Edge<V, E>> simpleDistancesOfRoute,
                                         Map<Path<V>, ArrayList<Edge<V, E>>> routeAndSimpleDistances,
                                         Map<Path<V>, E> routesAndTotalDistances,
                                         ArrayList<Path<V>> paths) {

        int origKey = graph.key(origin);
        if (visited[origKey]) return;
        //E oldDistanceTravelled=distanceTravelled;

        Edge<V, E> edge = graph.edge(path.getRoute().peekFirst(), origin);

        if (edge == null) {

            path.getRoute().push(origin);
            visited[origKey] = true;

            for (V vAdj : graph.adjVertices(origin)) {
                calculatePossibleRoutes(
                        vAdj,
                        destiny,
                        autonomy,
                        distanceTravelled,
                        visited,
                        path,
                        simpleDistancesOfRoute,
                        routeAndSimpleDistances,
                        routesAndTotalDistances,
                        paths);
            }

        } else {

            E distance = edge.getWeight();
            distanceTravelled = operat.apply(distanceTravelled, distance);

            if (comparat.compare(distanceTravelled, autonomy) <= 0) {


                if (origin.equals(destiny)) {
                    ArrayList<Edge<V, E>> simpleDistancesOfRouteCopy=new ArrayList<>(simpleDistancesOfRoute);
                    simpleDistancesOfRouteCopy.add(edge);

                    Path<V> pathCopy = new Path<>(path.getRoute());
                    LinkedList<V> list = pathCopy.getRoute();
                    list.addFirst(destiny);
                    Collections.reverse(list);
                    paths.add(pathCopy);

                    routesAndTotalDistances.put(pathCopy, distanceTravelled);
                    routeAndSimpleDistances.put(pathCopy, simpleDistancesOfRouteCopy);

                    return;
                }

                path.getRoute().push(origin);
                simpleDistancesOfRoute.add(edge);
                visited[origKey] = true;

                for (V vAdj : graph.adjVertices(origin)) {
                    calculatePossibleRoutes(
                            vAdj,
                            destiny,
                            autonomy,
                            distanceTravelled,
                            visited,
                            path,
                            simpleDistancesOfRoute,
                            routeAndSimpleDistances,
                            routesAndTotalDistances,
                            paths);
                }
            } else return;

            path.getRoute().pop();
            visited[origKey] = false;
            simpleDistancesOfRoute.remove(edge);
            //distanceTravelled=oldDistanceTravelled;
        }
    }

}
