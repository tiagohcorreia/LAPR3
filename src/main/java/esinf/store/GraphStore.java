package esinf.store;

import esinf.Algorithms;
import esinf.Edge;
import esinf.Graph;
import esinf.map.MapGraph;
import esinf.model.Distancia;
import esinf.model.Local;

import java.lang.reflect.Array;
import java.util.*;
import java.util.function.BinaryOperator;

public class GraphStore {

    private static MapGraph<Local, Distancia> graph;

    public static MapGraph<Local, Distancia> getGraph() {
        return graph;
    }

    public static void setGraph(MapGraph<Local, Distancia> newGraph) {
        graph = newGraph;
    }




    //----------------
    public MapGraph<Local, Distancia> getCloneGraph() {
        return new MapGraph<>(graph);
    }

    public MapGraph<Local, Distancia> removeEdgesAboveAutonomy(double autonomy) {
        MapGraph<Local, Distancia> clone = getCloneGraph();
        List<Local> list=clone.vertices();
        int count = 0;
        // System.out.println(clone);
        for (int i = 0; i < clone.numVertices(); i++) {
            for (int j = 0; j < clone.numVertices() - 1; j++) {
                count++;
                if (clone.edge(i, j) != null) {
                    if (clone.edge(list.get(i),list.get(j)).getWeightDouble()> autonomy) {
                        clone.removeEdge(clone.vertex(i), clone.vertex(j));
                    }
                    if (clone.edge(i, j) != null) {
                        System.out.println(clone.edge(i, j));
                    }
                }
            }
        }
        return clone;
    }

    public String[] getFurthestPlaces() {
        MapGraph<Local, Distancia> clone = getCloneGraph();
        double distance = 0;
        double temp;
        String[] data = new String[3];
        List<Local> list = clone.vertices();
        for (int i = 0; i < list.size(); i++) {
            for (int j = 0; j < list.size() - 1; j++) {
                if (list.get(i) != null && list.get(j) != null) {
                    System.out.println("Dephane");
                    Local lcl1 = list.get(i);
                    Local lcl2 = list.get(j);
                    System.out.println(lcl1);
                    System.out.println(lcl2);

                    temp = lcl1.getGps().getDistance(lcl2.getGps());
                    if (temp > distance) {
                        distance = temp;
                        data[0] = lcl1.getLocalId();
                        data[1] = lcl2.getLocalId();
                        data[2] = String.valueOf(distance);
                    }
                }
            }
        }
        return data;

    }

    public  <V, E> E shortestPaths(String vOrig, String vDest,
                                        Comparator<E> ce, BinaryOperator<E> sum, E zero,
                                        LinkedList<V> shortPath) {
        esinf.Graph<V, E> g = (Graph<V, E>) getGraph();
        Algorithms algorithms = new Algorithms();
        if (g == null || !g.validVertex((V) vOrig) || !g.validVertex((V) vDest)) return null;
        int size = g.numVertices();
        boolean[] visited = new boolean[size];
        List<V> pathKeys = new ArrayList<>(size);
        List<E> dist = new ArrayList<>(size);

        algorithms.shortestPath(g, (V)vOrig, (V)vDest, ce, sum, zero, shortPath);
        algorithms.getPath(g,(V) vOrig, (V)vDest, pathKeys, shortPath);
        if (shortPath.isEmpty()) return null;

        return dist.get(g.key((V)vDest));
    }


}
