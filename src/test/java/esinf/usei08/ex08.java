package esinf.usei08;
import dataAccess.Repositories;
import esinf.gps.GPS;
import esinf.map.MapGraph;
import esinf.model.Circuit;
import esinf.model.Hub;
import esinf.model.Local;
import esinf.model.Vehicle;
import esinf.store.GraphStore;

import esinf.map.MapGraphLoader;
import esinf.us_ei08.GreedyTSP;
import esinf.us_ei08.HubShortestPathFinder;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import java.lang.reflect.Array;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.LinkedList;
import java.util.List;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertTrue;

public class ex08 {

    private final String localsFilePath1 = "docs/esinf_data/distancias_smallv1.csv";
    private final String distancesFilePath1 = "docs/esinf_data/locais_smallv1.csv";

    private GraphStore graphStore;
    private Vehicle vehicle;

    @BeforeEach
    void setUp() {
        graphStore = new GraphStore();
    }

    @AfterEach
    void tearDown() {
        Repositories.getInstance().clear();
    }

    @Test
    void testFindShortestCircuitWithHubs1() {
        MapGraphLoader.loadGraph("docs/esinf_data/locais_smallv1.csv", "docs/esinf_data/distancias_smallv1.csv");
        int id = 1;
        float autonomyDistance = 150000;
        float averageVelocity = 60;
        float chargingTime = 10;

        GPS gpsCT6 = new GPS(40.123, -8.456);
        GPS gpsCT13 = new GPS(41.789, -7.012);

        ArrayList<Hub> hubs = new ArrayList<>();
        Hub hubCT6 = new Hub(new Local("CT6", gpsCT6), 5);
        Hub hubCT13 = new Hub(new Local("CT13", gpsCT13), 5);
        Hub hubCT10 = new Hub(new Local("CT276", gpsCT13),5);

        hubs.add(hubCT6);
        hubs.add(hubCT13);
        hubs.add(hubCT10);


        ArrayList<Local> vertices = graphStore.getGraph().vertices();
        String vertexToRemove = "CT10";

        vertices.removeIf(local -> local.getLocalId().equals(vertexToRemove));

        graphStore.replaceSimpleLocalsByHubs(vertices,hubs);

        HubShortestPathFinder<Local, Integer> pathFinder = new HubShortestPathFinder<>(graphStore.getGraph());

        vehicle = new Vehicle(id, autonomyDistance, averageVelocity, chargingTime);



        Local startLocal = graphStore.getGraph().vertices()
                .stream()
                .filter(local -> local.getLocalId().equals("CT6"))
                .findFirst()
                .orElse(null);


        if (startLocal == null) {
            throw new IllegalStateException("Local with name 'CT6' not found in the graph.");
        }


        Circuit result1 = pathFinder.findShortestCircuitWithHubs(startLocal, 3, vehicle);

    }
}

   /* @Test
    void testFindShortestCircuitWithHubs2() {

        MapGraphLoader.loadGraph("src/test/java/esinf/usei08/files/locais2.csv", "src/test/java/esinf/usei08/files/distancias2.csv");

        HubShortestPathFinder<Local, Integer> pathFinder = new HubShortestPathFinder<>(graphStore.getGraph());


        Local startLocal = graphStore.getGraph().vertices()
                .stream()
                .filter(local -> local.getLocalId().equals("CT6"))
                .findFirst()
                .orElse(null);


        if (startLocal == null) {
            throw new IllegalStateException("Local with name 'CT6' not found in the graph.");
        }


        LinkedList<Local> result1 = pathFinder.findShortestCircuitWithHubs(startLocal, 4);


        List<String> expectedCircuit = Arrays.asList("CT6", "CT7", "CT8", "CT1", "CT6");


        List<String> resultCircuit = new LinkedList<>();
        for (Local local : result1) {
            resultCircuit.add(local.getLocalId());
        }


        assertEquals(expectedCircuit, resultCircuit);

        assertEquals(470, pathFinder.getTotalDistance());
    }

    @Test
    void testFindShortestCircuitWithHubs3() {

        MapGraphLoader.loadGraph("src/test/java/esinf/usei08/files/locais3.csv", "src/test/java/esinf/usei08/files/distancias3.csv");

        HubShortestPathFinder<Local, Integer> pathFinder = new HubShortestPathFinder<>(graphStore.getGraph());


        Local startLocal = graphStore.getGraph().vertices()
                .stream()
                .filter(local -> local.getLocalId().equals("CT1"))
                .findFirst()
                .orElse(null);


        if (startLocal == null) {
            throw new IllegalStateException("Local with name 'CT6' not found in the graph.");
        }


        LinkedList<Local> result1 = pathFinder.findShortestCircuitWithHubs(startLocal, 4);


        List<String> expectedCircuit = Arrays.asList("CT1", "CT611", "CT60", "CT200","CT1");


        List<String> resultCircuit = new LinkedList<>();
        for (Local local : result1) {
            resultCircuit.add(local.getLocalId());
        }


        assertEquals(expectedCircuit, resultCircuit);

        assertEquals(160, pathFinder.getTotalDistance());
    }
}
 */