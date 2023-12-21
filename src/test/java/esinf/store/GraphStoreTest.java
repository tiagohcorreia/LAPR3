package esinf.store;

import domain.Hub;
import esinf.Edge;
import esinf.Graph;
import esinf.map.MapGraphLoader;
import esinf.model.Local;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import java.time.LocalTime;
import java.util.ArrayList;

import static org.junit.jupiter.api.Assertions.*;

class GraphStoreTest {

    GraphStore graphStore = new GraphStore();

    @BeforeEach
    void setUp() {
        graphStore.clean();
    }

    ArrayList<Edge<Local, Integer>> getOldEdges(Local oldLocal) {

        ArrayList<Edge<Local, Integer>> oldEdges = new ArrayList<>();

        for (Edge<Local, Integer> e : graphStore.getGraph().edges()) {
            if (e.getVOrig().equals(oldLocal) || e.getVDest().equals(oldLocal)) {
                oldEdges.add(e);
            }
        }

        return oldEdges;
    }

    ArrayList<Edge<Local, Integer>> getNewEdges(ArrayList<Edge<Local, Integer>> oldEdges, Local oldLocal, Local newLocal) {

        ArrayList<Edge<Local, Integer>> newEdges = new ArrayList<>();
        for (Edge<Local, Integer> e : oldEdges) {

            if (e.getVOrig().equals(oldLocal)) {
                Edge<Local, Integer> newEdge = new Edge<>(newLocal, e.getVDest(), e.getWeight());

            } else if (e.getVDest().equals(oldLocal)) {
                Edge<Local, Integer> newEdge = new Edge<>(e.getVOrig(), newLocal, e.getWeight());
            }
        }

        return newEdges;
    }

    public void testReplaceLocal(String localsFilePath,
                                 String distancesFilePath) {

        MapGraphLoader.loadGraph(localsFilePath, distancesFilePath);
        Graph<Local, Integer> graph = graphStore.getGraph();

        int oldNumberEdges = graph.edges().size();
        Local oldLocal = graph.vertices().get(3);
        Local newLocal = new Hub(oldLocal.getLocalId(),
                oldLocal.getGps(),
                1);

        ArrayList<Edge<Local, Integer>> oldEdges = getOldEdges(oldLocal);
        ArrayList<Edge<Local, Integer>> newEdges = getNewEdges(oldEdges, oldLocal, newLocal);

        graphStore.replaceLocal(oldLocal, newLocal);

        int newNumberEdges = graph.edges().size();
        boolean allOldEdgesRemoved = true;

        for (Edge<Local, Integer> e1 : oldEdges) {
            for (Edge<Local, Integer> e2 : graph.edges()) {
                if (e1.toString().equals(e2.toString())) {
                    allOldEdgesRemoved = false;
                    break;
                }
            }
        }

        int countNewEdges=0;
        for (Edge<Local, Integer> e1 : newEdges) {
            for (Edge<Local, Integer> e2: graph.edges()){
                if (e1.toString().equals(e2.toString())) {
                    countNewEdges++;
                }
            }
        }

        System.out.println(graph.vertices());

        assertEquals(true, allOldEdgesRemoved);
        assertEquals(newEdges.size(), countNewEdges);
        assertEquals(oldNumberEdges, newNumberEdges);
    }

    @Test
    void replaceLocalTest1() {
        testReplaceLocal("docs\\sprint3\\esinf\\us-ei06\\test-files\\locals\\us-ei06-locals-1.txt",
                "docs\\sprint3\\esinf\\us-ei06\\test-files\\distances\\us-ei06-distances-1.txt");
    }

    @Test
    void replaceLocalTest2() {
        testReplaceLocal("docs\\sprint3\\esinf\\us-ei06\\test-files\\locals\\us-ei06-locals-2.txt",
                "docs\\sprint3\\esinf\\us-ei06\\test-files\\distances\\us-ei06-distances-2.txt");
    }

