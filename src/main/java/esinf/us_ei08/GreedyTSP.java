package esinf.us_ei08;

import esinf.Graph;
import esinf.model.Local;
import esinf.model.Vehicle;

import java.util.ArrayList;
import java.util.List;

public class GreedyTSP<V, E> {

    private double totalDistance;
    int numberOfChargings;


    public List<V> findShortestCircuit(Graph<V, E> graph, V origin, int numVertices, Vehicle vehicle) {
        float autonomy = vehicle.getAutonomyDistance();
        numberOfChargings = 0;
        totalDistance = 0;
        List<V> circuit = new ArrayList<>();
        boolean[] visited = new boolean[graph.numVertices()];

        V currentVertex = origin;
        circuit.add(currentVertex);
        visited[graph.key(currentVertex)] = true;

        while (circuit.size() < numVertices) {
            V nextVertex = findNextVertex(graph, currentVertex, origin, visited, vehicle);
            if (nextVertex == null) {
                throw new IllegalStateException("Unable to find the next vertex.");
            }

            E edgeWeight = graph.edge(currentVertex, nextVertex).getWeight();
            totalDistance += (edgeWeight != null) ? (int) edgeWeight : 0;
            if((int) edgeWeight > autonomy){
                numberOfChargings++;
                autonomy = vehicle.getAutonomyDistance();
            }
            else{ autonomy = autonomy - (int) edgeWeight;}

            circuit.add(nextVertex);
            visited[graph.key(nextVertex)] = true;
            currentVertex = nextVertex;
        }

        V lastVertex = circuit.get(circuit.size() - 1);
        E lastEdgeWeight = graph.edge(lastVertex, origin).getWeight();
        if (lastEdgeWeight == null) {
            throw new IllegalStateException("No valid Circuit could be found");
        }

        totalDistance += (lastEdgeWeight != null) ? (int) lastEdgeWeight : 0;
        if ((int) lastEdgeWeight > autonomy){numberOfChargings++;}

        circuit.add(origin);

        return circuit;
    }

    public double getTotalDistance() {
        return totalDistance;
    }

    public int getNumberOfChargings() {
        return numberOfChargings;
    }

    private V findNextVertex(Graph<V, E> graph, V currentVertex, V origin, boolean[] visited, Vehicle vehicle) {

        double maxScore = Double.MIN_VALUE;
        V nextVertex = null;

        for (V vertex : graph.adjVertices(currentVertex)) {
            int vertexKey = graph.key(vertex);
            if (!visited[vertexKey]) {
                E edgeWeight = graph.edge(currentVertex, vertex).getWeight();



                if ((edgeWeight != null ? (int) edgeWeight : 0) <= vehicle.getAutonomyDistance()) {

                    double score = calculateScore((Local) vertex, edgeWeight, vehicle);

                    if (maxScore < score) {
                        maxScore = score;
                        nextVertex = vertex;
                    }
                }
            }
        }


        if (nextVertex == null) {
            E weightBack = graph.edge(currentVertex, origin).getWeight();
            if (weightBack != null) {
                nextVertex = origin;
            }
        }

        return nextVertex;
    }
    private double calculateScore(Local hub, E edgeWeight, Vehicle vehicle) {
        int collaborators = hub.getNumberOfCollaborators();
        double weight = edgeWeight != null ? (int) edgeWeight : 0;

        return collaborators * (1 / (1 + weight));
    }
}

