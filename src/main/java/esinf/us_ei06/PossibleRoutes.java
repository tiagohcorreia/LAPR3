package esinf.us_ei06;

import esinf.Edge;
import esinf.Graph;
import esinf.model.Route;

import java.util.*;
import java.util.function.BinaryOperator;

public class PossibleRoutes<V, E> {

    private Graph<V, E> graph;
    private BinaryOperator<E> operat;
    private Comparator<E> comparat;
    private E neutralValue;
    private ArrayList<Route<V>> routes;
    private Map<Route<V>, ArrayList<Edge<V, E>>> routesAndSimpleDistances;
    private Map<Route<V>, E> routesAndTotalDistances;

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

    public ArrayList<Route<V>> getRoutes() {
        return routes;
    }

    public Map<Route<V>, ArrayList<Edge<V, E>>> getRoutesAndSimpleDistances() {
        return routesAndSimpleDistances;
    }

    public Map<Route<V>, E> getRoutesAndTotalDistances() {
        return routesAndTotalDistances;
    }

    public boolean calculatePossibleRoutes(V orig,
                                           V dest,
                                           E autonomy) {

        if (graph == null || !graph.validVertex(orig) || !graph.validVertex(dest)) return false;

        E distanceTravelled = neutralValue;

        routes = new ArrayList<>();
        routesAndSimpleDistances = new HashMap<>();
        routesAndTotalDistances = new HashMap<>();

        boolean[] visited = new boolean[graph.vertices().size()];
        ArrayList<Edge<V, E>> simpleDistancesOfRoute = new ArrayList<>();
        Route<V> route = new Route<>();

        calculatePossibleRoutes(
                orig,
                dest,
                autonomy,
                distanceTravelled,
                visited,
                route,
                simpleDistancesOfRoute,
                routesAndSimpleDistances,
                routesAndTotalDistances,
                routes);

        return true;
    }

    private void calculatePossibleRoutes(V origin,
                                         V destiny,
                                         E autonomy,
                                         E distanceTravelled,
                                         boolean[] visited,
                                         Route<V> route,
                                         ArrayList<Edge<V, E>> simpleDistancesOfRoute,
                                         Map<Route<V>, ArrayList<Edge<V, E>>> routeAndSimpleDistances,
                                         Map<Route<V>, E> routesAndTotalDistances,
                                         ArrayList<Route<V>> routes) {

        int origKey = graph.key(origin);
        if (visited[origKey]) return;
        //E oldDistanceTravelled=distanceTravelled;

        Edge<V, E> edge = graph.edge(route.getRoute().peekFirst(), origin);

        if (edge == null) {

            route.getRoute().push(origin);
            visited[origKey] = true;

            for (V vAdj : graph.adjVertices(origin)) {
                calculatePossibleRoutes(
                        vAdj,
                        destiny,
                        autonomy,
                        distanceTravelled,
                        visited,
                        route,
                        simpleDistancesOfRoute,
                        routeAndSimpleDistances,
                        routesAndTotalDistances,
                        routes);
            }

        } else {

            E distance = edge.getWeight();
            distanceTravelled = operat.apply(distanceTravelled, distance);

            if (comparat.compare(distanceTravelled, autonomy) <= 0) {


                if (origin.equals(destiny)) {
                    ArrayList<Edge<V, E>> simpleDistancesOfRouteCopy=new ArrayList<>(simpleDistancesOfRoute);
                    simpleDistancesOfRouteCopy.add(edge);

                    Route<V> routeCopy = new Route<>(route.getRoute());
                    LinkedList<V> list = routeCopy.getRoute();
                    list.addFirst(destiny);
                    Collections.reverse(list);
                    routes.add(routeCopy);

                    routesAndTotalDistances.put(routeCopy, distanceTravelled);
                    routeAndSimpleDistances.put(routeCopy, simpleDistancesOfRouteCopy);

                    return;
                }

                route.getRoute().push(origin);
                simpleDistancesOfRoute.add(edge);
                visited[origKey] = true;

                for (V vAdj : graph.adjVertices(origin)) {
                    calculatePossibleRoutes(
                            vAdj,
                            destiny,
                            autonomy,
                            distanceTravelled,
                            visited,
                            route,
                            simpleDistancesOfRoute,
                            routeAndSimpleDistances,
                            routesAndTotalDistances,
                            routes);
                }
            } else return;

            route.getRoute().pop();
            visited[origKey] = false;
            simpleDistancesOfRoute.remove(edge);
            //distanceTravelled=oldDistanceTravelled;
        }
    }

}
