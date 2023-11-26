package esinf.store;

import esinf.dataStructure.Distance;
import esinf.dataStructure.FurthestPlacesData;
import esinf.Algorithms;
import esinf.map.MapGraph;
import esinf.model.Local;

import java.util.*;

public class GraphStore {
    static boolean directed = false;
    private static MapGraph<Local, Integer> graph = new MapGraph<>(directed);

    public MapGraph<Local, Integer> getGraph() {
        return graph;
    }

    public void addVertex(Local vertex) {
        graph.addVertex(vertex);
    }

    public void addEdge(Local local1, Local local2, int distancia) {
        graph.addEdge(local1, local2, distancia);
    }


    //----------------
    public MapGraph<Local, Integer> getCloneGraph() {
        return new MapGraph<>(graph);
    }

    public MapGraph<Local, Integer> removeEdgesAboveAutonomy(double autonomy) {
        MapGraph<Local, Integer> clone = getCloneGraph();
        List<Local> list = clone.vertices();
        for (int i = 0; i < clone.numVertices(); i++) {
            for (int j = 0; j < clone.numVertices() - 1; j++) {
                if (clone.edge(i, j) != null) {
                    if (clone.edge(list.get(i), list.get(j)).getWeight() > autonomy) {
                        clone.removeEdge(clone.vertex(i), clone.vertex(j));
                    }

                }
            }
        }
        return clone;
    }

    public Distance getFurthestPlaces() {
        MapGraph<Local, Integer> clone = getCloneGraph();
        double distance = 0;
        double temp;
        List<Local> list = clone.vertices();
        Distance data = null;
        for (int i = 0; i < list.size(); i++) {
            for (int j = 0; j < list.size() - 1; j++) {
                if (list.get(i) != null && list.get(j) != null) {
                    Local lcl1 = list.get(i);
                    Local lcl2 = list.get(j);
                    temp = lcl1.getGps().getDistance(lcl2.getGps());
                    if (temp > distance) {
                        distance = temp;
                        data = new Distance(lcl1, lcl2, distance);
                    }
                }
            }
        }
        return data;

    }

    public double getDistanceBetweenOriginAndDestination(MapGraph graph, LinkedList<Local> shortPath) {
        Integer sum = 0;
        for (int i = 0; i < shortPath.size() - 1; i++) {
            sum += (int) graph.edge(shortPath.get(i), shortPath.get(i + 1)).getWeight();
        }
        return sum;
    }


    public List<Local> getVehicleChargeStops(MapGraph graph, LinkedList<Local> shortPath, double autonomy) {
        Integer sum = 0;
        Integer distance;
        double currentAutonomy = autonomy;

        List<Local> stops = new ArrayList<>();
        for (int i = 0; i < shortPath.size() - 1; i++) {
            distance = (int) graph.edge(shortPath.get(i), shortPath.get(i + 1)).getWeight();
            if (currentAutonomy >= distance) {
                currentAutonomy -= distance;
            } else {
                stops.add(shortPath.get(i));
                currentAutonomy = autonomy;
            }
        }
        return stops;
    }

  /*  public List<Distance> getDistanceBetweenEveryLocalPair(MapGraph graph, LinkedList<Local> shortPath) {
        double distance;
        List<Distance> list = new ArrayList<>();
        Distance distanceBetweenLocal;
        for (int i = 0; i < shortPath.size(); i++) {
            for (int j = 0; j < shortPath.size(); j++) {
                if (!shortPath.get(i).equals(shortPath.get(j))) {
                    distance = graph.edge(shortPath.get(i), shortPath.get(j)).getWeightDouble();
                    distanceBetweenLocal = new Distance(shortPath.get(i), shortPath.get(j), distance);
                    list.add(distanceBetweenLocal);
                }
            }
        }
        return list;
    }*/

