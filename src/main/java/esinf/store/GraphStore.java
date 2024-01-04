package esinf.store;

import esinf.*;
import esinf.dataStructure.LocalsData;

import esinf.dataStructure.PathWithMostHubsData;
import esinf.model.Hub;
import esinf.dataStructure.Distance;
import esinf.dataStructure.FurthestPlacesData;
import esinf.map.MapGraph;
import esinf.model.Local;
import esinf.model.Vehicle;
import esinf.us_ei02.IdealVerticesCalculator;

import java.time.Duration;
import java.time.LocalTime;
import java.time.temporal.ChronoUnit;
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
            if (graph.edge(shortPath.get(i), shortPath.get(i + 1)) != null) {
                distance = (int) graph.edge(shortPath.get(i), shortPath.get(i + 1)).getWeight();

                if (currentAutonomy >= distance) {
                    currentAutonomy -= distance;

                } else {
                    stops.add(shortPath.get(i));
                    currentAutonomy = autonomy;
                }
            }
        }
        return stops;
    }

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

    public boolean replaceLocalsWithHubs(Graph<Local, Integer> graph, List<Hub> hubs) {

        try {
            for (Hub hub : hubs) {
                Local oldLocal = graph.vertex(v -> v.getLocalId().equals(hub.getLocalId()));

                if (oldLocal != null) {
                    Hub newHub = new Hub(oldLocal, hub.getNumberOfCollaborators());

                    graph.addVertex(newHub);

                    for (Edge<Local, Integer> e : graph.edges()) {

                        if (e.getVOrig().equals(oldLocal)) {

                            Local destiny = e.getVDest();
                            Integer distance = e.getWeight();
                            graph.removeEdge(oldLocal, destiny);
                            graph.addEdge(newHub, destiny, distance);

                        } else if (e.getVDest().equals(oldLocal)) {

                            Local origin = e.getVOrig();
                            Integer distance = e.getWeight();
                            graph.removeEdge(origin, oldLocal);
                            graph.addEdge(origin, newHub, distance);
                        }
                    }
                    graph.removeVertex(oldLocal);
                }
            }
            return true;

        } catch (Exception e) {

            e.printStackTrace();
            return false;
        }
    }

    public boolean clean() {

        boolean directed = false;
        graph = new MapGraph<>(directed);
        return graph.vertices().isEmpty();
    }

    public List<PathWithMostHubsData> findMaxHubPassingRoute(Local local, LocalTime departuretime, Vehicle vehicle, List<Hub> hubs) {

        MapGraph<Local, Integer> clone = removeEdgesAboveAutonomy(vehicle.getAutonomyDistance());
        IdealVerticesCalculator<Local, Integer> calculator = new IdealVerticesCalculator<>(clone, clone.vertices(), new IntegerComparator(), new IntegerBinaryOperator(), 0);
        ArrayList<LinkedList<Local>> paths = new ArrayList<>();
        ArrayList<Integer> dists = new ArrayList<>();

        replaceLocalsWithHubs(clone, hubs); //cria os hubs

        Algorithms.shortestPaths(clone, local, Integer::compare, Integer::sum, 0, paths, dists);

        // replaceLocalsWithHubs(clone, hubs); //cria os hubs

        List<Local> hubsList = new ArrayList<>();

        hubsList = getListOfHubs(hubsList, clone);


        List<PathWithMostHubsData> list = new ArrayList<>();
        list = getListOfPathsWithMostHubs(list, paths, departuretime, clone, vehicle, hubsList);

        return findCorrectPathWithMostHubsData(list);
    }

    private List<PathWithMostHubsData> getListOfPathsWithMostHubs(List<PathWithMostHubsData> list, ArrayList<LinkedList<Local>> paths, LocalTime departuretime, MapGraph<Local, Integer> clone, Vehicle vehicle, List<Local> hubsList) {
        int count = 0;
        for (LinkedList<Local> path : paths) {
            if (!path.isEmpty()) {
                count += 1;
                PathWithMostHubsData data = checkData(clone, departuretime, path, vehicle, hubsList);
                list.add(data);
            }
        }
        return list;
    }

    public List<Local> getListOfHubs(List<Local> hubsList, MapGraph<Local, Integer> clone) {
        for (Local l : clone.vertices()) {
            if (l instanceof Hub) {
                hubsList.add(l);
            }
        }
        return hubsList;
    }


    public List<PathWithMostHubsData> findCorrectPathWithMostHubsData(List<PathWithMostHubsData> list) {
        List<PathWithMostHubsData> correctPathWithMostHubsData = new ArrayList<>();
        PathWithMostHubsData pathWithMostHubs = null;
        if (!list.isEmpty()) {
            pathWithMostHubs = list.get(0);
            int numberOfHubsTheVehicleWentThrough = 0;
            for (PathWithMostHubsData p : list) {
                if (p.getnumberOfHubsTheVehicleWentThrough() > numberOfHubsTheVehicleWentThrough) {
                    correctPathWithMostHubsData.add(p);
                    numberOfHubsTheVehicleWentThrough = p.getnumberOfHubsTheVehicleWentThrough();
                    pathWithMostHubs = p;
                }
            }
            for (PathWithMostHubsData data : correctPathWithMostHubsData) {
                if (data.getnumberOfHubsTheVehicleWentThrough() != numberOfHubsTheVehicleWentThrough) list.remove(data);
            }
        }
        return correctPathWithMostHubsData;

    }


    private PathWithMostHubsData checkData(MapGraph<Local, Integer> clone, LocalTime departuretime, LinkedList<Local> path, Vehicle vehicle, List<Local> hubsList) {

        int countValidHubs = 0;
        float routetime = 0;// tempo entre dois locais
        float routeTotalDuration = 0; // duração total do percurso
        float vehicleChargingDuration = 0;  // duração total dos carregamentos do veiculo
        float vehicleInTheRoadDuration = 0;// duração total do percurso na estrada
        float hubDischargingDuration = 0;  // duração total dos descarregamentos dos cabazes
        Local nextStop;
        LocalTime pathDuration = departuretime;  //duração do percurso inteiro
        List<LocalsData> localsDataList = new ArrayList<>();
        LocalsData localsData;
        int distance;

        if (!path.isEmpty()) {

            Local currentStop = path.get(0);

            List<Local> vehicleChargeStops = getVehicleChargeStops(clone, path, vehicle.getAutonomyDistance());
            int numberOfTimesVehicleWasCharged = vehicleChargeStops.size();
            vehicleChargingDuration = numberOfTimesVehicleWasCharged * vehicle.getChargingTime();
            Local origin = currentStop;
            //double pathTotalDistance = getPathTotalDistance(clone, path);
            double pathTotalDistance = 0;
            for (int i = 0; i < path.size() - 1; i++) {

                currentStop = path.get(i);
                nextStop = path.get(i + 1);

                if (clone.edge(currentStop, nextStop) != null) {

                    distance = clone.edge(currentStop, nextStop).getWeight();
                    routetime = getroutetime(vehicle.getAverageVelocity(), distance); //obtem tempo de um local ate o outro
                    pathTotalDistance += routetime;
                    vehicleInTheRoadDuration += routetime; //soma o tempo nas estradas
                    pathDuration = pathDuration.plus(Duration.ofMinutes((long) routetime)); // soma o tempo entre os locals ao tempo de partida

                    localsData = new LocalsData(nextStop, pathDuration); //estrutura de dados que guarda informação do local, hora de chegada no mesmo e hora de partida caso for um hub

                    if (checkIfNextStopIsAChargingSpot(nextStop, vehicleChargeStops)) {
                        pathDuration = pathDuration.plus((long) vehicle.getChargingTime(), ChronoUnit.MINUTES); //se o local for um dos locais onde o veiculo carrega, adicionamos o tempo que levou a carregar ao tempo do percurso
                    }

                    if (checkIfHub(hubsList, nextStop)) {
                        localsData.setHub(true);
                        if (pathDuration.isAfter((((Hub) nextStop).getSchedule().getOpeningHours())) && pathDuration.isBefore((((Hub) nextStop).getSchedule().getClosingHours()))) { //se chegar a horas no hub(antes de fechar e depois de abrir)
                            countValidHubs++;
                            pathDuration = pathDuration.plus(Duration.ofSeconds(((Hub) nextStop).getDischargeTime()));//adicionamos o tempo que levou a descarregar os produtos
                            hubDischargingDuration += ((Hub) nextStop).getDischargeTime();
                        }
                        localsData.setDepartureHour(pathDuration);
                    }
                    localsDataList.add(localsData);
                }
            }
            routeTotalDuration = vehicleChargingDuration + vehicleInTheRoadDuration + hubDischargingDuration;
            PathWithMostHubsData data = new PathWithMostHubsData(origin, localsDataList, path, pathTotalDistance, numberOfTimesVehicleWasCharged, routeTotalDuration, vehicleChargingDuration, vehicleInTheRoadDuration, hubDischargingDuration);
            data.setNumberOfHubsTheVehicleWentThrough(countValidHubs);
            return data;

        }
        return new PathWithMostHubsData();
    }

    public boolean checkIfNextStopIsAChargingSpot(Local nextStop, List<Local> vehicleChargeStops) {
        boolean is = false;
        for (Local l : vehicleChargeStops) {
            if (nextStop.getLocalId().equals(l.getLocalId())) ;
            is = true;
        }
        return is;
    }

    public boolean checkIfHub(List<Local> hubsList, Local nextStop) {
        boolean found = false;
        for (Local l : hubsList) {
            if (l.getLocalId().equals(nextStop.getLocalId())) found = true;
        }
        return found;
    }



    public float getroutetime(double distance, double speed) {

        int secondsInAHour = 3600;
        int limit = 0;

        if (speed > limit) {
            double tempoDePercursoEmHoras = distance / speed;

            long seconds = (long) (tempoDePercursoEmHoras * secondsInAHour);

            return seconds;
        } else {
            return 0;
        }
    }

    public boolean isHubInGraph(Hub hub) {

        for (Local local : graph.vertices()) {

            if (local.equals(hub)) {
                return true;
            }
        }
        return false;
    }
}



