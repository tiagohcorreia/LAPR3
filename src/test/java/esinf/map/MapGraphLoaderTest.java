package esinf.map;

import esinf.Edge;
import esinf.gps.GPS;
import esinf.model.Local;
import esinf.store.GraphStore;
import org.junit.jupiter.api.Test;
import dataAccess.Repositories;

import static esinf.map.MapGraphLoader.loadGraph;
import static org.junit.jupiter.api.Assertions.*;

class MapGraphLoaderTest {

    @Test
    public void testGraph() {


        GPS gpsCT6 = new GPS(40.2111, -8.4291);
        GPS gpsCT10 = new GPS(39.7444, -8.8072);
        GPS gpsCT13 = new GPS(39.2369, -8.685);


        Local localCT6 = new Local("CT6", gpsCT6);
        Local localCT10 = new Local("CT10", gpsCT10);
        Local localCT13 = new Local("CT13", gpsCT13);

        MapGraphLoader.loadGraph("docs\\esinf_data\\locais_smallv1.csv", "docs\\esinf_data\\distancias_smallv1.csv");
        GraphStore storage = Repositories.getInstance().getGraphStore();
        MapGraph<Local, Integer> distributionNetwork = storage.getGraph();


        assertTrue(distributionNetwork.validVertex(localCT6));
        assertTrue(distributionNetwork.validVertex(localCT10));
        assertTrue(distributionNetwork.validVertex(localCT13));


        Edge<Local, Integer> edgeCT10toCT13 = distributionNetwork.edge(localCT10, localCT13);
        Edge<Local, Integer> edgeCT10toCT6 = distributionNetwork.edge(localCT10, localCT6);

        assertNotNull(edgeCT10toCT13);
        assertNotNull(edgeCT10toCT6);


        assertEquals(63448, edgeCT10toCT13.getWeight());
        assertEquals(67584, edgeCT10toCT6.getWeight());
    }
}
