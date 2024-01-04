package esinf.usei07;

import esinf.Algorithms;
import esinf.Edge;
import esinf.IntegerBinaryOperator;
import esinf.IntegerComparator;
import esinf.dataStructure.*;
import esinf.gps.GPS;
import esinf.map.MapGraph;
import esinf.map.MapGraphLoader;
import esinf.model.Hub;
import esinf.model.Local;
import esinf.model.Vehicle;
import esinf.store.GraphStore;
import esinf.us_ei02.IdealVerticesCalculator;
import esinf.us_ei08.HubShortestPathFinder;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import dataAccess.Repositories;

import java.io.IOException;
import java.time.Duration;
import java.time.LocalTime;
import java.util.*;

import static org.junit.jupiter.api.Assertions.assertEquals;

public class ex07 {

    GraphStore graphStore = new GraphStore();
    Local l1;
    Local l2;
    Local l3;
    Local l4;
    Local l5;
    IdealVerticesCalculator<Local, Integer> calculator;
    ArrayList<VertexMetrics<Local, Integer>> expected;

    @BeforeEach
    void setUp() {
        graphStore.clean();
        MapGraphLoader.loadGraph("docs/esinf_data/locais_small.csv", "docs/esinf_data/distancias_small.csv");
        calculator = new IdealVerticesCalculator<>(graphStore.getGraph(), graphStore.getGraph().vertices(), new IntegerComparator(), new IntegerBinaryOperator(), 0);
        ArrayList<Local> vertices = graphStore.getGraph().vertices();

        l1 = vertices.get(0);
        l2 = vertices.get(1);
        l3 = vertices.get(2);
        l4 = vertices.get(3);
        l5 = vertices.get(4);
    }

    @Test
    public void testGetRouteTime() throws IOException {
        GraphStore storage = Repositories.getInstance().getGraphStore();
        // Define the inputs for the test
        double distance = 100.0; // Replace with your actual distance value
        double speed = 50.0;    // Replace with your actual speed value

        // Expected result calculation
        int secondsInAHour = 3600;
        double expectedHours = distance / speed;
        long expectedSeconds = (long) (expectedHours * secondsInAHour);

        // Call the method under test
        float actualSeconds = storage.getroutetime(distance, speed);

        // Assert the result using assertEquals
        assertEquals(expectedSeconds, actualSeconds);
    }

    @Test
    public void getListOfHubs() throws IOException {
        Vehicle vehicle;
        GraphStore storage = Repositories.getInstance().getGraphStore();
        storage.clean();
        MapGraphLoader.loadGraph("docs\\esinf_data\\locais_big.csv", "docs\\esinf_data\\distancias_big.csv");
        MapGraph clone = storage.getGraph().clone();

        List<Hub> hubs = new ArrayList<>();
        List<Local> locals = clone.vertices();

        Hub hubCT102 = new Hub(new Local("CT102", locals.get(39).getGps()), 5);
        Hub hubCT202 = new Hub(new Local("CT202", locals.get(256).getGps()), 15);
        Hub hubCT104 = new Hub(new Local("CT104", locals.get(253).getGps()), 15);
        Hub hubCT79 = new Hub(new Local("CT79", locals.get(88).getGps()), 15);
        Hub hubCT223 = new Hub(new Local("CT223", locals.get(88).getGps()), 15);


        hubs.add(hubCT102);
        hubs.add(hubCT202);
        hubs.add(hubCT104);
        hubs.add(hubCT79);
        hubs.add(hubCT223);

        List<Local> list = new ArrayList<>(hubs);
        Map<Local, Integer> localsAndDischargeTimes = new HashMap<>();
        int i = 100;
        for (Local l : list) {
            localsAndDischargeTimes.put(l, i);
            i += 100;
        }
        storage.generateHubs(localsAndDischargeTimes);
        clone = storage.getGraph().clone();

        List<Local> hubs2 = new ArrayList<>();
        hubs2 = storage.getListOfHubs(hubs2, clone);

        //exp
        int exp=5;

        assertEquals(5,hubs2.size());

    }

