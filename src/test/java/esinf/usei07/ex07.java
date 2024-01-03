package esinf.usei07;

import esinf.Algorithms;
import esinf.Edge;
import esinf.IntegerBinaryOperator;
import esinf.IntegerComparator;
import esinf.dataStructure.Distance;
import esinf.dataStructure.FurthestPlacesData;
import esinf.dataStructure.PathWithMostHubsData;
import esinf.dataStructure.VertexMetrics;
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
    public void testEX7GetPathThatGoesThroughMostHubs1() throws IOException {
        Vehicle vehicle;
        GraphStore storage = Repositories.getInstance().getGraphStore();
        storage.clean();
        MapGraphLoader.loadGraph("docs\\esinf_data\\locais_big.csv", "docs\\esinf_data\\distancias_big.csv");
        MapGraph clone = storage.getGraph().clone();
        // get hubs
        List<Local> locals = clone.vertices();

//

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

        MapGraph<Local, Integer> atual = graphStore.getGraph();

        System.out.println(locals.get(7));
        //ex7
        PathWithMostHubsData data = storage.findMaxHubPassingRoute(locals.get(7), LocalTime.of(14, 00, 00), vehicle, hubs);//local de origem, horario de partida,veiculo,lista de hubs
        System.out.println(data);
        System.out.println();
        double sum=0;
        if(data.getPath()!=null){
        for (int i = 0; i < data.getPath().size()-1; i++) {
            sum+=(int)clone.edge(data.getPath().get(i),data.getPath().get(i+1)).getWeight();
            System.out.println(clone.edge(data.getPath().get(i),data.getPath().get(i+1)).getWeight());
        }
        System.out.println(sum);
    }}
}
