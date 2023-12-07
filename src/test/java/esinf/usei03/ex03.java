package esinf.usei03;

import esinf.dataStructure.Distance;
import esinf.dataStructure.FurthestPlacesData;
import esinf.*;
import esinf.map.MapGraph;
import esinf.map.MapGraphLoader;
import esinf.model.Local;
import esinf.store.GraphStore;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import java.io.IOException;
import java.util.*;

import static org.junit.jupiter.api.Assertions.*;

public class ex03 {

    final Graph<String, Integer> completeMap = new MapGraph<>(false);
    Graph<String, Integer> incompleteMap = new MapGraph<>(false);

    public ex03() {
    }

    @BeforeEach
    public void setUp() {

        completeMap.addVertex("Porto");
        completeMap.addVertex("Braga");
        completeMap.addVertex("Vila Real");
        completeMap.addVertex("Aveiro");
        completeMap.addVertex("Coimbra");
        completeMap.addVertex("Leiria");

        completeMap.addVertex("Viseu");
        completeMap.addVertex("Guarda");
        completeMap.addVertex("Castelo Branco");
        completeMap.addVertex("Lisboa");
        completeMap.addVertex("Faro");

        completeMap.addEdge("Porto", "Aveiro", 75);
        completeMap.addEdge("Porto", "Braga", 60);
        completeMap.addEdge("Porto", "Vila Real", 100);
        completeMap.addEdge("Viseu", "Guarda", 75);
        completeMap.addEdge("Guarda", "Castelo Branco", 100);
        completeMap.addEdge("Aveiro", "Coimbra", 60);
        completeMap.addEdge("Coimbra", "Lisboa", 200);
        completeMap.addEdge("Coimbra", "Leiria", 80);
        completeMap.addEdge("Aveiro", "Leiria", 120);
        completeMap.addEdge("Leiria", "Lisboa", 150);

        incompleteMap = completeMap.clone();

        completeMap.addEdge("Aveiro", "Viseu", 85);
        completeMap.addEdge("Leiria", "Castelo Branco", 170);
        completeMap.addEdge("Lisboa", "Faro", 280);
    }

    private void checkContentEquals(List<String> l1, List<String> l2, String msg) {
        Collections.sort(l1);
        Collections.sort(l2);
        assertEquals(l1, l2, msg);
    }

    @Test
    public void testClone() throws IOException {
        GraphStore storage = new GraphStore();
        MapGraphLoader.loadGraph("docs\\esinf_data\\locais_big.csv", "docs\\esinf_data\\distancias_big.csv");
        assertEquals(storage.getGraph(), storage.getCloneGraph());
    }


    @Test
    public void testRemoveEdgesAboveAutonomy() throws IOException {

        GraphStore storage = new GraphStore();
        storage.clean();

        MapGraphLoader.loadGraph("docs\\esinf_data\\locais_big.csv", "docs\\esinf_data\\distancias_big.csv");
        int num = 4;
        int count = 0;
        MapGraph<Local, Integer> atual = storage.removeEdgesAboveAutonomy(1000);
        for (Edge<Local, Integer> g : atual.edges()) {
            if (g != null) count++;
        }

       // storage.removeEdgesAboveAutonomy(1000);// assertEquals(expected,atual);
        assertEquals(num, count);
        storage.clean();

    }

    @Test
    public void testGetFurthestPlaces() throws IOException {
        GraphStore storage = new GraphStore();
        storage.clean();

        MapGraphLoader.loadGraph("docs\\esinf_data\\locais_small.csv", "docs\\esinf_data\\distancias_small.csv");
        Distance data = storage.getFurthestPlaces();
        storage.clean();
assertEquals("CT8",data.getLocal1().getLocalId());
assertEquals("CT4",data.getLocal2().getLocalId());
    }

    @Test
    public void testShortestPathBetweenTwoPlaces() throws IOException {
        GraphStore storage = new GraphStore();
        storage.clean();

        MapGraphLoader.loadGraph("docs\\esinf_data\\locais_small.csv", "docs\\esinf_data\\distancias_small.csv");
        MapGraph clone = storage.getGraph();
        LinkedList<Local> shortPath2 = new LinkedList<>();
        Distance data = storage.getFurthestPlaces();

        Algorithms.shortestPath(clone, data.getLocal1(), data.getLocal2(), Integer::compare, Integer::sum, 0, shortPath2);

        LinkedList<String> shortPath = new LinkedList<>();
        Integer lenPath = Algorithms.shortestPath(incompleteMap, "Porto", "Lisboa", Integer::compare, Integer::sum, 0, shortPath);
        assertEquals(335, lenPath, "Length path should be 0 if vertices are the same");
        assertEquals(Arrays.asList("Porto", "Aveiro", "Coimbra", "Lisboa"), shortPath, "Shortest Path Porto - Lisboa");


    }

    @Test
    public void testDistanceBetweenOriginAndDestination() throws IOException {
        GraphStore storage = new GraphStore();
        storage.clean();

        MapGraphLoader.loadGraph("docs\\esinf_data\\locais_small.csv", "docs\\esinf_data\\distancias_small.csv");
        MapGraph clone = storage.getGraph();
        LinkedList<Local> shortPath2 = new LinkedList<>();
        Distance data = storage.getFurthestPlaces();
        Algorithms.shortestPath(clone, data.getLocal1(), data.getLocal2(), Integer::compare, Integer::sum, 0, shortPath2);

        int expected = 604469;
        double distance = storage.getDistanceBetweenOriginAndDestination(clone, shortPath2);
        assertEquals(expected, distance);


    }

