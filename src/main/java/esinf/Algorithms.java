package esinf;

import domain.Hub;
import esinf.Edge;
import esinf.Graph;
import esinf.dataStructure.Distance;
import esinf.map.MapGraph;
import esinf.model.Circuit;
import esinf.model.Vehicle;
import esinf.store.GraphStore;

import java.util.*;
import java.util.function.BinaryOperator;

import static esinf.AlgorithmsAlternative.removeDuplicates;
import static esinf.AlgorithmsAlternative.removeElementsAfter;


public class Algorithms {
    /**
     * Performs breadth-first search of a Graph starting in a vertex
     *
     * @param g    Graph instance
     * @param vert vertex that will be the source of the search
     * @return a LinkedList with the vertices of breadth-first search
     */
    public static <V, E> LinkedList<V> BreadthFirstSearch(Graph<V, E> g, V vert) {
        if (g == null || !g.validVertex(vert)) return null;

        boolean[] visited = new boolean[g.numVertices()];
        Arrays.fill(visited, false);

        LinkedList<V> qbfs = new LinkedList<>();
        LinkedList<V> qaux = new LinkedList<>();

        qbfs.add(vert);
        qaux.add(vert);
        int key = g.key(vert);
        visited[key] = true;

        while (!qaux.isEmpty()) {
            vert = qaux.removeFirst();
            for (V vAdj : g.adjVertices(vert)) {
                int k = g.key(vAdj);
                if (!visited[k]) {
                    qbfs.add(vAdj);
                    qaux.add(vAdj);
                    visited[k] = true;
                }
            }
        }
        return qbfs;
    }

    /**
     * Performs depth-first search starting in a vertex
     *
     * @param g       Graph instance
     * @param vOrig   vertex of graph g that will be the source of the search
     * @param visited set of previously visited vertices
     * @param qdfs    return LinkedList with vertices of depth-first search
     */
    private static <V, E> void DepthFirstSearch(Graph<V, E> g, V vOrig, boolean[] visited, LinkedList<V> qdfs) {
        if (g == null) return;
        int key = g.key(vOrig);
        if (key < 0) return;

        if (visited[key]) return;
        qdfs.add(vOrig);
        visited[key] = true;

        for (V vAdj : g.adjVertices(vOrig)) {
            DepthFirstSearch(g, vAdj, visited, qdfs);
        }

    }

    /**
     * Performs depth-first search starting in a vertex
     *
     * @param g    Graph instance
     * @param vert vertex of graph g that will be the source of the search
     * @return a LinkedList with the vertices of depth-first search
     */
    public static <V, E> LinkedList<V> DepthFirstSearch(Graph<V, E> g, V vert) {
        if (g == null || !g.validVertex(vert)) return null;
        boolean[] visited = new boolean[g.numVertices()];
        Arrays.fill(visited, false);
        LinkedList<V> output = new LinkedList<>();
        DepthFirstSearch(g, vert, visited, output);
        return output;
    }

    /**
     * Returns all paths from vOrig to vDest
     *
     * @param g       Graph instance
     * @param vOrig   Vertex that will be the source of the path
     * @param vDest   Vertex that will be the end of the path
     * @param visited set of discovered vertices
     * @param path    stack with vertices of the current path (the path is in reverse order)
     * @param paths   ArrayList with all the paths (in correct order)
     */
    private static <V, E> void allPaths(Graph<V, E> g, V vOrig, V vDest, boolean[] visited,
                                        LinkedList<V> path, ArrayList<LinkedList<V>> paths) {
        int vKey = g.key(vOrig);
        if (visited[vKey]) return;

        if (vOrig.equals(vDest)) {
            LinkedList<V> pathCopy = new LinkedList<>(path);
            pathCopy.addFirst(vDest);
            Collections.reverse(pathCopy);
            paths.add(new LinkedList<>(pathCopy));
            return;
        }

        path.push(vOrig);
        visited[vKey] = true;

        for (V vAdj : g.adjVertices(vOrig)) {
            allPaths(g, vAdj, vDest, visited, path, paths);
        }
        path.pop();
        visited[vKey] = false;

    }

