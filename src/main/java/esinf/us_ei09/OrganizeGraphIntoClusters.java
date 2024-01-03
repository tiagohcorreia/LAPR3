package esinf.us_ei09;

import esinf.Algorithms;
import esinf.Edge;
import esinf.Graph;
import esinf.model.Local;

import java.util.*;
import java.util.function.BinaryOperator;
import java.util.stream.Collectors;

/**
 * The type Organize graph into clusters.
 */
public class OrganizeGraphIntoClusters {
    /**
     * Organize graph map.
     *
     * @param graph the graph
     * @return the map
     */
    public static Map<HubLocal, Set<Local>> organizeGraph(Graph<Local, Integer> graph) {

        if (graph.isDirected()) throw new IllegalArgumentException("Operação não pode ser feita num grafo orientado");

        Map<HubLocal, Set<Local>> hubList = new HashMap<>();
        List<Local> vertexList = new ArrayList<>(graph.vertices());

        while (!vertexList.isEmpty()) {

            Local hub = vertexList.get(0);

            // Encontrar os caminhos mais curtos para todos os pontos a partir do hub
            List<LinkedList<Local>> shortestPathsFromHub = new ArrayList<>();

            for (Local destination : vertexList) {

                if (!hub.equals(destination)) {

                    LinkedList<Local> shortestPath = new LinkedList<>();
                    Algorithms.shortestPathDijkstra(graph, hub, Comparator.naturalOrder(), BinaryOperator.minBy(Comparator.naturalOrder()), 0, new boolean[graph.numVertices()], new ArrayList<>(), new ArrayList<>());
                    shortestPathsFromHub.add(shortestPath);
                }
            }

            // Encontrar a aresta com o maior número de caminhos curtos
            Edge<Local, Integer> edgeToRemove = findEdgeWithMaxShortestPaths(graph, shortestPathsFromHub);

            // Remover aresta
            if (edgeToRemove != null) {
                graph.removeEdge(edgeToRemove.getVOrig(), edgeToRemove.getVDest());
            }

            // Criar novo cluster com o hub e os destinos alcançados
            Set<Local> cluster = new HashSet<>(shortestPathsFromHub.stream().flatMap(Collection::stream).collect(Collectors.toList()));
            cluster.add(hub);

            // Adicionar o hub e o cluster a lista de hubs
            hubList.put(new HubLocal(hub, cluster), cluster);

            // Remover vertices do cluster da lista de vertices
            vertexList.removeAll(cluster);
        }
        return hubList;
    }

    /**
     * Find edge with max shortest paths edge.
     *
     * @param graph         the graph
     * @param shortestPaths the shortest paths
     * @return the edge
     */
    public static Edge<Local, Integer> findEdgeWithMaxShortestPaths(Graph<Local, Integer> graph, List<LinkedList<Local>> shortestPaths) {

        Edge<Local, Integer> edgeWithMaxShortestPaths = null;
        int maxShortestPaths = 0;

        for (Edge<Local, Integer> edge : graph.edges()) {

            int edgeShortestPaths = countShortestPaths(edge, shortestPaths);

            if (edgeShortestPaths > maxShortestPaths) {

                maxShortestPaths = edgeShortestPaths;
                edgeWithMaxShortestPaths = edge;
            }
        }
        return edgeWithMaxShortestPaths;
    }

    private static int countShortestPaths(Edge<Local, Integer> edge, List<LinkedList<Local>> shortestPaths) {

        int count = 0;

        for (LinkedList<Local> path : shortestPaths) {

            if (path.contains(edge.getVOrig()) && path.contains(edge.getVDest())) {
                count++;
            }
        }
        return count;
    }
}
