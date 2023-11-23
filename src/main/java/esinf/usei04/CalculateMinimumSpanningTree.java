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
    public ReturnData calculateMinimumSpanningTreeWithKruskal() throws IOException {

        Graph<Local, Integer> graph = MapGraphLoader.loadGraph("docs/esinf_data/locais_small.csv", "docs/esinf_data/distancias_small.csv");

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
        edgeList.sort(Comparator.comparing(Edge::getWeightDouble));

        // Lista para armazenar os pesos das arestas
        List<Double> weightList = new ArrayList<>();

        // Lista para armazenar os vetices visitados na arvore
        List<Local> visitedVertices = new ArrayList<>();

        // armazana o total dos pesos
        double totalWeight = 0;

        for (Edge<Local, Integer> edge : edgeList) {

            LinkedList<Local> connectedVerteces = Algorithms.DepthFirstSearch(minimumSpanningTree, edge.getVOrig());

            if (!connectedVerteces.contains(edge.getVDest())) {

                minimumSpanningTree.addEdge(edge.getVOrig(), edge.getVDest(), edge.getWeight());
                weightList.add(edge.getWeightDouble());
                totalWeight += edge.getWeight();
            }
            visitedVertices = minimumSpanningTree.vertices();

        }
        return new ReturnData(minimumSpanningTree, visitedVertices, weightList, totalWeight);
    }
}
