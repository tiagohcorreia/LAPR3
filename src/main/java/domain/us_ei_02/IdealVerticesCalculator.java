package domain.us_ei_02;

import esinf.Algorithms;
import esinf.Graph;

import java.util.*;
import java.util.Comparator;
import java.util.Map;
import java.util.function.BinaryOperator;

public class IdealVerticesCalculator<V, E> {

    private Graph<V,E> graph;
    private Comparator<E> comparator;
    private BinaryOperator<E> binaryOperator;
    private E neutralValue;

    public IdealVerticesCalculator(Graph<V,E> graph, Comparator<E> comparator, BinaryOperator<E> binaryOperator, E neutralValue){
        this.graph=graph;
        this.comparator=comparator;
        this.binaryOperator=binaryOperator;
        this.neutralValue=neutralValue;
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

    public Map<V, Integer> getVerticesCentrality(){

        Map<V, ArrayList<LinkedList<V>>> allShortestPathsForAllVertices=getAllShortestPathsForAllVertices();
        return getVerticesCentrality(allShortestPathsForAllVertices);
    }

    public  Map<V, ArrayList<LinkedList<V>>> getAllShortestPathsForAllVertices(){

        Map<V, ArrayList<LinkedList<V>>> allShortestPathsForAllVertices=new HashMap<>();

        try{
            for (V v: graph.vertices()){

                ArrayList<LinkedList<V>> paths=new ArrayList<>();
                ArrayList<E> distances=new ArrayList<>();
                boolean success=Algorithms.shortestPaths(graph, v, comparator, binaryOperator, neutralValue, paths, distances);

                if (!success){
                    throw new Exception("Não foi possível obter os caminhos para todos o vértices");
                } else allShortestPathsForAllVertices.put(v, paths);
            }
        } catch (Exception e){
            System.out.println(e.getMessage());
            e.printStackTrace();
        }

        return allShortestPathsForAllVertices;
    }

    private Map<V, Integer> getVerticesCentrality(Map<V, ArrayList<LinkedList<V>>> allShortestPathsForAllVertices){
        Map<V, Integer> verticesCentrality=new HashMap<>();

        for (V v: graph.vertices()){
            //counts how many shortests paths the vertice belongs to
            int count=0;
            for (LinkedList<V> l: allShortestPathsForAllVertices.get(v)){
                if (l.contains(v)){
                    count++;
                }
            }
            verticesCentrality.put(v,count);
        }
        return verticesCentrality;
    }
}
