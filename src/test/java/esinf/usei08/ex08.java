package esinf.usei08;
import dataAccess.Repositories;
import esinf.Edge;
import esinf.gps.GPS;
import esinf.map.MapGraph;
import esinf.model.Circuit;
import esinf.model.Hub;
import esinf.model.Local;
import esinf.model.Vehicle;
import esinf.store.GraphStore;

import esinf.map.MapGraphLoader;
import esinf.us_ei08.HubShortestPathFinder;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import java.util.*;


import static org.junit.jupiter.api.Assertions.*;

public class ex08 {

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
    void testFindShortestCircuitWith5Hubs() {
        MapGraphLoader.loadGraph("docs/esinf_data/locais_smallv1.csv", "docs/esinf_data/distancias_smallv1.csv");
        int numHubs = 5;
        int id = 1;
        float autonomyDistance = 150000;
        float averageVelocity = 60000;
        float chargingTime = 90;

        GPS gpsCT6 = new GPS(40.123, -8.456);
        GPS gpsCT13 = new GPS(41.789, -7.012);

        List<Hub> hubs = new ArrayList<>();
        Hub hubCT6 = new Hub(new Local("CT6", gpsCT6), 5);

        Hub hubCT10 = new Hub(new Local("CT10", gpsCT13),5);
        Hub hubCT11 = new Hub(new Local("CT11", gpsCT13),15);
        Hub hubCT12 = new Hub(new Local("CT12", gpsCT13),15);
        Hub hubCT14 = new Hub(new Local("CT14", gpsCT13),15);
        Hub hubCT300 = new Hub(new Local("CT300", gpsCT13),15);


        hubs.add(hubCT6);

        hubs.add(hubCT10);
        hubs.add(hubCT11);
        hubs.add(hubCT12);
        hubs.add(hubCT14);
        hubs.add(hubCT300);



        graphStore.replaceLocalsWithHubs(graphStore.getGraph(),hubs);
        System.out.println("Number of Hubs after replacement: " + graphStore.getHubs().size());

        HubShortestPathFinder<Local, Integer> pathFinder = new HubShortestPathFinder<>(graphStore.getGraph());

        vehicle = new Vehicle(id, autonomyDistance, averageVelocity, chargingTime);

        MapGraph<Local, Integer> atual = graphStore.getGraph();


        Local startLocal = graphStore.getGraph().vertices()
                .stream()
                .filter(local -> local.getLocalId().equals("CT13"))
                .findFirst()
                .orElse(null);


        if (startLocal == null) {
            throw new IllegalStateException(String.format("Local with name %s not found in the graph.", startLocal));
        }

        int numVertices = graphStore.getGraph().numVertices();

        Circuit result1 = pathFinder.findShortestCircuitWithHubs(atual,startLocal, numHubs, vehicle,numVertices);


        List<String> expectedLocalNames = Arrays.asList("CT6", "CT300", "CT11","CT211", "CT14", "CT12", "CT6", "CT13");
        List<Local> actualLocals = result1.getLocals();

        assertEquals(expectedLocalNames.size(), actualLocals.size());

        for (Local expectedLocal : actualLocals) {
            assertTrue(expectedLocalNames.contains(expectedLocal.getLocalId()));
        }

        assertEquals(numHubs, actualLocals.stream().filter(local -> local instanceof Hub).count(),
                "Number of hubs in the result should be equal to numHubs");

        assertDistanceBetween(result1, "CT13", "CT300", 1100.00);
        assertDistanceBetween(result1, "CT300", "CT11", 30000.00);
        assertDistanceBetween(result1, "CT11", "CT211", 32000.00);
        assertDistanceBetween(result1, "CT211", "CT14", 23000.00);
        assertDistanceBetween(result1, "CT14", "CT12", 43000.00);
        assertDistanceBetween(result1, "CT12", "CT6", 24000.00);
        assertDistanceBetween(result1, "CT6", "CT13", 150000.00);

        assertEquals(result1.getTotalDistance(),303100);
        assertEquals(result1.getNumberOfChargings(),2);
        assertEquals(result1.getTotalTime(),826.1);


    }


