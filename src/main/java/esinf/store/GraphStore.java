package esinf.store;

import esinf.map.MapGraph;

public class GraphStore {

    private static MapGraph<String, Integer> graph;

    public static MapGraph<String, Integer> getGraph() {
        return graph;
    }

    public static void setGraph(MapGraph<String, Integer> newGraph) {
        graph = newGraph;
    }
}
