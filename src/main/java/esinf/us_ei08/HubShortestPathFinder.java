package esinf.us_ei08;

import esinf.Algorithms;
import esinf.Graph;

import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;

public class HubShortestPathFinder<V, E> {

    private Graph<V, E> graph;

    public HubShortestPathFinder(Graph<V, E> graph) {
        this.graph = graph;
    }

    public LinkedList<V> findShortestCircuitWithHubs(V originHub, int numHubs) {
        // Validate hub vertex
        if (!graph.validVertex(originHub) || numHubs < 0) {
            System.out.println("Invalid input hub vertex or number of hubs.");
            return new LinkedList<>();
        }

        // Find all circuits starting and ending at the origin hub
        LinkedList<V> shortestCircuit = Algorithms.shortestCircuitWithHubs(graph, originHub, numHubs);

        return shortestCircuit;


    }
}
