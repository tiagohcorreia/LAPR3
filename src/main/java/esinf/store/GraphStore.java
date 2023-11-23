package esinf.store;

import dataStructure.Distancia;
import dataStructure.FurthestPlacesData;
import esinf.Edge;
import esinf.Graph;
import esinf.map.MapGraph;
import esinf.model.Local;

import java.util.*;

public class GraphStore {
    static boolean directed = false;
    private static MapGraph<Local, Integer> graph = new MapGraph<>(directed);

    public  MapGraph<Local, Integer> getGraph() {
        return graph;
    }

    public  void addVertex(Local vertex) {
        graph.addVertex(vertex);
    }

    public  void addEdge(Local local1,Local local2, int distancia) {
        graph.addEdge(local1,local2,distancia);
    }


    //----------------
    public MapGraph<Local, Integer> getCloneGraph() {
        return new MapGraph<>(graph);
    }

    public MapGraph<Local, Integer> removeEdgesAboveAutonomy(double autonomy) {
        MapGraph<Local, Integer> clone = getCloneGraph();
        List<Local> list = clone.vertices();
        int count = 0;
        // System.out.println(clone);
        for (int i = 0; i < clone.numVertices(); i++) {
            for (int j = 0; j < clone.numVertices() - 1; j++) {
                count++;
                if (clone.edge(i, j) != null) {
                    if (clone.edge(list.get(i), list.get(j)).getWeightDouble() > autonomy) {
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

    public Distancia getFurthestPlaces() {
        MapGraph<Local, Integer> clone = getCloneGraph();
        double distance = 0;
        double temp;
        List<Local> list = clone.vertices();
        Distancia data = null;
        for (int i = 0; i < list.size(); i++) {
            for (int j = 0; j < list.size() - 1; j++) {
                if (list.get(i) != null && list.get(j) != null) {
                    Local lcl1 = list.get(i);
                    Local lcl2 = list.get(j);
                    temp = lcl1.getGps().getDistance(lcl2.getGps());
                    if (temp > distance) {
                        distance = temp;
                        data = new Distancia(lcl1, lcl2, distance);
                    }
                }
            }
        }
        return data;

    }

   /* public FurthestPlacesData getFurthestPlacesData(double autonomy) {
        Distancia distanciaData = getFurthestPlaces();
        Graph<Local, Integer> clone=removeEdgesAboveAutonomy(autonomy);

    }*/

}
