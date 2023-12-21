package esinf.model;

import java.util.LinkedList;

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
    public String toString() {
        return "Route{\n" +
                route +
                "}\n";
    }
}
