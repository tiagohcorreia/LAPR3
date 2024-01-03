package esinf.dataStructure;

import esinf.model.Local;

import java.util.Objects;

/**
 * The type Vertex metrics.
 *
 * @param <V> the type parameter
 * @param <E> the type parameter
 */
public class VertexMetrics<V, E> {

    private V vertex;
    private int centrality;
    private int influence;
    private E proximity;

    /**
     * Instantiates a new Vertex metrics.
     *
     * @param vertex     the vertex
     * @param centrality the centrality
     * @param influence  the influence
     * @param proximity  the proximity
     */
    public VertexMetrics(V vertex, int centrality, int influence, E proximity) {
        this.vertex = vertex;
        this.centrality = centrality;
        this.influence = influence;
        this.proximity = proximity;
    }

    /**
     * Gets vertex.
     *
     * @return the vertex
     */
    public V getVertex() {
        return vertex;
    }

    /**
     * Gets centrality.
     *
     * @return the centrality
     */
    public int getCentrality() {
        return centrality;
    }

    /**
     * Gets influence.
     *
     * @return the influence
     */
    public int getInfluence() {
        return influence;
    }

    /**
     * Gets proximity.
     *
     * @return the proximity
     */
    public E getProximity() {
        return proximity;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        VertexMetrics<?, ?> that = (VertexMetrics<?, ?>) o;
        return getCentrality() == that.getCentrality() && getInfluence() == that.getInfluence() && Objects.equals(getVertex(), that.getVertex()) && Objects.equals(getProximity(), that.getProximity());
    }

    @Override
    public int hashCode() {
        return Objects.hash(getVertex(), getCentrality(), getInfluence(), getProximity());
    }

    @Override
    public String toString() {
        return String.format("Vertex info: %s%n" +
                "Centrality: %d%n" +
                "Influence: %d%n" +
                "Proximity: %s%n", vertex, centrality, influence, proximity);
    }
}
