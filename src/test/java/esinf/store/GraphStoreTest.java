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

    GraphStore graphStore=new GraphStore();

    @BeforeEach
    void setUp() {
        graphStore.clean();
    }

    ArrayList<Edge<Local, Integer>> getOldEdges(Local oldLocal){

        ArrayList<Edge<Local, Integer>> oldEdges=new ArrayList<>();

        for (Edge<Local, Integer> e: graphStore.getGraph().edges()){
            if (e.getVOrig().equals(oldLocal) || e.getVDest().equals(oldLocal)){
                oldEdges.add(e);
            }
        }

        return oldEdges;
    }

    ArrayList<Edge<Local, Integer>> getNewEdges(ArrayList<Edge<Local, Integer>> oldEdges, Local oldLocal, Local newLocal){

        ArrayList<Edge<Local, Integer>> newEdges=new ArrayList<>();
        for (Edge<Local, Integer> e: oldEdges){

            if (e.getVOrig().equals(oldLocal)){
                Edge<Local, Integer> newEdge=new Edge<>(newLocal, e.getVDest(), e.getWeight());

            } else if (e.getVDest().equals(oldLocal)){
                Edge<Local, Integer> newEdge=new Edge<>(e.getVOrig(), newLocal, e.getWeight());
            }
        }

        return newEdges;
    }

    @Test
    void replaceLocalTest1() {
        MapGraphLoader.loadGraph("docs\\sprint3\\esinf\\us-ei06\\test-files\\locals\\us-ei06-locals-1.txt",
                "docs\\sprint3\\esinf\\us-ei06\\test-files\\distances\\us-ei06-distances-1.txt");
        Graph<Local, Integer> graph=graphStore.getGraph();

        int oldNumberEdges=graph.edges().size();
        Local oldLocal=graph.vertices().get(3);
        Local newLocal=new Hub(oldLocal.getLocalId(),
                oldLocal.getGps(),
                LocalTime.of(8, 0),
                LocalTime.of(18, 0),
                1);

        ArrayList<Edge<Local, Integer>> oldEdges=getOldEdges(oldLocal);
        ArrayList<Edge<Local, Integer>> newEdges=getNewEdges(oldEdges, oldLocal, newLocal);

        graphStore.replaceLocal(oldLocal, newLocal);

        int newNumberEdges=graph.edges().size();
        boolean allOldEdgesRemoved=true;
        boolean allNewEdgesAdded=true;

        for (Edge<Local, Integer> e: oldEdges){
            if (graph.edges().contains(e)){
                allOldEdgesRemoved=false;
                break;
            }
        }

        for (Edge<Local, Integer> e: newEdges){
            if (!graph.edges().contains(e)){
                allNewEdgesAdded=false;
                break;
            }
        }

        assertEquals(true, allOldEdgesRemoved);
        assertEquals(true, allNewEdgesAdded);
        assertEquals(oldNumberEdges, newNumberEdges);
    }

    @Test
    void replaceLocalTest2() {
        MapGraphLoader.loadGraph("docs\\sprint3\\esinf\\us-ei06\\test-files\\locals\\us-ei06-locals-2.txt",
                "docs\\sprint3\\esinf\\us-ei06\\test-files\\distances\\us-ei06-distances-2.txt");
        Graph<Local, Integer> graph=graphStore.getGraph();

        int oldNumberEdges=graph.edges().size();
        Local oldLocal=graph.vertices().get(3);
        Local newLocal=new Hub(oldLocal.getLocalId(),
                oldLocal.getGps(),
                LocalTime.of(8, 0),
                LocalTime.of(18, 0),
                1);

        ArrayList<Edge<Local, Integer>> oldEdges=getOldEdges(oldLocal);
        ArrayList<Edge<Local, Integer>> newEdges=getNewEdges(oldEdges, oldLocal, newLocal);

        graphStore.replaceLocal(oldLocal, newLocal);

        int newNumberEdges=graph.edges().size();
        boolean allOldEdgesRemoved=true;
        boolean allNewEdgesAdded=true;

        for (Edge<Local, Integer> e: oldEdges){
            if (graph.edges().contains(e)){
                allOldEdgesRemoved=false;
                break;
            }
        }

        for (Edge<Local, Integer> e: newEdges){
            if (!graph.edges().contains(e)){
                allNewEdgesAdded=false;
                break;
            }
        }

        assertEquals(true, allOldEdgesRemoved);
        assertEquals(true, allNewEdgesAdded);
        assertEquals(oldNumberEdges, newNumberEdges);
    }

    @Test
    void replaceLocalTest3() {
        MapGraphLoader.loadGraph("docs\\sprint3\\esinf\\us-ei06\\test-files\\locals\\us-ei06-locals-3.txt",
                "docs\\sprint3\\esinf\\us-ei06\\test-files\\distances\\us-ei06-distances-3.txt");
        Graph<Local, Integer> graph=graphStore.getGraph();

        int oldNumberEdges=graph.edges().size();
        Local oldLocal=graph.vertices().get(3);
        Local newLocal=new Hub(oldLocal.getLocalId(),
                oldLocal.getGps(),
                LocalTime.of(8, 0),
                LocalTime.of(18, 0),
                1);

        ArrayList<Edge<Local, Integer>> oldEdges=getOldEdges(oldLocal);
        ArrayList<Edge<Local, Integer>> newEdges=getNewEdges(oldEdges, oldLocal, newLocal);

        graphStore.replaceLocal(oldLocal, newLocal);

        int newNumberEdges=graph.edges().size();
        boolean allOldEdgesRemoved=true;
        boolean allNewEdgesAdded=true;

        for (Edge<Local, Integer> e: oldEdges){
            if (graph.edges().contains(e)){
                allOldEdgesRemoved=false;
                break;
            }
        }

        for (Edge<Local, Integer> e: newEdges){
            if (!graph.edges().contains(e)){
                allNewEdgesAdded=false;
                break;
            }
        }

        assertEquals(true, allOldEdgesRemoved);
        assertEquals(true, allNewEdgesAdded);
        assertEquals(oldNumberEdges, newNumberEdges);
    }
}