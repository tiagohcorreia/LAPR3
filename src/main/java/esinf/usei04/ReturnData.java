package esinf.usei04;

import esinf.Graph;
import esinf.model.Local;


public class ReturnData {

    private Graph<Local, Integer> graph;
    private int pesoTotal;

    public ReturnData(Graph<Local, Integer> graph, int pesoTotal) {
        this.graph = graph;
        this.pesoTotal = pesoTotal;
    }

    public Graph<Local, Integer> getGraph() {
        return graph;
    }

    public int getPesoTotal() {
        return pesoTotal;
    }

    @Override
    public String toString() {

        final StringBuilder sb = new StringBuilder("Minimum Spanning Tree: \n");

        sb.append("Graph: \n").append(graph);
        sb.append(", PesoTotal:").append(pesoTotal);

        return sb.toString();
    }
}