    @Test
    public void testVehicleChargeStops() throws IOException {
        GraphStore storage = new GraphStore();
        storage.clean();

        MapGraphLoader.loadGraph("docs\\esinf_data\\locais_small.csv", "docs\\esinf_data\\distancias_small.csv");
        MapGraph clone = storage.getGraph();
        LinkedList<Local> shortPath2 = new LinkedList<>();
        Distance data = storage.getFurthestPlaces();
        Algorithms.shortestPath(clone, data.getLocal1(), data.getLocal2(), Integer::compare, Integer::sum, 0, shortPath2);
        for (int i = 0; i < shortPath2.size(); i++) {
            System.out.println(shortPath2.get(i).getLocalId());
        }

        List<String> expected = new ArrayList<>();
        expected.add("CT2");
        expected.add("CT9");

        List<Local> stops = storage.getVehicleChargeStops(clone, shortPath2, 170000);
        List<String> stopsID = new ArrayList<>();
        for (Local l : stops
        ) {
            stopsID.add(l.getLocalId());
        }
        assertEquals(expected, stopsID);

    }

    @Test
    public void testDistanceBetweenEveryLocalPair() throws IOException {
        GraphStore storage = new GraphStore();
        storage.clean();
        MapGraphLoader.loadGraph("docs\\esinf_data\\locais_small.csv", "docs\\esinf_data\\distancias_small.csv");
        MapGraph clone = storage.getGraph();
        LinkedList<Local> shortPath2 = new LinkedList<>();
        Distance data = storage.getFurthestPlaces();
        Algorithms.shortestPath(clone, data.getLocal1(), data.getLocal2(), Integer::compare, Integer::sum, 0, shortPath2);


        List<Distance> atual = storage.getDistanceBetweenPairs(clone, shortPath2);
        int numOfDistances=5;
        assertEquals(numOfDistances,atual.size());
    }

    @Test
    public void testNumberOfVehicleStops() throws IOException {
        GraphStore storage = new GraphStore();
        MapGraphLoader.loadGraph("docs\\esinf_data\\locais_small.csv", "docs\\esinf_data\\distancias_small.csv");
        MapGraph clone = storage.getGraph();
        LinkedList<Local> shortPath2 = new LinkedList<>();
        Distance data = storage.getFurthestPlaces();
        Algorithms.shortestPath(clone, data.getLocal1(), data.getLocal2(), Integer::compare, Integer::sum, 0, shortPath2);


        int expected = 2;
        int actual=storage.getNumberOfVehicleStops(clone, shortPath2, 170000);
        assertEquals(expected,actual);    }


    @Test
    public void testNumberOfTimesVehiclesWasCharged() throws IOException {

        GraphStore storage = new GraphStore();
        storage.clean();

        MapGraphLoader.loadGraph("docs\\esinf_data\\locais_small.csv", "docs\\esinf_data\\distancias_small.csv");
        MapGraph clone = storage.getGraph();
        LinkedList<Local> shortPath2 = new LinkedList<>();
        Distance data = storage.getFurthestPlaces();
        Algorithms.shortestPath(clone, data.getLocal1(), data.getLocal2(), Integer::compare, Integer::sum, 0, shortPath2);

        int expected = 2;
       int actual=storage.getNumberOfVehicleCharges(clone, shortPath2, 170000);
       assertEquals(expected,actual);
    }


    @Test
    public void testEX3GetFurthestPlacesData() throws IOException {

        GraphStore storage = new GraphStore();
        storage.clean();

        System.out.println(storage.clean());

        MapGraphLoader.loadGraph("docs\\esinf_data\\locais_small.csv", "docs\\esinf_data\\distancias_small.csv");
        MapGraph clone = storage.getGraph();
        LinkedList<Local> shortPath2 = new LinkedList<>();
        Distance data = storage.getFurthestPlaces();
        Algorithms.shortestPath(clone, data.getLocal1(), data.getLocal2(), Integer::compare, Integer::sum, 0, shortPath2);


        //expected
        Local local1=shortPath2.getFirst();
        Local local2=shortPath2.getLast();
        int autonomy=170000;
        int distanceFromOriginToDestination=604469;
        int numOfvehicleStops=2;
        List<Local> vehicleChargeStops=new ArrayList<>();
        int numOfDistances=5;
        for (int i = 0; i < shortPath2.size(); i++) {
            if(shortPath2.get(i).getLocalId().equals("CT2")||shortPath2.get(i).getLocalId().equals("CT9"))vehicleChargeStops.add(shortPath2.get(i));
        }

        FurthestPlacesData data1=storage.getFurthestPlacesData(autonomy);  //testar com mais de um ficheiro

        assertEquals(local1,data1.getLocal1());
        assertEquals(local2,data1.getLocal2());
        assertEquals(autonomy,data1.getVehicleAutonomy());
        assertEquals(shortPath2,data1.getShortPath());
        assertEquals(distanceFromOriginToDestination,data1.getDistanceFromOriginToDestination());
        assertEquals(vehicleChargeStops,data1.getVehicleChargeStops());
        assertEquals(vehicleChargeStops,data1.getVehicleChargeStops());
        assertEquals(numOfDistances,data1.getDistanceBetweenLocals().size());
        assertEquals(numOfvehicleStops,data1.getVehiclesStops());
        assertEquals(numOfvehicleStops,data1.getNumberOfTimesVehicleWasCharged());


    }


}



