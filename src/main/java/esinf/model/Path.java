package esinf.model;

import java.util.LinkedList;
import java.util.Objects;

public class Path<V> {

    LinkedList<V> route;

    public Path(){
        route=new LinkedList<>();
    }

    public Path(LinkedList<V> list){
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
