package esinf.us_ei08;

import esinf.Algorithms;
import esinf.Graph;
import esinf.map.MapGraphLoader;
import esinf.model.Local;
import esinf.store.GraphStore;
import esinf.gps.GPS;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.Test;

import java.io.IOException;
import java.util.LinkedList;

import static org.junit.jupiter.api.Assertions.*;

public class HubShortestPathFinderTest {

    private static GraphStore graphStore;

    @BeforeAll
    static void setUp() {
        graphStore = new GraphStore();
        graphStore.clean();
        MapGraphLoader.loadGraph("docs\\esinf_data\\locais_small.csv", "docs\\esinf_data\\distancias_small.csv");
    }

    @Test
    void testFindShortestCircuitWithHubs() {
        HubShortestPathFinder<Local, Integer> pathFinder = new HubShortestPathFinder<>(graphStore.getGraph());

        // Assuming "CT1" is a valid hub and numHubs is set to 2
        LinkedList<Local> shortestCircuit = pathFinder.findShortestCircuitWithHubs(new Local("CT1", new GPS()), 2);

        // Perform assertions based on the expected result
        // (You need to adjust these assertions based on your specific use case)
        assertTrue(shortestCircuit.size() > 0);  // Assuming a valid result has at least one vertex
        assertEquals("CT1", shortestCircuit.getFirst().getLocalId());  // Assuming the first vertex is the origin hub
        assertEquals("CT1", shortestCircuit.getLast().getLocalId());   // Assuming the last vertex is the origin hub (circuit)
    }

    // Add more tests as needed...
}