    public List<Distance> getDistanceBetweenPairs(MapGraph graph, LinkedList<Local> shortPath) {
        List<Distance> cumulativeDistances = new ArrayList<>();
        for (int i = 0; i < shortPath.size() - 1; i++) {
            cumulativeDistances.add(new Distance(shortPath.get(i), shortPath.get(i + 1), (int) graph.edge(shortPath.get(i), shortPath.get(i + 1)).getWeight()));
        }
        return cumulativeDistances;
    }

    public int getNumberOfVehicleStops(MapGraph graph, LinkedList<Local> shortPath, double autonomy) {

        return getVehicleChargeStops(graph, shortPath, autonomy).size();

    }

    public int getNumberOfVehicleCharges(MapGraph graph, LinkedList<Local> shortPath, double autonomy) {

        return getVehicleChargeStops(graph, shortPath, autonomy).size();

    }


    public boolean checkExistentDistance(List<Distance> cumulativeDistances, Local local, Local local2) {
        boolean found = false;
        if (cumulativeDistances.isEmpty()) return false;
        for (Distance d : cumulativeDistances
        ) {
            if (d.getLocal1().equals(local) && d.getLocal2().equals(local2) || d.getLocal1().equals(local2) && d.getLocal2().equals(local))
                found = true;

        }
        return found;
    }


    public boolean checkAttributesNonNull(Distance data, MapGraph<Local, Integer> clone, double autonomy) {
        if (data == null || clone == null) {
            return false;
        }

        Local local1 = data.getLocal1();
        Local local2 = data.getLocal2();
        if (local1 == null || local2 == null) {
            return false;
        }

        LinkedList<Local> shortPath2 = new LinkedList<>();
        Algorithms.shortestPath(clone, local1, local2, Integer::compare, Integer::sum, 0, shortPath2);
        double distanceFromOriginToDestination = getDistanceBetweenOriginAndDestination(clone, shortPath2);
        List<Local> vehicleChargeStops = getVehicleChargeStops(clone, shortPath2, autonomy);
        List<Distance> distanceBetweenLocals = getDistanceBetweenPairs(clone, shortPath2);
        int vehiclesStops = getNumberOfVehicleStops(clone, shortPath2, autonomy);

        return (
                shortPath2 != null &&
                        distanceFromOriginToDestination >= 0 &&
                        vehicleChargeStops != null &&
                        distanceBetweenLocals != null &&
                        vehiclesStops >= 0
        );
    }


    public FurthestPlacesData getFurthestPlacesData(double autonomy) {
        FurthestPlacesData data2;
        Distance data = getFurthestPlaces();
        MapGraph<Local, Integer> clone = removeEdgesAboveAutonomy(autonomy);

        LinkedList<Local> shortPath2 = new LinkedList<>();

        Local local1 = data.getLocal1();

        Local local2 = data.getLocal2();

        double vehicleAutonomy = autonomy;

        Algorithms.shortestPath(clone, data.getLocal1(), data.getLocal2(), Integer::compare, Integer::sum, 0, shortPath2);
        double distanceFromOriginToDestination = getDistanceBetweenOriginAndDestination(clone, shortPath2);

        List<Local> vehicleChargeStops = getVehicleChargeStops(clone, shortPath2, autonomy);

        List<Distance> distanceBetweenLocals = getDistanceBetweenPairs(clone, shortPath2);

        int vehiclesStops = getNumberOfVehicleStops(clone, shortPath2, autonomy);

        int numberOfTimesVehicleWasCharged = getNumberOfVehicleCharges(clone, shortPath2, vehicleAutonomy);

        data2 = new FurthestPlacesData(local1, local2, vehicleAutonomy, shortPath2, distanceFromOriginToDestination, vehicleChargeStops, distanceBetweenLocals, vehiclesStops, numberOfTimesVehicleWasCharged);


        return data2;
    }

    public boolean clean() {
        boolean directed = false;
        graph = new MapGraph<>(directed);
        return graph.vertices().isEmpty();
    }
}



