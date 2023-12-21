package esinf.us_ei08;

import esinf.model.Local;
import esinf.store.GraphStore;

import java.util.ArrayList;
import java.util.List;

public class ShortestCircuitFinder {
    private GraphStore graphStore;

    public ShortestCircuitFinder(GraphStore graphStore) {
        this.graphStore = graphStore;
    }

    public List<Local> findShortestCircuit(int n) {
        List<Local> allHubs = new ArrayList<>(graphStore.getGraph().vertices());
        List<Local> resultCircuit = new ArrayList<>();

        // Use a permutation to try all possible circuits
        List<List<Local>> permutations = new ArrayList<>();
        permute(allHubs, n, permutations);

        double shortestDistance = Double.MAX_VALUE;

        // Iterate through all permutations to find the shortest circuit
        for (List<Local> circuit : permutations) {
            double circuitDistance = calculateCircuitDistance(circuit);
            if (circuitDistance < shortestDistance) {
                shortestDistance = circuitDistance;
                resultCircuit = new ArrayList<>(circuit);
            }
        }

        return resultCircuit;
    }

}
