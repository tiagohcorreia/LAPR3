package esinf.us_ei_02;

import esinf.Algorithms;
import esinf.Graph;
import org.apache.commons.lang3.tuple.MutablePair;
import org.apache.commons.lang3.tuple.Pair;

import java.util.*;
import java.util.Comparator;
import java.util.Map;
import java.util.function.BinaryOperator;

public class IdealVerticesCalculator<V, E> {

    private Graph<V, E> graph;
    private Comparator<E> comparator;
    private BinaryOperator<E> binaryOperator;
    private E neutralValue;
    private Map<V, E> verticesAndProximities; //is filled when the function getAllShortestPathsForAllVertices() is called
    private Map<V, ArrayList<LinkedList<V>>> allShortestPathsForAllVertices;
    private Map<V, Integer> verticesAndCentralities;

    public IdealVerticesCalculator(Graph<V, E> graph, Comparator<E> comparator, BinaryOperator<E> binaryOperator, E neutralValue) {
        this.graph = graph;
        this.comparator = comparator;
        this.binaryOperator = binaryOperator;
        this.neutralValue = neutralValue;

        getAllShortestPathsForAllVertices(); //fills the attributes paths, distances and allShortestPathsForAllVertices
        getVerticesAndCentralities();
    }

    public Graph<V, E> getGraph() {
        return graph;
    }

    public void setGraph(Graph<V, E> graph) {
        this.graph = graph;
    }

    public Comparator<E> getComparator() {
        return comparator;
    }

    public void setComparator(Comparator<E> comparator) {
        this.comparator = comparator;
    }

    public BinaryOperator<E> getBinaryOperator() {
        return binaryOperator;
    }

    public void setBinaryOperator(BinaryOperator<E> binaryOperator) {
        this.binaryOperator = binaryOperator;
    }

    public E getNeutralValue() {
        return neutralValue;
    }

    public void setNeutralValue(E neutralValue) {
        this.neutralValue = neutralValue;
    }

    public ArrayList<V> getVerticesByIdealOrder() {
        ArrayList<V> verticesSorted = getVerticesByCentrality();
        Pair<Boolean, ArrayList<Pair<V, V>>> verticesWithSameCentrality = checkVerticesWithSameCentrality();

        if (verticesWithSameCentrality.getKey()) {

            verticesSorted = getVerticesByCentralityAndProximity(verticesSorted, verticesWithSameCentrality);
            Pair<Boolean, ArrayList<Pair<V, V>>> verticesWithSameCentralityAndProximity = checkVerticesWithSameCentralityAndProximity(verticesWithSameCentrality);

            if (verticesWithSameCentralityAndProximity.getKey()) {
                verticesSorted = getVerticesByCentralityProximityAndImportance(verticesSorted, verticesWithSameCentralityAndProximity);
            }
        }

        Collections.reverse(verticesSorted);
        return verticesSorted;
    }