    private void assertDistanceBetween(Circuit circuit, String vertex1, String vertex2, double expectedDistance) {
        MapGraph<Local, Integer> graph = graphStore.getGraph();
        Local local1 = graph.vertices().stream().filter(local -> local.getLocalId().equals(vertex1)).findFirst().orElse(null);
        Local local2 = graph.vertices().stream().filter(local -> local.getLocalId().equals(vertex2)).findFirst().orElse(null);

        assertNotNull(local1, "Vertex " + vertex1 + " not found in the graph");
        assertNotNull(local2, "Vertex " + vertex2 + " not found in the graph");

        Edge<Local, Integer> edge = graph.edge(local1, local2);
        assertNotNull(edge, "Edge between " + vertex1 + " and " + vertex2 + " not found");

        double actualDistance = edge.getWeight();
        assertEquals(expectedDistance, actualDistance, 0.01, "Distance between " + vertex1 + " and " + vertex2 + " should be " + expectedDistance);
    }

    @Test
    void testFindShortestCircuitWith6Hubs() {
        MapGraphLoader.loadGraph("src/test/java/esinf/usei08/files/locais2.csv", "src/test/java/esinf/usei08/files/distancias2.csv");
        int numHubs = 6;
        int id = 1;
        float autonomyDistance = 300000;
        float averageVelocity = 60000;
        float chargingTime = 90;

        GPS gpsCT6 = new GPS(40.123, -8.456);
        GPS gpsCT13 = new GPS(41.789, -7.012);

        List<Hub> hubs = new ArrayList<>();
        Hub hubCT6 = new Hub(new Local("CT6", gpsCT6), 5);

        Hub hubCT10 = new Hub(new Local("CT10", gpsCT13),5);
        Hub hubCT11 = new Hub(new Local("CT11", gpsCT13),15);
        Hub hubCT12 = new Hub(new Local("CT12", gpsCT13),15);
        Hub hubCT14 = new Hub(new Local("CT14", gpsCT13),15);
        Hub hubCT300 = new Hub(new Local("CT300", gpsCT13),15);
        Hub hubCT211 = new Hub(new Local("CT211", gpsCT13),15);
        Hub hubCT194 = new Hub(new Local("CT194", gpsCT13),15);
        Hub hubCT56 = new Hub(new Local("CT56", gpsCT13),15);
        Hub hubCT351 = new Hub(new Local("CT351", gpsCT13),15);
        Hub hubCT98 = new Hub(new Local("CT98", gpsCT13),15);



        hubs.add(hubCT6);
        hubs.add(hubCT10);
        hubs.add(hubCT11);
        hubs.add(hubCT12);
        hubs.add(hubCT14);
        hubs.add(hubCT300);
        hubs.add(hubCT211);
        hubs.add(hubCT194);
        hubs.add(hubCT56);
        hubs.add(hubCT351);
        hubs.add(hubCT98);



        graphStore.replaceLocalsWithHubs(graphStore.getGraph(),hubs);
        System.out.println("Number of Hubs after replacement: " + graphStore.getHubs().size());

        HubShortestPathFinder<Local, Integer> pathFinder = new HubShortestPathFinder<>(graphStore.getGraph());

        vehicle = new Vehicle(id, autonomyDistance, averageVelocity, chargingTime);

        MapGraph<Local, Integer> atual = graphStore.getGraph();


        Local startLocal = graphStore.getGraph().vertices()
                .stream()
                .filter(local -> local.getLocalId().equals("CT6"))
                .findFirst()
                .orElse(null);


        if (startLocal == null) {
            throw new IllegalStateException(String.format("Local with name %s not found in the graph.", startLocal));
        }

        int numVertices = graphStore.getGraph().numVertices();

        Circuit result1 = pathFinder.findShortestCircuitWithHubs(atual,startLocal, numHubs, vehicle,numVertices);


        List<String> expectedLocalNames = Arrays.asList("CT6", "CT351", "CT14", "CT211", "CT194", "CT276", "CT10");
        List<Local> actualLocals = result1.getLocals();


        for (Local expectedLocal : actualLocals) {
            assertTrue(expectedLocalNames.contains(expectedLocal.getLocalId()));
        }

        assertDistanceBetween(result1, "CT6", "CT351", 32000.00);
        assertDistanceBetween(result1, "CT351", "CT14", 20000.00);
        assertDistanceBetween(result1, "CT14", "CT211", 23000.00);
        assertDistanceBetween(result1, "CT211", "CT194", 12300.00);
        assertDistanceBetween(result1, "CT194", "CT276", 23400.00);
        assertDistanceBetween(result1, "CT276", "CT10", 10000.00);
        assertDistanceBetween(result1, "CT10", "CT6", 100000.00);

        assertEquals(result1.getTotalDistance(),220700);
        assertEquals(result1.getNumberOfChargings(),0);
        assertEquals(result1.getTotalTime(),1012.7);

    }

