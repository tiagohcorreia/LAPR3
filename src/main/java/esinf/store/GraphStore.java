package esinf.store;

import esinf.IntegerBinaryOperator;
import esinf.IntegerComparator;
import esinf.dataStructure.Data;

import esinf.dataStructure.PathWithMostHubsData;
import esinf.model.Hub;
import esinf.Edge;
import esinf.dataStructure.Distance;
import esinf.dataStructure.FurthestPlacesData;
import esinf.Algorithms;
import esinf.map.MapGraph;
import esinf.model.Local;
import esinf.us_ei02.IdealVerticesCalculator;

import java.time.Duration;
import java.time.LocalTime;
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

    public ArrayList<Hub> getHubs() {
        ArrayList<Hub> hubs = new ArrayList<>();
        for (Local l : graph.vertices()) {
            if (l instanceof Hub) {
                hubs.add((Hub) l);
            }
        }
        return hubs;
    }

    public ArrayList<Local> getSimpleLocals() {
        ArrayList<Local> simpleLocals = new ArrayList<>();

        for (Local l : graph.vertices()) {

            if (!(l instanceof Hub)) {
                simpleLocals.add(l);
            }
        }
        return simpleLocals;
    }

    /**
     * Replaces a local (vertex) by a new local.
     * It is useful to set hubs.
     *
     * @param oldLocal vertex to be replaced
     * @param newLocal new vertex
     * @return false if operation fails by some reason, true if operation succeeds
     */
    public boolean replaceLocal(Local oldLocal, Local newLocal) {

        try {
            graph.addVertex(newLocal);

            for (Edge<Local, Integer> e : graph.edges()) {

                if (e.getVOrig().equals(oldLocal)) {
                    Local destiny = e.getVDest();
                    Integer distance = e.getWeight();
                    graph.removeEdge(oldLocal, destiny);
                    graph.addEdge(newLocal, destiny, distance);

                } else if (e.getVDest().equals(oldLocal)) {
                    Local origin = e.getVOrig();
                    Integer distance = e.getWeight();
                    graph.removeEdge(origin, oldLocal);
                    graph.addEdge(origin, newLocal, distance);
                }
            }

            graph.removeVertex(oldLocal);

            return true;

        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    /**
     * replaces the locals specified in the ArrayList simplesLocals by the hub in the same index at ArrayList hubs
     *
     * @param simpleLocals list of simple locals to be replaced
     * @param hubs         list of hubs
     * @return false for operation failure, true for operation success
     */
    public boolean replaceSimpleLocalsByHubs(ArrayList<Local> simpleLocals,
                                             ArrayList<Hub> hubs) {
        if (simpleLocals.size() != hubs.size()) {
            return false;
        }

        for (int i = 0; i < simpleLocals.size(); i++) {
            Local simpleLocal = simpleLocals.get(i);
            Local hub = hubs.get(i);
            replaceLocal(simpleLocal, hub);
        }

        return true;
    }
    //----------------

    public MapGraph<Local, Integer> removeEdgesAboveAutonomy(double autonomy) {
        MapGraph<Local, Integer> clone = graph.clone();
        List<Local> list = clone.vertices();
        for (int i = 0; i < clone.numVertices(); i++) {
            for (int j = 0; j < clone.numVertices() - 1; j++) {
                if (clone.edge(i, j) != null) {
                    if (clone.edge(list.get(i), list.get(j)).getWeight() > autonomy) { //get edge between vertice and check if the veicles autonomy is bigger than its weight
                        clone.removeEdge(clone.vertex(i), clone.vertex(j));
                    }

                }
            }
        }
        return clone;
    }

    public Distance getFurthestPlaces() {
        MapGraph<Local, Integer> clone = graph.clone();
        double distance = 0;
        double temp;
        List<Local> list = clone.vertices();
        List<Local> listOfNeighbours = clone.vertices();

        Distance data = null;
        for (int i = 0; i < list.size(); i++) {


        }
        return data;

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
        double distanceFromOriginToDestination = Algorithms.shortestPath(clone, local1, local2, Integer::compare, Integer::sum, 0, shortPath2);
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

        double distanceFromOriginToDestination = Algorithms.shortestPath(clone, data.getLocal1(), data.getLocal2(), Integer::compare, Integer::sum, 0, shortPath2);

        List<Local> vehicleChargeStops = getVehicleChargeStops(clone, shortPath2, autonomy);

        List<Distance> distanceBetweenLocals = getDistanceBetweenPairs(clone, shortPath2);

        int vehiclesStops = getNumberOfVehicleStops(clone, shortPath2, autonomy);

        int numberOfTimesVehicleWasCharged = getNumberOfVehicleCharges(clone, shortPath2, vehicleAutonomy);

        data2 = new FurthestPlacesData(local1, local2, vehicleAutonomy, shortPath2, distanceFromOriginToDestination, vehicleChargeStops, distanceBetweenLocals, vehiclesStops, numberOfTimesVehicleWasCharged);


        return data2;
    }


    public boolean generateHubs(Map<Local, Integer> localsAndDischargeTimes) {
        boolean out = false;
        try {
            for (Map.Entry<Local, Integer> e : localsAndDischargeTimes.entrySet()) {
                out = replaceLocal(e.getKey(), new Hub(e.getKey(), e.getValue()));
            }
        } catch (Exception e) {
            out = false;
        }
        return out;
    }

    public boolean clean() {
        boolean directed = false;
        graph = new MapGraph<>(directed);
        return graph.vertices().isEmpty();
    }

    public PathWithMostHubsData findMaxHubPassingRoute(Local local, LocalTime departuretime, double autonomy, int speed, Duration vehicleChargingTime) {
        PathWithMostHubsData data = new PathWithMostHubsData();
        MapGraph<Local, Integer> clone = removeEdgesAboveAutonomy(autonomy);
        IdealVerticesCalculator<Local, Integer> calculator = new IdealVerticesCalculator<>(clone, clone.vertices(), new IntegerComparator(), new IntegerBinaryOperator(), 0);

        ArrayList<LinkedList<Local>> paths = new ArrayList<>();
        ArrayList<Integer> dists = new ArrayList<>();
        Algorithms.shortestPaths(clone, local, Integer::compare, Integer::sum, 0, paths, dists);
        List<Hub> hubs = new ArrayList<>();

        checkPathWithMostHubs(clone, hubs, paths, speed, departuretime, vehicleChargingTime,autonomy);


        return data;
    }

    private void checkPathWithMostHubs(MapGraph<Local, Integer> clone, List<Hub> hubs, ArrayList<LinkedList<Local>> paths, int speed, LocalTime departuretime, Duration vehicleChargingTime, double autonomy) {

        for (LinkedList<Local> list : paths) {
            checkData(clone, hubs, speed, departuretime, list, vehicleChargingTime, autonomy);
        }

    }

    private void checkData(MapGraph<Local, Integer> clone, List<Hub> hubs, int speed, LocalTime departuretime, LinkedList<Local> list, Duration vehicleChargingTime, double autonomy) {
        Duration routetime;
        LocalTime temp = departuretime;
        LocalTime pathDuration = departuretime;
        Map<Hub, Data> hubData=new HashMap<>();
        Data data;
        int distance;
        List<Local> stops = getVehicleChargeStops(clone, list, autonomy);
        for (int i = 0; i < list.size() - 1; i++) {
            distance = clone.edge(list.get(i), list.get(i + 1)).getWeight();
            routetime = getroutetime(speed, distance); //obtem tempo de um local ate o outro
            pathDuration = pathDuration.plus(routetime); // soma o tempo entre os locals ao tempo de partida
            data = new Data(pathDuration); //tempo de chegada no prox local
            if (list.get(i + 1) instanceof Hub) {
                data.setHub(true);
                if (pathDuration.isAfter((((Hub) list.get(i + 1)).getSchedule().getOpeningHours()))&&pathDuration.isBefore((((Hub) list.get(i + 1)).getSchedule().getClosingHours()))) { //se chegar a horas no hub(antes de fechar e depois de abrir)
                    if (stops.contains(list.get(i+1))){
                        pathDuration=pathDuration.plus(vehicleChargingTime); //se o local for um dos locais onde o veicuoloo carrega, adicionamos o tempo que levou a carregar ao tempo do percurso
                    }
                    pathDuration=pathDuration.plus(Duration.ofSeconds(((Hub) list.get(i+1)).getDischargeTime()));//adicionamos o tempo que levou a descarregar os produtos
                }
                data.setDepartureHour(pathDuration);
            }


        }

    }

    private static Duration getroutetime(double distance, double speed) {
        if (speed > 0) {
            double tempoDePercursoEmHoras = distance / speed;

            long seconds = (long) (tempoDePercursoEmHoras * 3600);

            return Duration.ofSeconds(seconds);
        } else {
            return null;
        }
    }


}



