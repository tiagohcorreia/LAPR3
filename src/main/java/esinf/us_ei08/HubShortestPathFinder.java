package esinf.us_ei08;

import esinf.Edge;
import esinf.Graph;
import esinf.dataStructure.Distance;
import esinf.model.Circuit;
import esinf.model.Hub;
import esinf.model.Local;
import esinf.model.Vehicle;
import esinf.store.GraphStore;

import java.util.List;
import java.util.Objects;
import java.util.stream.Collectors;
import java.util.stream.IntStream;

/**
 * The type Hub shortest path finder.
 *
 * @param <V> the type parameter
 * @param <E> the type parameter
 */
public class HubShortestPathFinder<V, E> {

    private Graph<V, E> graph;
    private GraphStore graphStore;
    /**
     * The Greedy tsp.
     */
    GreedyTSP<V, E> greedyTSP = new GreedyTSP<>();

    /**
     * Instantiates a new Hub shortest path finder.
     *
     * @param graph the graph
     */
    public HubShortestPathFinder(Graph<V, E> graph) {
        this.graph = graph;
        this.graphStore = new GraphStore();
    }

    /**
     * Find shortest circuit with hubs circuit.
     *
     * @param graph       the graph
     * @param originLocal the origin local
     * @param numHubs     the num hubs
     * @param vehicle     the vehicle
     * @param numVertices the num vertices
     * @return the circuit
     */
    public Circuit findShortestCircuitWithHubs(Graph<V,E> graph,V originLocal, int numHubs, Vehicle vehicle,int numVertices) {

        System.out.println("originHub: " + originLocal);
        System.out.println("numHubs: " + numHubs);

        List<V> shortestCircuit = greedyTSP.findShortestCircuit(graph, originLocal,numVertices, numHubs, vehicle);


        List<Local> locals = shortestCircuit.stream()
                .filter(vertex -> vertex instanceof Local)
                .map(vertex -> (Local) vertex)
                .collect(Collectors.toList());

        List<Hub> hubs = locals.stream()
                .filter(local -> graphStore.getHubs().stream()
                        .anyMatch(hub -> hub.getLocalId().equals(local.getLocalId())))
                .map(local -> graphStore.getHubs().stream()
                        .filter(hub -> hub.getLocalId().equals(local.getLocalId()))
                        .findFirst()
                        .orElse(null))
                .filter(Objects::nonNull)
                .collect(Collectors.toList());

        List<Distance> distances = IntStream.range(0, shortestCircuit.size() - 1)
                .mapToObj(i -> {
                    Edge<V, E> edge = graph.edge(shortestCircuit.get(i), shortestCircuit.get(i + 1));
                    E weight = edge.getWeight();

                    if (weight instanceof Number) {
                        return new Distance(
                                (Local) shortestCircuit.get(i),
                                (Local) shortestCircuit.get(i + 1),
                                ((Number) weight).doubleValue()
                        );
                    } else {
                        return null;
                    }
                })
                .filter(Objects::nonNull)
                .collect(Collectors.toList());

        double totalDistance = greedyTSP.getTotalDistance();
        int numberOfChargings = greedyTSP.getNumberOfChargings();
        double totalTime = calculateTotalDetails(hubs,numberOfChargings,totalDistance,vehicle);

        Circuit circuit = new Circuit(vehicle, (Local) originLocal, locals,hubs, distances, totalDistance, numberOfChargings, totalTime);
        circuit.printDetails();


        return circuit;


    }

    /**
     * Calculate total details double.
     *
     * @param hubs              the hubs
     * @param numberOfChargings the number of chargings
     * @param totalDistance     the total distance
     * @param vehicle           the vehicle
     * @return the double
     */
    public double calculateTotalDetails(List<Hub> hubs,int numberOfChargings,double totalDistance,Vehicle vehicle) {
        double chargingTime = numberOfChargings * vehicle.getChargingTime();
        double routeTime = (totalDistance / vehicle.getAverageVelocity()) * 60;
        double unloadingTime = hubs.stream().mapToDouble(Hub::getDischargeTime).sum();

        return chargingTime + routeTime + unloadingTime;
    }


}