    @Test
    void testFindShortestCircuitWith7Hubs() {
        MapGraphLoader.loadGraph("src/test/java/esinf/usei08/files/locais3.csv", "src/test/java/esinf/usei08/files/distancias3.csv");
        int numHubs = 7;
        int id = 1;
        float autonomyDistance = 300000;
        float averageVelocity = 60000;
        float chargingTime = 90;

        GPS gpsCT6 = new GPS(40.123, -8.456);
        GPS gpsCT13 = new GPS(41.789, -7.012);

        List<Hub> hubs = new ArrayList<>();
        Hub hubCT6 = new Hub(new Local("CT6", gpsCT6), 5);

        Hub hubCT10 = new Hub(new Local("CT10", gpsCT13),5);
        Hub hubCT11 = new Hub(new Local("CT11", gpsCT13),15);
        Hub hubCT12 = new Hub(new Local("CT12", gpsCT13),15);
        Hub hubCT14 = new Hub(new Local("CT14", gpsCT13),15);
        Hub hubCT300 = new Hub(new Local("CT300", gpsCT13),15);
        Hub hubCT211 = new Hub(new Local("CT211", gpsCT13),15);
        Hub hubCT194 = new Hub(new Local("CT194", gpsCT13),15);
        Hub hubCT56 = new Hub(new Local("CT56", gpsCT13),15);
        Hub hubCT351 = new Hub(new Local("CT351", gpsCT13),15);
        Hub hubCT98 = new Hub(new Local("CT98", gpsCT13),15);



        hubs.add(hubCT6);
        hubs.add(hubCT10);
        hubs.add(hubCT11);
        hubs.add(hubCT12);
        hubs.add(hubCT14);
        hubs.add(hubCT300);
        hubs.add(hubCT211);
        hubs.add(hubCT194);
        hubs.add(hubCT56);
        hubs.add(hubCT351);
        hubs.add(hubCT98);



        graphStore.replaceLocalsWithHubs(graphStore.getGraph(),hubs);
        System.out.println("Number of Hubs after replacement: " + graphStore.getHubs().size());

        HubShortestPathFinder<Local, Integer> pathFinder = new HubShortestPathFinder<>(graphStore.getGraph());

        vehicle = new Vehicle(id, autonomyDistance, averageVelocity, chargingTime);

        MapGraph<Local, Integer> atual = graphStore.getGraph();


        Local startLocal = graphStore.getGraph().vertices()
                .stream()
                .filter(local -> local.getLocalId().equals("CT98"))
                .findFirst()
                .orElse(null);


        if (startLocal == null) {
            throw new IllegalStateException(String.format("Local with name %s not found in the graph.", startLocal));
        }

        int numVertices = graphStore.getGraph().numVertices();

        Circuit result1 = pathFinder.findShortestCircuitWithHubs(atual,startLocal, numHubs, vehicle,numVertices);


        List<String> expectedLocalNames = Arrays.asList("CT98", "CT300", "CT13", "CT194", "CT276","CT6", "CT351", "CT14", "CT211");
        List<Local> actualLocals = result1.getLocals();


        for (Local expectedLocal : actualLocals) {
            assertTrue(expectedLocalNames.contains(expectedLocal.getLocalId()));
        }

        assertDistanceBetween(result1, "CT98", "CT300", 11100.00);
        assertDistanceBetween(result1, "CT300", "CT13", 11000.00);
        assertDistanceBetween(result1, "CT13", "CT194", 13300.00);
        assertDistanceBetween(result1, "CT194", "CT276", 7000.00);
        assertDistanceBetween(result1, "CT276", "CT6", 26000.00);
        assertDistanceBetween(result1, "CT6", "CT351", 32000.00);
        assertDistanceBetween(result1, "CT351", "CT14", 20000.00);
        assertDistanceBetween(result1, "CT14", "CT211", 23000.00);
        assertDistanceBetween(result1, "CT211", "CT98", 35000.00);


        assertEquals(result1.getTotalDistance(),178400);
        assertEquals(result1.getNumberOfChargings(),0);
        assertEquals(result1.getTotalTime(),1450.4);

    }

}