    /**
     * Returns all paths from vOrig to vDest
     *
     * @param g     Graph instance
     * @param vOrig information of the Vertex origin
     * @param vDest information of the Vertex destination
     * @return paths ArrayList with all paths from vOrig to vDest
     */
    public static <V, E> ArrayList<LinkedList<V>> allPaths(Graph<V, E> g, V vOrig, V vDest) {
        if (g == null || !g.validVertex(vOrig) || !g.validVertex(vDest)) return null;
        boolean[] visited = new boolean[g.numVertices()];
        Arrays.fill(visited, false);
        LinkedList<V> path = new LinkedList<>();
        ArrayList<LinkedList<V>> paths = new ArrayList<>();
        allPaths(g, vOrig, vDest, visited, path, paths);
        return paths;
    }

    /**
     * Computes shortest-path distance from a source vertex to all reachable
     * vertices of a graph g with non-negative edge weights
     * This implementation uses Dijkstra's algorithm
     *
     * @param g        Graph instance
     * @param vOrig    Vertex that will be the source of the path
     * @param visited  set of previously visited vertices
     * @param pathKeys minimum path vertices keys
     * @param dist     minimum distances
     */
    public static <V, E> void shortestPathDijkstra(Graph<V, E> g, V vOrig,
                                                   Comparator<E> ce, BinaryOperator<E> sum, E zero,
                                                   boolean[] visited, List<V> pathKeys, List<E> dist) {

        if (g == null || !g.validVertex(vOrig)) return;
        dist.clear();
        dist.addAll(Collections.nCopies(g.numVertices(), null));


        for (int i = 0; i < visited.length; i++) {
            pathKeys.add(null);
        }

        int vOrigKey = g.key(vOrig);
        dist.set(vOrigKey, zero);
        pathKeys.set(vOrigKey, vOrig);

        while (vOrigKey != -1) {
            visited[vOrigKey] = true;
            vOrig = g.vertex(vOrigKey);
            for (V vAdj : g.adjVertices(vOrig)) {
                Edge<V, E> myEdge = g.edge(vOrig, vAdj);
                int vAdjKey = g.key(vAdj);

                if (dist.get(vAdjKey) != null) {
                    if (!visited[vAdjKey] && ce.compare(dist.get(vAdjKey), sum.apply(dist.get(vOrigKey), myEdge.getWeight())) > 0) {
                        dist.set(vAdjKey, sum.apply(dist.get(vOrigKey), myEdge.getWeight()));
                        pathKeys.set(vAdjKey, vOrig);
                    }
                } else {
                    dist.set(vAdjKey, sum.apply(dist.get(vOrigKey), myEdge.getWeight()));
                    pathKeys.set(vAdjKey, vOrig);
                }
            }
            vOrigKey = getVertMinDist(dist, visited, ce, zero);
        }
    }


    private static <E> int getVertMinDist(List<E> dist, boolean[] visited, Comparator<E> ce, E zero) {
        int minDistanceKey = -1;
        E min = null;
        for (int i = 0; i < dist.size(); i++) {
            if (dist.get(i) == null) continue;
            if (min == null && dist.get(i) != zero && !visited[i]) {
                min = dist.get(i);
                minDistanceKey = i;
                continue;
            }
            if (min == null) continue;
            if (!visited[i] && ce.compare(dist.get(i), min) < 0) {
                min = dist.get(i);
                minDistanceKey = i;
            }
        }
        return minDistanceKey;
    }


    /**
     * Shortest-path between two vertices
     *
     * @param g         graph
     * @param vOrig     origin vertex
     * @param vDest     destination vertex
     * @param ce        comparator between elements of type E
     * @param sum       sum two elements of type E
     * @param zero      neutral element of the sum in elements of type E
     * @param shortPath returns the vertices which make the shortest path
     * @return if vertices exist in the graph and are connected, true, false otherwise
     */


