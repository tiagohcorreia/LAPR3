package esinf.usei04;

import esinf.Algorithms;
import esinf.Edge;
import esinf.Graph;
import esinf.map.MapGraph;
import esinf.map.MapGraphLoader;
import esinf.model.Local;

import java.io.IOException;
import java.util.*;

public class CalculateMinimumSpanningTree {
    public static ReturnData calculateMinimumSpanningTreeWithKruskal(Graph<Local, Integer> graph) {

        if (graph.isDirected()) return null;

        Graph<Local, Integer> minimumSpanningTree = new MapGraph<>(false);

        for (Local vertex : graph.vertices()) {
            minimumSpanningTree.addVertex(vertex);
        }

        List<Edge<Local, Integer>> edgeList = new ArrayList<>();

        for (Edge<Local, Integer> edge : graph.edges()) {
            edgeList.add(edge);
        }

        // Ordenar
        edgeList.sort(Comparator.comparing(Edge::getWeight));

        // armazana o total dos pesos
        int totalWeight = 0;

        for (Edge<Local, Integer> edge : edgeList) {

            LinkedList<Local> connectedVerteces = Algorithms.DepthFirstSearch(minimumSpanningTree, edge.getVOrig());

            if (!connectedVerteces.contains(edge.getVDest())) {

                minimumSpanningTree.addEdge(edge.getVOrig(), edge.getVDest(), edge.getWeight());
                totalWeight += edge.getWeight();
            }
        }
        return new ReturnData(minimumSpanningTree, totalWeight);
    }
}
