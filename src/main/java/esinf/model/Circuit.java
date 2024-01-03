package esinf.model;

import esinf.model.Hub;
import esinf.dataStructure.Distance;

import java.util.List;


/**
 * The type Circuit.
 */
public class Circuit {
    private Vehicle vehicle;
    private Local origin;
    private List<Local> locals;
    private List<Hub> hubs;
    private List<Distance> distances;
    private double totalDistance;
    private int numberOfChargings;
    private double totalTime;

    /**
     * Instantiates a new Circuit.
     *
     * @param vehicle           the vehicle
     * @param origin            the origin
     * @param locals            the locals
     * @param hubs              the hubs
     * @param distances         the distances
     * @param totalDistance     the total distance
     * @param numberOfChargings the number of chargings
     * @param totalTime         the total time
     */
    public Circuit(Vehicle vehicle, Local origin, List<Local> locals,List<Hub> hubs, List<Distance> distances, double totalDistance, int numberOfChargings, double totalTime) {
        this.vehicle = vehicle;
        this.origin = origin;
        this.locals = locals;
        this.hubs = hubs;
        this.distances = distances;
        this.totalDistance = totalDistance;
        this.numberOfChargings = numberOfChargings;
        this.totalTime = totalTime;
    }

    /**
     * Gets vehicle.
     *
     * @return the vehicle
     */
    public Vehicle getVehicle() {
        return vehicle;
    }

    /**
     * Sets vehicle.
     *
     * @param vehicle the vehicle
     */
    public void setVehicle(Vehicle vehicle) {
        this.vehicle = vehicle;
    }

    /**
     * Gets origin.
     *
     * @return the origin
     */
    public Local getOrigin() {
        return origin;
    }

    /**
     * Sets origin.
     *
     * @param origin the origin
     */
    public void setOrigin(Hub origin) {
        this.origin = origin;
    }

    /**
     * Gets locals.
     *
     * @return the locals
     */
    public List<Local> getLocals() {
        return locals;
    }

    /**
     * Sets locals.
     *
     * @param locals the locals
     */
    public void setLocals(List<Local> locals) {
        this.locals = locals;
    }

    /**
     * Gets distances.
     *
     * @return the distances
     */
    public List<Distance> getDistances() {
        return distances;
    }

    /**
     * Sets distances.
     *
     * @param distances the distances
     */
    public void setDistances(List<Distance> distances) {
        this.distances = distances;
    }

    /**
     * Gets total distance.
     *
     * @return the total distance
     */
    public double getTotalDistance() {
        return totalDistance;
    }

    /**
     * Sets total distance.
     *
     * @param totalDistance the total distance
     */
    public void setTotalDistance(double totalDistance) {
        this.totalDistance = totalDistance;
    }

    /**
     * Gets number of chargings.
     *
     * @return the number of chargings
     */
    public int getNumberOfChargings() {
        return numberOfChargings;
    }

    /**
     * Sets number of chargings.
     *
     * @param numberOfChargings the number of chargings
     */
    public void setNumberOfChargings(int numberOfChargings) {
        this.numberOfChargings = numberOfChargings;
    }

    /**
     * Gets total time.
     *
     * @return the total time
     */
    public double getTotalTime() {
        return totalTime;
    }

    /**
     * Sets total time.
     *
     * @param totalTime the total time
     */
    public void setTotalTime(double totalTime) {
        this.totalTime = totalTime;
    }

    /**
     * Print details.
     */
    public void printDetails() {
        System.out.println("Printing Circuit Details:");
        System.out.println("Vehicle: " + vehicle);
        System.out.println("Origin: " + origin);

        System.out.println("Locals to Travel in order:");
        for (Local local : locals) {
            String localDetails = "Local{id=" + local.getLocalId() + "}";
            if (hubs.stream().anyMatch(hub -> hub.getLocalId().equals(local.getLocalId()))) {
                Hub matchingHub = hubs.stream()
                        .filter(hub -> hub.getLocalId().equals(local.getLocalId()))
                        .findFirst()
                        .orElse(null);
                if (matchingHub != null) {
                    localDetails += " (has Hub with " + matchingHub.getNumberOfCollaborators() + " collaborators)";
                }
            }
            System.out.println(localDetails);
        }

        System.out.println("Distances:");
        for (Distance distance : distances) {
            Local local1 = distance.getLocal1();
            Local local2 = distance.getLocal2();
            double length = distance.getLenght();

            String format = String.format("%s -> %s : %.2f meters", local1.getLocalId(), local2.getLocalId(), length);
            System.out.println(format);
        }

        System.out.println("Total Distance: " + totalDistance);
        System.out.println("Number of Chargings: " + numberOfChargings);
        System.out.println("Total Time: " + totalTime);
    }


}