    @Test
    public void checkIfNextStopIsAChargingSpot() throws IOException {
        Vehicle vehicle;
        GraphStore storage = Repositories.getInstance().getGraphStore();
        storage.clean();
        MapGraphLoader.loadGraph("docs\\esinf_data\\locais_big.csv", "docs\\esinf_data\\distancias_big.csv");
        MapGraph clone = storage.getGraph().clone();

        List<Hub> hubs = new ArrayList<>();
        List<Local> locals = clone.vertices();

        Hub hubCT102 = new Hub(new Local("CT102", locals.get(39).getGps()), 5);
        Hub hubCT202 = new Hub(new Local("CT202", locals.get(256).getGps()), 15);
        Hub hubCT104 = new Hub(new Local("CT104", locals.get(253).getGps()), 15);
        Hub hubCT79 = new Hub(new Local("CT79", locals.get(88).getGps()), 15);
        Hub hubCT223 = new Hub(new Local("CT223", locals.get(88).getGps()), 15);


        hubs.add(hubCT102);
        hubs.add(hubCT202);
        hubs.add(hubCT104);
        hubs.add(hubCT79);
        hubs.add(hubCT223);

        List<Local> list = new ArrayList<>(hubs);

        boolean exp = true;
        boolean is = storage.checkIfNextStopIsAChargingSpot(locals.get(39), list);

        assertEquals(exp, is);
    }

