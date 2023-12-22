package esinf.model;

import java.util.LinkedList;
import java.util.Objects;

public class Route<V> {

    LinkedList<V> route;

    public Route(){
        route=new LinkedList<>();
    }

    public Route(LinkedList<V> list){
        route=new LinkedList<>(list);
    }

    public boolean addVertex(V vertex){
        try{
            route.add(vertex);
            return true;
        } catch (Exception e){
            e.printStackTrace();
            return false;
        }
    }

    public LinkedList<V> getRoute(){
        return route;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Route<?> route1 = (Route<?>) o;
        return Objects.equals(getRoute(), route1.getRoute());
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