    public static <V, E> E shortestPath(Graph<V, E> g, V vOrig, V vDest,
                                        Comparator<E> ce, BinaryOperator<E> sum, E zero,
                                        LinkedList<V> shortPath) {

        if (g == null || !g.validVertex(vOrig) || !g.validVertex(vDest)) return null;

        int size = g.numVertices();
        boolean[] visited = new boolean[size];
        List<V> pathKeys = new ArrayList<>(size);
        List<E> dist = new ArrayList<>();

        shortestPathDijkstra(g, vOrig, ce, sum, zero, visited, pathKeys, dist);
        getPath(g, vOrig, vDest, pathKeys, shortPath);
        if (shortPath.isEmpty()) return null;

        return dist.get(g.key(vDest));
    }

    /**
     * Shortest-path between a vertex and all other vertices
     *
     * @param g     graph
     * @param vOrig start vertex
     * @param ce    comparator between elements of type E
     * @param sum   sum two elements of type E
     * @param zero  neutral element of the sum in elements of type E
     * @param paths returns all the minimum paths
     * @param dists returns the corresponding minimum distances
     * @return if vOrig exists in the graph true, false otherwise
     */
    public static <V, E> boolean shortestPaths(Graph<V, E> g, V vOrig,
                                               Comparator<E> ce, BinaryOperator<E> sum, E zero,
                                               ArrayList<LinkedList<V>> paths, ArrayList<E> dists) {
        if (g == null || !g.validVertex(vOrig)) return false;
        /*
        int size = g.numVertices();
        boolean[] visited = new boolean[size];
        List<V> pathKeys = new ArrayList<>(size);
        List<E> dist = new ArrayList<>(size);

        shortestPathDijkstra(g, vOrig, ce, sum, zero, visited, pathKeys, dist);

        for (V vDest : g.vertices()) {
            dists.add(dist.get(g.key(vDest)));
            LinkedList<V> path = new LinkedList<>();
            getPath(g, vOrig, vDest, pathKeys, path);
            paths.add(path);
        }
        */
        for (V vDest: g.vertices()){
            LinkedList<V> shortestPath=new LinkedList<>();
            E distance=shortestPath(g, vOrig, vDest, ce, sum, zero, shortestPath);
            paths.add(shortestPath);
            dists.add(distance);
        }

        return true;
    }

    /**
     * Extracts from pathKeys the minimum path between voInf and vdInf
     * The path is constructed from the end to the beginning
     *
     * @param g        Graph instance
     * @param vOrig    information of the Vertex origin
     * @param vDest    information of the Vertex destination
     * @param pathKeys minimum path vertices keys
     * @param path     stack with the minimum path (correct order)
     */
    public static <V, E> void getPath(Graph<V, E> g, V vOrig, V vDest,
                                      List<V> pathKeys, LinkedList<V> path) {
        if (g == null || !g.validVertex(vOrig) || !g.validVertex(vDest)) return;
        if (vOrig.equals(vDest) && path.isEmpty()) {
            path.add(vOrig);
            return;
        }

        V vertex = vDest;
        while (!vertex.equals(vOrig)) {
            path.addFirst(vertex);
            int keySearch = g.key(vertex);
            vertex = pathKeys.get(keySearch);

            if (vertex == null && vertex != vOrig) {
                path.clear();
                return;
            }
        }
        if (path.getLast().equals(vOrig)) System.out.println(path.getLast());

        path.addFirst(vOrig);/*
        System.out.println(path.getFirst());
        System.out.println(path);
        int size=path.size();
        path.remove(size-1);
        System.out.println(path);*/
        removeDuplicates(path);
        removeElementsAfter(path, vDest);
    }