    @Test
    public void testcheckIfHub() throws IOException {
        Vehicle vehicle;
        GraphStore storage = Repositories.getInstance().getGraphStore();
        storage.clean();
        MapGraphLoader.loadGraph("docs\\esinf_data\\locais_big.csv", "docs\\esinf_data\\distancias_big.csv");
        MapGraph clone = storage.getGraph().clone();

        List<Hub> hubs = new ArrayList<>();
        List<Local> locals = clone.vertices();

        Hub hubCT102 = new Hub(new Local("CT102", locals.get(39).getGps()), 5);
        Hub hubCT202 = new Hub(new Local("CT202", locals.get(256).getGps()), 15);
        Hub hubCT104 = new Hub(new Local("CT104", locals.get(253).getGps()), 15);
        Hub hubCT79 = new Hub(new Local("CT79", locals.get(88).getGps()), 15);
        Hub hubCT223 = new Hub(new Local("CT223", locals.get(88).getGps()), 15);


        hubs.add(hubCT102);
        hubs.add(hubCT202);
        hubs.add(hubCT104);
        hubs.add(hubCT79);
        hubs.add(hubCT223);

        List<Local> list = new ArrayList<>(hubs);

        boolean exp = true;
        boolean is = storage.checkIfHub(list, locals.get(39));

        assertEquals(exp, is);
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
    public void testFindCorrectPathWithMostHubsData() {
        Vehicle vehicle;
        GraphStore storage = Repositories.getInstance().getGraphStore();
        storage.clean();
        MapGraphLoader.loadGraph("docs\\esinf_data\\locais_big.csv", "docs\\esinf_data\\distancias_big.csv");
        MapGraph clone = storage.getGraph().clone();


        // get hubs
        List<Local> locals = clone.vertices();
        int id = 1;
        float autonomyDistance = 90000;
        float averageVelocity = 60000;
        float chargingTime = 90;
        List<Hub> hubs = new ArrayList<>();

        Hub hubCT102 = new Hub(new Local("CT102", locals.get(39).getGps()), 5);
        Hub hubCT202 = new Hub(new Local("CT202", locals.get(256).getGps()), 15);
        Hub hubCT104 = new Hub(new Local("CT104", locals.get(253).getGps()), 15);
        Hub hubCT79 = new Hub(new Local("CT79", locals.get(88).getGps()), 15);
        Hub hubCT223 = new Hub(new Local("CT223", locals.get(88).getGps()), 15);


        hubs.add(hubCT102);
        hubs.add(hubCT202);
        hubs.add(hubCT104);
        hubs.add(hubCT79);
        hubs.add(hubCT223);


        vehicle = new Vehicle(id, autonomyDistance, averageVelocity, chargingTime);

        //expected
        int numberOfHubsTheVehicleWentThroughExp = 1; //o path tem 5 hubs, mas chegou a tempo so em 2
        int numberOfHubsInThePath = 3;
        String originExp = "CT298";
        int numOfTimesVehicleWasCharged = 3;
        int vehicleChargingDuration = 270;
        int hubsDischargingDuration = 223;
        int vehicleInTheRoadDuration = 671912;
        int pathTotalDuration = vehicleChargingDuration + vehicleInTheRoadDuration + hubsDischargingDuration;
        int pathDistance = 671912;

        //ex
        List<PathWithMostHubsData> data = storage.findMaxHubPassingRoute(locals.get(9), LocalTime.of(14, 00, 00), vehicle, hubs);//local de origem, horario de partida,veiculo,lista de hubs
        PathWithMostHubsData path1 = new PathWithMostHubsData();
        data.add(path1);

        List<PathWithMostHubsData> result = storage.findCorrectPathWithMostHubsData(data);


        //expected
        int numOfResults = 1;

        // Verify the result
        assertEquals(1, result.size());
        assertEquals(data.get(0), result.get(0));
    }


    @Test
    public void testEX7GetPathThatGoesThroughMostHubs1() throws IOException {
        Vehicle vehicle;
        GraphStore storage = Repositories.getInstance().getGraphStore();
        storage.clean();
        MapGraphLoader.loadGraph("docs\\esinf_data\\locais_big.csv", "docs\\esinf_data\\distancias_big.csv");
        MapGraph clone = storage.getGraph().clone();


        // get hubs
        List<Local> locals = clone.vertices();
        int id = 1;
        float autonomyDistance = 150000;
        float averageVelocity = 60000;
        float chargingTime = 90;
        List<Hub> hubs = new ArrayList<>();

        Hub hubCT102 = new Hub(new Local("CT102", locals.get(39).getGps()), 5);
        Hub hubCT202 = new Hub(new Local("CT202", locals.get(256).getGps()), 15);
        Hub hubCT104 = new Hub(new Local("CT104", locals.get(253).getGps()), 15);
        Hub hubCT79 = new Hub(new Local("CT79", locals.get(88).getGps()), 15);
        Hub hubCT223 = new Hub(new Local("CT223", locals.get(88).getGps()), 15);


        hubs.add(hubCT102);
        hubs.add(hubCT202);
        hubs.add(hubCT104);
        hubs.add(hubCT79);
        hubs.add(hubCT223);


        vehicle = new Vehicle(id, autonomyDistance, averageVelocity, chargingTime);

        //expected
        int numberOfHubsTheVehicleWentThroughExp = 2; //o path tem 5 hubs, mas chegou a tempo so em 2
        int numberOfHubsInThePath = 5;
        String originExp = "CT290";
        int numOfTimesVehicleWasCharged = 2;
        int vehicleChargingDuration = 180;
        int hubsDischargingDuration = 425;
        int vehicleInTheRoadDuration = 426545;
        int pathTotalDuration = vehicleChargingDuration + vehicleInTheRoadDuration + hubsDischargingDuration;
        int pathDistance = 426545;

        //ex
        List<PathWithMostHubsData> data = storage.findMaxHubPassingRoute(locals.get(7), LocalTime.of(14, 00, 00), vehicle, hubs);//local de origem, horario de partida,veiculo,lista de hubs
        PathWithMostHubsData data1 = data.get(0);


        //get data
        List<LocalsData> list = data1.getLocals();
        int numOfHubs = 0;
        for (LocalsData d : list) {
            if (d.getHub()) numOfHubs++;
        }

        assertEquals(numberOfHubsTheVehicleWentThroughExp, data1.getnumberOfHubsTheVehicleWentThrough());
        assertEquals(numberOfHubsInThePath, numOfHubs);
        assertEquals(originExp, data1.getOrigin().getLocalId());
        assertEquals(numOfTimesVehicleWasCharged, data1.getNumberOfTimesTheVehicleWasCharged());
        assertEquals(vehicleChargingDuration, data1.getVehicleChargingDuration());
        assertEquals(vehicleInTheRoadDuration, data1.getVehicleInTheRoadDuration());
        assertEquals(hubsDischargingDuration, data1.getVehicleDischargingDuration());
        assertEquals(pathTotalDuration, data1.getRouteTotalDuration());
        assertEquals(pathDistance, data1.getPathTotalDistance());
    }


    @Test
    public void testEX7GetPathThatGoesThroughMostHubs2() throws IOException {
        Vehicle vehicle;
        GraphStore storage = Repositories.getInstance().getGraphStore();
        storage.clean();
        MapGraphLoader.loadGraph("docs\\esinf_data\\locais_big.csv", "docs\\esinf_data\\distancias_big.csv");
        MapGraph clone = storage.getGraph().clone();


        // get hubs
        List<Local> locals = clone.vertices();
        int id = 1;
        float autonomyDistance = 90000;
        float averageVelocity = 60000;
        float chargingTime = 90;
        List<Hub> hubs = new ArrayList<>();

        Hub hubCT102 = new Hub(new Local("CT102", locals.get(39).getGps()), 5);
        Hub hubCT202 = new Hub(new Local("CT202", locals.get(256).getGps()), 15);
        Hub hubCT104 = new Hub(new Local("CT104", locals.get(253).getGps()), 15);
        Hub hubCT79 = new Hub(new Local("CT79", locals.get(88).getGps()), 15);
        Hub hubCT223 = new Hub(new Local("CT223", locals.get(88).getGps()), 15);


        hubs.add(hubCT102);
        hubs.add(hubCT202);
        hubs.add(hubCT104);
        hubs.add(hubCT79);
        hubs.add(hubCT223);


        vehicle = new Vehicle(id, autonomyDistance, averageVelocity, chargingTime);

        //expected
        int numberOfHubsTheVehicleWentThroughExp = 1; //o path tem 5 hubs, mas chegou a tempo so em 2
        int numberOfHubsInThePath = 3;
        String originExp = "CT298";
        int numOfTimesVehicleWasCharged = 3;
        int vehicleChargingDuration = 270;
        int hubsDischargingDuration = 223;
        int vehicleInTheRoadDuration = 671912;
        int pathTotalDuration = vehicleChargingDuration + vehicleInTheRoadDuration + hubsDischargingDuration;
        int pathDistance = 671912;

        //ex
        List<PathWithMostHubsData> data = storage.findMaxHubPassingRoute(locals.get(9), LocalTime.of(14, 00, 00), vehicle, hubs);//local de origem, horario de partida,veiculo,lista de hubs
        PathWithMostHubsData data1 = data.get(0);


        //get data
        List<LocalsData> list = data1.getLocals();
        int numOfHubs = 0;
        for (LocalsData d : list) {
            if (d.getHub()) numOfHubs++;
        }

        assertEquals(numberOfHubsTheVehicleWentThroughExp, data1.getnumberOfHubsTheVehicleWentThrough());
        assertEquals(numberOfHubsInThePath, numOfHubs);
        assertEquals(originExp, data1.getOrigin().getLocalId());
        assertEquals(numOfTimesVehicleWasCharged, data1.getNumberOfTimesTheVehicleWasCharged());
        assertEquals(vehicleChargingDuration, data1.getVehicleChargingDuration());
        assertEquals(vehicleInTheRoadDuration, data1.getVehicleInTheRoadDuration());
        assertEquals(hubsDischargingDuration, data1.getVehicleDischargingDuration());
        assertEquals(pathTotalDuration, data1.getRouteTotalDuration());
        assertEquals(pathDistance, data1.getPathTotalDistance());
    }
}