    public Map<V, ArrayList<LinkedList<V>>> getAllShortestPathsForAllVertices() {
        allShortestPathsForAllVertices = new HashMap<>();
        verticesAndProximities=new HashMap<>();
        try {
            for (V v : graph.vertices()) {

                ArrayList<LinkedList<V>> paths = new ArrayList<>();
                ArrayList<E> distances = new ArrayList<>();
                boolean success = Algorithms.shortestPaths(graph, v, comparator, binaryOperator, neutralValue, paths, distances);

                if (!success) {
                    throw new Exception("Não foi possível obter os caminhos para todos o vértices");
                } else {
                    allShortestPathsForAllVertices.put(v, paths);
                    E totalDistance = neutralValue;

                    for (E e : distances) {
                        totalDistance = binaryOperator.apply(totalDistance, e);
                    }

                    verticesAndProximities.put(v, totalDistance);
                }
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
            e.printStackTrace();
        }

        return allShortestPathsForAllVertices;
    }

    public Map<V, Integer> getVerticesAndCentralities() {
        verticesAndCentralities = new HashMap<>();
        for (V v : graph.vertices()) {

            //counts how many shortests paths the vertice belongs to
            int count = 0;

            for (LinkedList<V> l : allShortestPathsForAllVertices.get(v)) {
                if (l.contains(v)) {
                    count++;
                }
            }
            verticesAndCentralities.put(v, count);
        }

        return verticesAndCentralities;
    }

    public Map<V, E> getVerticesAndProximities() {
        return verticesAndProximities;
    }

    private ArrayList<V> getVerticesByCentrality() {
        ArrayList<Map.Entry<V, Integer>> mapEntries = new ArrayList<>(verticesAndCentralities.entrySet());
        mapEntries.sort(new CentralityComparator<>());

        ArrayList<V> verticesByCentrality = new ArrayList<>();

        for (Map.Entry<V, Integer> e : mapEntries) {
            verticesByCentrality.add(e.getKey());
        }

        return verticesByCentrality;
    }

    private Pair<Boolean, ArrayList<Pair<V, V>>> checkVerticesWithSameCentrality() {
        Pair<Boolean, ArrayList<Pair<V, V>>> verticesWithSameCentrality = new MutablePair<>(false, new ArrayList<>());
        ArrayList<Map.Entry<V, Integer>> mapEntries = new ArrayList<>(verticesAndCentralities.entrySet());

        for (int i = 0; i < mapEntries.size(); i++) {

            for (int j = i + 1; j < mapEntries.size(); j++) {

                Integer centrality1 = mapEntries.get(i).getValue();
                Integer centrality2 = mapEntries.get(j).getValue();

                if (centrality1.equals(centrality2)) {
                    if (verticesWithSameCentrality.getKey().equals(false)) {
                        verticesWithSameCentrality = new MutablePair<>(true, new ArrayList<>());
                    }

                    V vertex1 = mapEntries.get(i).getKey();
                    V vertex2 = mapEntries.get(j).getKey();

                    Pair<V, V> pair = new MutablePair<>(vertex1, vertex2);

                    verticesWithSameCentrality.getValue().add(pair);
                }
            }
        }
        return verticesWithSameCentrality;
    }

    private ArrayList<V> getVerticesByCentralityAndProximity(ArrayList<V> verticesSorted, Pair<Boolean, ArrayList<Pair<V, V>>> verticesWithSameCentrality) {
        for (Pair<V, V> pair : verticesWithSameCentrality.getValue()) {

            V v1 = pair.getLeft();
            V v2 = pair.getRight();

            E prox1 = verticesAndProximities.get(v1);
            E prox2 = verticesAndProximities.get(v2);

            if (comparator.compare(prox1, prox2) > 0) {

                int i1 = verticesSorted.indexOf(v1);
                int i2 = verticesSorted.indexOf(v2);

                verticesSorted.set(i1, v2);
                verticesSorted.set(i2, v1);
            }
        }

        return verticesSorted;
    }

    private Pair<Boolean, ArrayList<Pair<V, V>>> checkVerticesWithSameCentralityAndProximity(Pair<Boolean, ArrayList<Pair<V, V>>> verticesWithSameCentrality) {
        Pair<Boolean, ArrayList<Pair<V, V>>> verticesWithSameCentralityAndProximity = new MutablePair<>(false, new ArrayList<>());
        for (Pair<V, V> pair : verticesWithSameCentrality.getValue()) {

            V v1 = pair.getKey();
            V v2 = pair.getValue();
            E v1Proximity = verticesAndProximities.get(v1);
            E v2Proximity = verticesAndProximities.get(v2);

            if (v1Proximity.equals(v2Proximity)) {
                verticesWithSameCentralityAndProximity = new MutablePair<>(true, new ArrayList<>());
                verticesWithSameCentralityAndProximity.getValue().add(pair);
            }
        }

        return verticesWithSameCentralityAndProximity;
    }

    private ArrayList<V> getVerticesByCentralityProximityAndImportance(ArrayList<V> verticesSorted, Pair<Boolean, ArrayList<Pair<V, V>>> verticesWithSameCentralityAndProximity) {
        for (Pair<V, V> pair : verticesWithSameCentralityAndProximity.getValue()) {

            V v1 = pair.getLeft();
            V v2 = pair.getRight();

            int d1 = graph.inDegree(v1);
            int d2 = graph.inDegree(v2);

            if (d1 > d2) {

                int i1 = verticesSorted.indexOf(v1);
                int i2 = verticesSorted.indexOf(v2);

                verticesSorted.set(i1, v2);
                verticesSorted.set(i2, v1);
            }
        }

        return verticesSorted;
    }
}