    /**
     * Given an undirected, connected graph with positive edge weights, a minimum spanning tree (MST) is calculated.
     * This algorithm uses Prim's algorithm.
     *
     * @param g    graph to calculate.
     * @param zero neutral element of the sum in elements of type E.
     * @param ce   comparator between elements of type E.
     * @return minimum spanning tree.
     */
    public static <V, E> MapGraph<V, E> primMST(Graph<V, E> g, E zero,
                                                Comparator<E> ce) {
        if (g == null)
            return null;

        if (g.isDirected())
            return null;

        int size = g.numVertices();

        ArrayList<E> dist = new ArrayList<>(size);
        ArrayList<V> path = new ArrayList<>(size);
        boolean[] visited = new boolean[size];

        for (int i = 0; i < size; i++) {
            dist.add(null);
            path.add(null);
            visited[i] = false;
        }

        V vOrig = g.vertex(g.numVertices() - 1);
        dist.set(g.numVertices() - 1, zero);
        path.set(g.numVertices() - 1, vOrig);
        int vOrigKey = g.key(vOrig);

        while (vOrigKey != -1) {
            visited[vOrigKey] = true;
            vOrig = g.vertex(vOrigKey);
            for (V vAdj : g.adjVertices(vOrig)) {
                Edge<V, E> edge = g.edge(vOrig, vAdj);
                int vAdjKey = g.key(vAdj);
                if (dist.get(vAdjKey) != null) {
                    if (!visited[vAdjKey] && ce.compare(dist.get(vAdjKey), edge.getWeight()) > 0) {
                        dist.set(vAdjKey, edge.getWeight());
                        path.set(vAdjKey, vOrig);
                    }
                } else {
                    path.set(vAdjKey, vOrig);
                    dist.set(vAdjKey, edge.getWeight());
                }
            }
            vOrigKey = getVertMinDist(dist, visited, ce, zero);
        }
        MapGraph<V, E> mst = new MapGraph<>(false);

        for (V vertex : g.vertices())
            mst.addVertex(vertex);

        buildMST(mst, path, dist, zero);
        return mst;
    }

    private static <V, E> void buildMST(Graph<V, E> mst, ArrayList<V> path, ArrayList<E> dist, E zero) {
        for (int i = 0; i < path.size(); i++) {
            E d = dist.get(i);
            if (d.equals(zero))
                continue;
            V v1 = path.get(i);
            V v2 = mst.vertex(i);
            mst.addEdge(v1, v2, d);
        }
    }

    /**
     * Calculates a minimum spanning tree using Kruskal's algorithm
     *
     * @param g graph to calculate
     * @return minimum spanning tree
     */
    public static <V, E> MapGraph<V, E> kruskalMST(Graph<V, E> g) {
        if (g == null) return null;
        if (g.isDirected()) return null;

        MapGraph<V, E> mst = new MapGraph<>(false);

        for (V vertex : g.vertices()) {
            mst.addVertex(vertex);
        }

        List<Edge<V, E>> lstEdges = new ArrayList<>();
        for (Edge<V, E> edge : g.edges()) {
            lstEdges.add(edge);
        }

        lstEdges.sort(Comparator.comparing(Edge::getWeightDouble));

        for (Edge<V, E> edge : lstEdges) {
            LinkedList<V> connectedVerts = DepthFirstSearch(mst, edge.getVOrig());
            if (!connectedVerts.contains(edge.getVDest())) {
                mst.addEdge(edge.getVOrig(), edge.getVDest(), edge.getWeight());
            }
        }
        return mst;
    }

    public static <V, E> Double totalGraphDistance(Graph<V, E> g) {
        if (g == null) return null;
        Double totalDistance = 0.0;
        for (Edge<V, E> edge : g.edges()) {
            totalDistance += edge.getWeightDouble();
        }
        return totalDistance;
    }


    //__________________________

    /**
     * Shortest-path between two vertices in an unweighted graph
     *
     * @param g         graph
     * @param vOrig     origin vertex
     * @param vDest     destination vertex
     * @param shortPath returns the vertices which make the shortest path
     * @return if vertices exist in the graph and are connected, true, false otherwise
     */
    public static <V, E> boolean shortestPath(Graph<V, E> g, V vOrig, V vDest, LinkedList<V> shortPath) {
        if (g == null || !g.validVertex(vOrig) || !g.validVertex(vDest)) return false;

        boolean[] visited = new boolean[g.numVertices()];
        List<V> pathKeys = new ArrayList<>(g.numVertices());
        breadthFirstSearch(g, vOrig, visited, pathKeys);
        getPath(g, vOrig, vDest, pathKeys, shortPath);
        return !shortPath.isEmpty();
    }

