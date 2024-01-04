package esinf.us_ei08;

import esinf.Edge;
import esinf.Graph;
import esinf.model.Hub;
import esinf.model.Local;
import esinf.model.Vehicle;
import esinf.store.GraphStore;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

/**
 * The type Greedy tsp.
 *
 * @param <V> the type parameter
 * @param <E> the type parameter
 */
public class GreedyTSP<V, E> {

    private double totalDistance;
    /**
     * The Number of chargings.
     */
    int numberOfChargings;
    private GraphStore graphStore = new GraphStore();

    /**
     * Find shortest circuit list.
     *
     * @param graph       the graph
     * @param origin      the origin
     * @param numVertices the num vertices
     * @param numHubs     the num hubs
     * @param vehicle     the vehicle
     * @return the list
     */
    public List<V> findShortestCircuit(Graph<V, E> graph, V origin, int numVertices, int numHubs, Vehicle vehicle) {
        float autonomy = vehicle.getAutonomyDistance();
        numberOfChargings = 0;
        totalDistance = 0;
        List<V> circuit = new ArrayList<>();
        boolean[] visited = new boolean[graph.numVertices()];

        graph = removeEdgesAboveAutonomy(vehicle, graph);

        V currentVertex = origin;
        circuit.add(currentVertex);
        visited[graph.key(currentVertex)] = true;


        int hubCount = (currentVertex instanceof Hub) ? 1 : 0;

        while (circuit.size() < numVertices && hubCount < numHubs) {
            V nextVertex = findNextVertex(graph, currentVertex, origin, visited, vehicle, numHubs - hubCount, circuit);
            if (nextVertex == null) {
                throw new IllegalStateException("Unable to find a valid circuit for the current specifications");
            }

            if (nextVertex instanceof Hub && nextVertex != origin) {
                hubCount++;
            }

            E edgeWeight = graph.edge(currentVertex, nextVertex).getWeight();
            totalDistance += (edgeWeight != null) ? (int) edgeWeight : 0;
            if ((int) edgeWeight > autonomy) {

                if (nextVertex != origin) {
                    numberOfChargings++;
                    autonomy = vehicle.getAutonomyDistance();
                    autonomy = autonomy - (int) edgeWeight;
                }
            } else {
                autonomy = autonomy - (int) edgeWeight;
            }

            circuit.add(nextVertex);
            visited[graph.key(nextVertex)] = true;
            currentVertex = nextVertex;
        }

        V lastVertex = circuit.get(circuit.size() - 1);
        Edge<V, E> lastEdge = graph.edge(lastVertex, origin);
        if (lastEdge == null || lastEdge.getWeight() == null) {
            throw new IllegalStateException("No valid Circuit could be found");
        }

        E lastEdgeWeight = lastEdge.getWeight();

        totalDistance += (lastEdgeWeight != null) ? (int) lastEdgeWeight : 0;
        if (lastVertex != origin && (int) lastEdgeWeight > autonomy) {
            numberOfChargings++;
        }

        if (graph.edge(lastVertex, origin) == null) {
            System.out.println("Backtracking to find a path from " + lastVertex + " to " + origin);

            // Backtrack to find a path from lastVertex to origin
            for (int i = circuit.size() - 2; i >= 0; i--) {
                V backtrackVertex = circuit.get(i);
                Edge<V, E> backtrackEdge = graph.edge(backtrackVertex, origin);

                if (backtrackEdge != null) {
                    // Found a path to the origin, add the backtracked vertices to the circuit
                    for (int j = i + 1; j < circuit.size(); j++) {
                        V backtrackedVertex = circuit.get(j);
                        circuit.add(backtrackedVertex);
                    }
                    break;
                }
            }
        }


        circuit.add(origin);

        return circuit;
    }


    /**
     * Gets total distance.
     *
     * @return the total distance
     */
    public double getTotalDistance() {
        return totalDistance;
    }

    /**
     * Gets number of chargings.
     *
     * @return the number of chargings
     */
    public int getNumberOfChargings() {
        return numberOfChargings;
    }

    private V findNextVertex(Graph<V, E> graph, V currentVertex, V origin, boolean[] visited, Vehicle vehicle, int remainingHubs, List<V> circuit) {
        double maxScore = Double.MIN_VALUE;
        V nextVertex = null;

        for (V vertex : graph.adjVertices(currentVertex)) {
            int vertexKey = graph.key(vertex);
            if (!visited[vertexKey]) {
                E edgeWeight = graph.edge(currentVertex, vertex).getWeight();
                    if (vertex instanceof Hub && circuit.contains(vertex) && vertex != circuit.get(circuit.size() - 1)) {
                        continue;
                    }

                    double score = calculateScore((Local) vertex, edgeWeight);

                    if (vertex instanceof Hub && remainingHubs > 0) {
                        score *= 2;
                    }
                    if (score > maxScore) {
                        maxScore = score;
                        nextVertex = vertex;
                    }

            }
        }

        return nextVertex;
    }
    private double calculateScore(Local hub, E edgeWeight) {
        int collaborators = hub.getNumberOfCollaborators();
        double weight = (edgeWeight != null) ? (int) edgeWeight : 0;

        return collaborators * (1 / (1 + weight));
    }

    /**
     * Remove edges above autonomy graph.
     *
     * @param <V>     the type parameter
     * @param <E>     the type parameter
     * @param vehicle the vehicle
     * @param graph   the graph
     * @return the graph
     */
    public <V, E> Graph<V, E> removeEdgesAboveAutonomy(Vehicle vehicle, Graph<V, E> graph) {
        Iterator<Edge<V, E>> iterator = graph.edges().iterator();
        while (iterator.hasNext()) {
            Edge<V, E> edge = iterator.next();
            if (edge.getWeight() instanceof Number && ((Number) edge.getWeight()).doubleValue() > vehicle.getAutonomyDistance()) {
                iterator.remove();
            }
        }
        return graph;
    }
}
