package esinf.model;

import java.util.LinkedList;
import java.util.Objects;

/**
 * The type Path.
 *
 * @param <V> the type parameter
 */
public class Path<V> {

    /**
     * The Route.
     */
    LinkedList<V> route;

    /**
     * Instantiates a new Path.
     */
    public Path(){
        route=new LinkedList<>();
    }

    /**
     * Instantiates a new Path.
     *
     * @param list the list
     */
    public Path(LinkedList<V> list){
        route=new LinkedList<>(list);
    }

    /**
     * Add vertex boolean.
     *
     * @param vertex the vertex
     * @return the boolean
     */
    public boolean addVertex(V vertex){
        try{
            route.add(vertex);
            return true;
        } catch (Exception e){
            e.printStackTrace();
            return false;
        }
    }

    /**
     * Get route linked list.
     *
     * @return the linked list
     */
    public LinkedList<V> getRoute(){
        return route;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Path<?> path1 = (Path<?>) o;
        return Objects.equals(getRoute(), path1.getRoute());
    }

    @Override
    public int hashCode() {
        return Objects.hash(getRoute());
    }

    @Override
    public String toString() {
        return "Route{\n" +
                route +
                "}\n";
    }
}