    /**
     * Shortest-path between a vertex and all other vertices in an unweighted graph
     *
     * @param g     graph
     * @param vOrig start vertex
     * @param paths returns all the minimum paths
     * @return if vOrig exists in the graph true, false otherwise
     */
    public static <V, E> boolean shortestPaths(Graph<V, E> g, V vOrig, ArrayList<LinkedList<V>> paths) {
        if (g == null || !g.validVertex(vOrig)) return false;

        boolean[] visited = new boolean[g.numVertices()];
        List<V> pathKeys = new ArrayList<>(g.numVertices());

        breadthFirstSearch(g, vOrig, visited, pathKeys);

        for (V vDest : g.vertices()) {
            LinkedList<V> path = new LinkedList<>();
            getPath(g, vOrig, vDest, pathKeys, path);
            paths.add(path);
        }

        return true;
    }

    // Helper method for breadth-first search in unweighted graph
    private static <V, E> void breadthFirstSearch(Graph<V, E> g, V vert, boolean[] visited, List<V> pathKeys) {
        Queue<V> queue = new LinkedList<>();
        int vertKey = g.key(vert);

        visited[vertKey] = true;
        queue.add(vert);
        pathKeys.add(null);

        while (!queue.isEmpty()) {
            V current = queue.poll();

            for (V vAdj : g.adjVertices(current)) {
                int vAdjKey = g.key(vAdj);
                if (!visited[vAdjKey]) {
                    visited[vAdjKey] = true;
                    queue.add(vAdj);
                    pathKeys.add(current);
                }
            }
        }
    }

    public static <V, E> LinkedList<V> shortestCircuitWithHubs(Graph<V, E> g, V origin, int numHubs) {
        if (g == null || !g.validVertex(origin) || numHubs < 0) return new LinkedList<>();

        LinkedList<V> shortestCircuit = new LinkedList<>();
        List<V> currentPath = new ArrayList<>();
        boolean[] visited = new boolean[g.numVertices()];
        double[] shortestDistance = {Double.MAX_VALUE};

        allCircuitsWithHubs(g, origin, origin, numHubs, visited, currentPath, shortestCircuit, shortestDistance);

        return shortestCircuit;
    }

    public static <V, E> void allCircuitsWithHubs(Graph<V, E> g, V origin, V current, int numHubs,
                                                   boolean[] visited, List<V> currentPath,
                                                   LinkedList<V> shortestCircuit, double[] shortestDistance) {
        visited[g.key(current)] = true;
        currentPath.add(current);

        double currentDistance = calculateDistance(g, currentPath);

        if (currentPath.size() == numHubs + 1) {
            // Found a circuit with the specified number of intermediate hubs
            if (currentDistance < shortestDistance[0]) {
                shortestDistance[0] = currentDistance;
                shortestCircuit.clear();
                shortestCircuit.addAll(currentPath);
            }
        } else {
            for (V vAdj : g.adjVertices(current)) {
                if (!visited[g.key(vAdj)]) {
                    allCircuitsWithHubs(g, origin, vAdj, numHubs, visited, currentPath, shortestCircuit, shortestDistance);
                }
            }
        }

        visited[g.key(current)] = false;
        currentPath.remove(current);
    }

    private static <V, E> double calculateDistance(Graph<V, E> g, List<V> path) {
        double distance = 0.0;

        for (int i = 0; i < path.size() - 1; i++) {
            V currentVertex = path.get(i);
            V nextVertex = path.get(i + 1);

            // Check if vertices are valid
            if (g.validVertex(currentVertex) && g.validVertex(nextVertex)) {
                // Find the edge between two vertices
                Edge<V, E> edge = null;
                for (Edge<V, E> e : g.edges()) {
                    if ((e.getVOrig().equals(currentVertex) && e.getVDest().equals(nextVertex))
                            || (!g.isDirected() && e.getVDest().equals(currentVertex) && e.getVOrig().equals(nextVertex))) {
                        edge = e;
                        break;
                    }
                }

                // If edge is found, add its weight to the distance
                if (edge != null) {
                    distance += Double.parseDouble(edge.getWeight().toString());
                }
            }
        }

        return distance;
    }




}

