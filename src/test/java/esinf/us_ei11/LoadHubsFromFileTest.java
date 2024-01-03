package esinf.us_ei11;

import esinf.map.MapGraph;
import esinf.map.MapGraphLoader;
import esinf.model.Hub;
import esinf.model.Local;
import esinf.model.Schedule;
import esinf.store.GraphStore;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;

import java.time.LocalTime;

import static org.junit.jupiter.api.Assertions.*;

class LoadHubsFromFileTest {

    // Teste com hubs.txt
    @Test
    @DisplayName("Test if when the hubs exists the method returns true (success)")
    void testLoadHubs1() {

        GraphStore graphStore = new GraphStore();
        graphStore.clean();

        MapGraphLoader.loadGraph("docs/esinf_data/locais_small.csv", "docs/esinf_data/distancias_small.csv");

        MapGraph<Local, Integer> graph = graphStore.getGraph();

        //CT1,14:00,17:00
        LocalTime openingHours = LocalTime.parse("14:00");
        LocalTime closingHours = LocalTime.parse("17:00");

        Schedule schedule = new Schedule(openingHours, closingHours);
        Hub CT01 = new Hub("CT01", schedule);

        //CT214,11:00,15:30
        LocalTime openingHours2 = LocalTime.parse("11:00");
        LocalTime closingHours2 = LocalTime.parse("15:30");

        Schedule schedule2 = new Schedule(openingHours2, closingHours2);
        Hub CT214 = new Hub("CT214", schedule2);

        graphStore.addVertex(CT01);
        graphStore.addVertex(CT214);

        assertNotNull(graph);
        assertTrue(graphStore.isHubInGraph(CT01));
        assertTrue(graphStore.isHubInGraph(CT214));
        assertTrue(LoadHubsFromFile.loadHubsFormFile("src/test/java/esinf/us_ei11/testFiles/hubs.txt"));
    }

    @Test
    @DisplayName("Test if when hub does not exist returns error message")
    void testLoadHubs2() {

        GraphStore graphStore = new GraphStore();
        graphStore.clean();

        MapGraphLoader.loadGraph("docs/esinf_data/locais_small.csv", "docs/esinf_data/distancias_small.csv");

        MapGraph<Local, Integer> graph = graphStore.getGraph();

        assertNotNull(graph);
        assertFalse(LoadHubsFromFile.loadHubsFormFile("src/test/java/esinf/us_ei11/testFiles/hubs.txt"));
    }


    //------------------------------------------------------------------------------------------------------------------

    // Teste com hubs2.txt
    @Test
    @DisplayName("Test if when the hubs exists the method returns true (success) (hubs2.txt)")
    void testLoadHubs3() {

        GraphStore graphStore = new GraphStore();
        graphStore.clean();

        MapGraphLoader.loadGraph("docs/esinf_data/locais_small.csv", "docs/esinf_data/distancias_small.csv");

        MapGraph<Local, Integer> graph = graphStore.getGraph();

        //CT01,12:00,17:00
        LocalTime openingHours = LocalTime.parse("12:00");
        LocalTime closingHours = LocalTime.parse("17:00");

        Schedule schedule = new Schedule(openingHours, closingHours);
        Hub CT01 = new Hub("CT01", schedule);

        //CT02,10:00,16:30
        LocalTime openingHours2 = LocalTime.parse("10:00");
        LocalTime closingHours2 = LocalTime.parse("16:30");

        Schedule schedule2 = new Schedule(openingHours2, closingHours2);
        Hub CT02 = new Hub("CT02", schedule2);

        //CT03,08:00,17:00
        LocalTime openingHours3 = LocalTime.parse("12:00");
        LocalTime closingHours3 = LocalTime.parse("17:00");

        Schedule schedule3 = new Schedule(openingHours3, closingHours3);
        Hub CT03 = new Hub("CT03", schedule3);

        //CT03,08:00,17:00
        LocalTime openingHours4 = LocalTime.parse("08:00");
        LocalTime closingHours4 = LocalTime.parse("17:00");

        Schedule schedule4 = new Schedule(openingHours4, closingHours4);
        Hub CT04 = new Hub("CT04", schedule4);

        //CT05,10:00,16:40
        LocalTime openingHours5 = LocalTime.parse("10:00");
        LocalTime closingHours5 = LocalTime.parse("16:40");

        Schedule schedule5 = new Schedule(openingHours5, closingHours5);
        Hub CT05 = new Hub("CT05", schedule5);

        graphStore.addVertex(CT01);
        graphStore.addVertex(CT02);
        graphStore.addVertex(CT03);
        graphStore.addVertex(CT04);
        graphStore.addVertex(CT05);

        assertNotNull(graph);
        assertTrue(graphStore.isHubInGraph(CT01));
        assertTrue(graphStore.isHubInGraph(CT02));
        assertTrue(graphStore.isHubInGraph(CT03));
        assertTrue(graphStore.isHubInGraph(CT04));
        assertTrue(graphStore.isHubInGraph(CT05));
        assertTrue(LoadHubsFromFile.loadHubsFormFile("src/test/java/esinf/us_ei11/testFiles/hubs2.txt"));
    }

    @Test
    @DisplayName("Test if when hub does not exist returns error message (Hubs2.txt)")
    void testLoadHubs4() {

        GraphStore graphStore = new GraphStore();
        graphStore.clean();

        MapGraphLoader.loadGraph("docs/esinf_data/locais_small.csv", "docs/esinf_data/distancias_small.csv");

        MapGraph<Local, Integer> graph = graphStore.getGraph();

        assertNotNull(graph);
        assertFalse(LoadHubsFromFile.loadHubsFormFile("src/test/java/esinf/us_ei11/testFiles/hubs2.txt"));
    }

    //-----------------------------------------------------------------------------------------------------------------

    // Teste com hubs3.txt
    @Test
    @DisplayName("Test if the schedule is redifined when the file is loaded (hubs.txt)")
    void testLoadHubs03() {

        GraphStore graphStore = new GraphStore();
        graphStore.clean();

        MapGraphLoader.loadGraph("docs/esinf_data/locais_small.csv", "docs/esinf_data/distancias_small.csv");

        MapGraph<Local, Integer> graph = graphStore.getGraph();

        //CT60,14:00,17:00
        LocalTime openingHours = LocalTime.parse("14:00");
        LocalTime closingHours = LocalTime.parse("17:00");

        Schedule schedule = new Schedule(openingHours, closingHours);
        Hub CT60 = new Hub("CT60", schedule);

        //CT70,11:00,15:30
        LocalTime openingHours2 = LocalTime.parse("11:00");
        LocalTime closingHours2 = LocalTime.parse("15:30");

        Schedule schedule2 = new Schedule(openingHours2, closingHours2);
        Hub CT70 = new Hub("CT70", schedule2);

        graphStore.addVertex(CT60);
        graphStore.addVertex(CT70);

        assertNotNull(graph);
        assertTrue(LoadHubsFromFile.loadHubsFormFile("src/test/java/esinf/us_ei11/testFiles/hub3.txt"));
        assertTrue(graphStore.isHubInGraph(CT60));
        assertTrue(graphStore.isHubInGraph(CT70));
    }
}
