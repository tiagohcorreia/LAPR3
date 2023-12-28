package esinf.model;

import esinf.model.Hub;
import esinf.dataStructure.Distance;

import java.util.List;



public class Circuit {
    private Vehicle vehicle;
    private Local origin;
    private List<Local> locals;
    private List<Hub> hubs;
    private List<Distance> distances;
    private double totalDistance;
    private int numberOfChargings;
    private double totalTime;

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

    public Vehicle getVehicle() {
        return vehicle;
    }

    public void setVehicle(Vehicle vehicle) {
        this.vehicle = vehicle;
    }

    public Local getOrigin() {
        return origin;
    }

    public void setOrigin(Hub origin) {
        this.origin = origin;
    }

    public List<Local> getLocals() {
        return locals;
    }

    public void setLocals(List<Local> locals) {
        this.locals = locals;
    }

    public List<Distance> getDistances() {
        return distances;
    }

    public void setDistances(List<Distance> distances) {
        this.distances = distances;
    }

    public double getTotalDistance() {
        return totalDistance;
    }

    public void setTotalDistance(double totalDistance) {
        this.totalDistance = totalDistance;
    }

    public int getNumberOfChargings() {
        return numberOfChargings;
    }

    public void setNumberOfChargings(int numberOfChargings) {
        this.numberOfChargings = numberOfChargings;
    }

    public double getTotalTime() {
        return totalTime;
    }

    public void setTotalTime(double totalTime) {
        this.totalTime = totalTime;
    }

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
