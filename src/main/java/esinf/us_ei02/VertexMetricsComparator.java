package esinf.us_ei02;

import java.util.Comparator;

import esinf.dataStructure.VertexMetrics;

public class VertexMetricsComparator<V, E> implements Comparator<VertexMetrics<V, E>> {

    Comparator<E> edgeComp;

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
