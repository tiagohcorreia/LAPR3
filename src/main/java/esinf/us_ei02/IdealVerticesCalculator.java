package esinf.us_ei02;

import esinf.Algorithms;
import esinf.Graph;
import esinf.IntegerComparator;
import esinf.dataStructure.VertexMetrics;
import esinf.store.GraphStore;

import java.util.*;
import java.util.Comparator;
import java.util.Map;
import java.util.function.BinaryOperator;

/**
 * The type Ideal vertices calculator.
 *
 * @param <V> the type parameter
 * @param <E> the type parameter
 */
public class IdealVerticesCalculator<V, E> {

    private Graph<V, E> graph;
    private ArrayList<V> vertices;
    private Comparator<E> comparator;
    private BinaryOperator<E> binaryOperator;
    private E neutralValue;
    private ArrayList<VertexMetrics<V, E>> verticesAndMetrics = new ArrayList<>();
    private Map<V, ArrayList<LinkedList<V>>> verticesAndAllShortestPaths = new HashMap<>();
    private Map<V, ArrayList<E>> verticesAndPathsDistances = new HashMap<>();
    private boolean calculationsMade = false;

    /**
     * Instantiates a new Ideal vertices calculator.
     *
     * @param graph          the graph
     * @param vertices       the vertices
     * @param comparator     the comparator
     * @param binaryOperator the binary operator
     * @param neutralValue   the neutral value
     */
    public IdealVerticesCalculator(Graph<V, E> graph, ArrayList<V> vertices, Comparator<E> comparator, BinaryOperator<E> binaryOperator, E neutralValue) {
        this.graph = graph;
        this.vertices = vertices;
        this.comparator = comparator;
        this.binaryOperator = binaryOperator;
        this.neutralValue = neutralValue;
    }

    /**
     * Gets graph.
     *
     * @return the graph
     */
    public Graph<V, E> getGraph() {
        return graph;
    }

    /**
     * Gets vertices and all shortest paths.
     *
     * @return the vertices and all shortest paths
     */
    public Map<V, ArrayList<LinkedList<V>>> getVerticesAndAllShortestPaths() {
        return verticesAndAllShortestPaths;
    }

    /**
     * Gets vertices and paths distances.
     *
     * @return the vertices and paths distances
     */
    public Map<V, ArrayList<E>> getVerticesAndPathsDistances() {
        return verticesAndPathsDistances;
    }

    /**
     * Gets ideal vertices.
     *
     * @return the ideal vertices
     */
    public ArrayList<VertexMetrics<V, E>> getIdealVertices() {
        if (!calculationsMade) {
            getAllShortestPaths();
            getMetrics();
            sortVertices();
            calculationsMade = true;
        }
        return verticesAndMetrics;
    }

    private void getAllShortestPaths() {

        for (V v : vertices) {

            ArrayList<LinkedList<V>> paths = new ArrayList<>();
            ArrayList<E> distances = new ArrayList<>();
            Algorithms.shortestPaths(graph, v, comparator, binaryOperator, neutralValue, paths, distances);

            verticesAndAllShortestPaths.put(v, paths);
            verticesAndPathsDistances.put(v, distances);
        }
    }

    private void getMetrics() {

        for (V v : vertices) {
            int centrality = 0;
            int influence = graph.inDegree(v);
            E proximity = neutralValue;

            for (ArrayList<LinkedList<V>> paths : verticesAndAllShortestPaths.values()) {
                for (LinkedList<V> path : paths) {
                    if (path.contains(v)) {
                        centrality++;
                    }
                }
            }

            ArrayList<E> distances = verticesAndPathsDistances.get(v);
            for (E distance : distances) {
                proximity = binaryOperator.apply(proximity, distance);
            }

            VertexMetrics<V, E> metrics = new VertexMetrics<>(v, centrality, influence, proximity);
            verticesAndMetrics.add(metrics);
        }
    }

    private void sortVertices() {
        Collections.sort(verticesAndMetrics, new VertexMetricsComparator<>(comparator));
        Collections.reverse(verticesAndMetrics);
    }
}
