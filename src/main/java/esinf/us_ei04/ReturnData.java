package esinf.us_ei04;

import esinf.Graph;
import esinf.model.Local;


/**
 * The type Return data.
 */
public class ReturnData {

    private Graph<Local, Integer> graph;
    private int pesoTotal;

    /**
     * Instantiates a new Return data.
     *
     * @param graph     the graph
     * @param pesoTotal the peso total
     */
    public ReturnData(Graph<Local, Integer> graph, int pesoTotal) {
        this.graph = graph;
        this.pesoTotal = pesoTotal;
    }

    /**
     * Gets graph.
     *
     * @return the graph
     */
    public Graph<Local, Integer> getGraph() {
        return graph;
    }

    /**
     * Gets peso total.
     *
     * @return the peso total
     */
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
