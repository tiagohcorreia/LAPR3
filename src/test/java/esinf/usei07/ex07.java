package esinf.usei07;

import esinf.Algorithms;
import esinf.dataStructure.Distance;
import esinf.dataStructure.FurthestPlacesData;
import esinf.map.MapGraph;
import esinf.map.MapGraphLoader;
import esinf.model.Local;
import esinf.store.GraphStore;
import org.junit.jupiter.api.Test;

import java.io.IOException;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;

import static org.junit.jupiter.api.Assertions.assertEquals;

public class ex07 {
    @Test
    public void testEX7GetPathThatGoesThroughMostHubs() throws IOException {

        GraphStore storage = new GraphStore();
        storage.clean();
        System.out.println(storage.clean());

        MapGraphLoader.loadGraph("docs\\esinf_data\\locais_small.csv", "docs\\esinf_data\\distancias_small.csv");

        MapGraph clone = storage.getGraph().clone();
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