    @Test
    void replaceLocalTest3() {
        testReplaceLocal("docs\\sprint3\\esinf\\us-ei06\\test-files\\locals\\us-ei06-locals-3.txt",
                "docs\\sprint3\\esinf\\us-ei06\\test-files\\distances\\us-ei06-distances-3.txt");
    }


    void testReplaceSimpleLocalsByHubs(ArrayList<Local> locals,
                                       ArrayList<Hub> hubs) {

        Graph<Local, Integer> graph = graphStore.getGraph();

        graphStore.replaceSimpleLocalsByHubs(locals, hubs);

        boolean allHubsAdded = true;

        for (Hub h : hubs) {
            if (!graph.vertices().contains(h)) {
                allHubsAdded = false;
            }
        }

        System.out.println(graph.vertices());
        assertEquals(true, allHubsAdded, "all hubs not added");
    }

    @Test
    void replaceSimpleLocalsByHubsTest1() {
        MapGraphLoader.loadGraph("docs\\sprint3\\esinf\\us-ei06\\test-files\\locals\\us-ei06-locals-1.txt",
                "docs\\sprint3\\esinf\\us-ei06\\test-files\\distances\\us-ei06-distances-1.txt");

        ArrayList<Local> localsToBeReplaced = new ArrayList<>();
        ArrayList<Hub> hubs = new ArrayList<>();

        ArrayList<Local> allLocals = graphStore.getGraph().vertices();

        Local b = allLocals.get(1);

        Hub h1 = new Hub(b.getLocalId(),
                b.getGps(),
                1);

        localsToBeReplaced.add(b);
        hubs.add(h1);

        testReplaceSimpleLocalsByHubs(localsToBeReplaced, hubs);
    }

    @Test
    void replaceSimpleLocalsByHubsTest2() {
        MapGraphLoader.loadGraph("docs\\sprint3\\esinf\\us-ei06\\test-files\\locals\\us-ei06-locals-2.txt",
                "docs\\sprint3\\esinf\\us-ei06\\test-files\\distances\\us-ei06-distances-2.txt");

        ArrayList<Local> localsToBeReplaced = new ArrayList<>();
        ArrayList<Hub> hubs = new ArrayList<>();

        ArrayList<Local> allLocals = graphStore.getGraph().vertices();

        Local b = allLocals.get(1);
        Local c = allLocals.get(2);

        Hub h1 = new Hub(b.getLocalId(),
                b.getGps(),
                1);
        Hub h2 = new Hub(c.getLocalId(),
                c.getGps(),
                1);

        localsToBeReplaced.add(b);
        localsToBeReplaced.add(c);
        hubs.add(h1);
        hubs.add(h2);

        testReplaceSimpleLocalsByHubs(localsToBeReplaced, hubs);
    }

    @Test
    void replaceSimpleLocalsByHubsTest3() {
        MapGraphLoader.loadGraph("docs\\sprint3\\esinf\\us-ei06\\test-files\\locals\\us-ei06-locals-3.txt",
                "docs\\sprint3\\esinf\\us-ei06\\test-files\\distances\\us-ei06-distances-3.txt");

        ArrayList<Local> localsToBeReplaced = new ArrayList<>();
        ArrayList<Hub> hubs = new ArrayList<>();

        ArrayList<Local> allLocals = graphStore.getGraph().vertices();

        Local b = allLocals.get(1);
        Local c = allLocals.get(2);
        Local d = allLocals.get(3);

        Hub h1 = new Hub(b.getLocalId(),
                b.getGps(),
                1);
        Hub h2 = new Hub(c.getLocalId(),
                c.getGps(),
                1);
        Hub h3 = new Hub(d.getLocalId(),
                d.getGps(),
                1);

        localsToBeReplaced.add(b);
        localsToBeReplaced.add(c);
        localsToBeReplaced.add(d);
        hubs.add(h1);
        hubs.add(h2);
        hubs.add(h3);

        testReplaceSimpleLocalsByHubs(localsToBeReplaced, hubs);
    }
}