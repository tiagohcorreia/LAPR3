package esinf.us_ei02;

import java.util.Comparator;

import esinf.dataStructure.VertexMetrics;

/**
 * The type Vertex metrics comparator.
 *
 * @param <V> the type parameter
 * @param <E> the type parameter
 */
public class VertexMetricsComparator<V, E> implements Comparator<VertexMetrics<V, E>> {

    /**
     * The Edge comp.
     */
    Comparator<E> edgeComp;

    /**
     * Instantiates a new Vertex metrics comparator.
     *
     * @param edgeComp the edge comp
     */
    public VertexMetricsComparator(Comparator<E> edgeComp) {
        this.edgeComp = edgeComp;
    }

    @Override
    public int compare(VertexMetrics<V, E> o1, VertexMetrics<V, E> o2) {
        int result = Integer.compare(o1.getCentrality(), o2.getCentrality());
        if (result == 0) {
            result = Integer.compare(o1.getInfluence(), o2.getInfluence());
        }
        if (result == 0) {
            edgeComp=edgeComp.reversed(); //we want the less proximity value
            result = edgeComp.compare(o1.getProximity(), o2.getProximity());
        }
        return result;
    }

}
