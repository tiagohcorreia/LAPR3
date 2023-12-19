package esinf.model;

import domain.Hub;
import esinf.dataStructure.Distance;

import java.util.List;

public class Circuit {
    private Vehicle vehicle;
    private Hub origin;
    private List<Hub> hubs;
    private List<Integer> collaborators; // Number of collaborators at each hub
    private List<Distance> distances; // Distances between consecutive hubs
    private double totalDistance;
    private int numberOfChargings;
    private double totalTime;

    public Circuit(Vehicle vehicle,Hub origin, List<Hub> hubs, List<Integer> collaborators, List<Distance> distances, double totalDistance, int numberOfChargings, double totalTime) {
        this.vehicle =  vehicle;
        this.origin = origin;
        this.hubs = hubs;
        this.collaborators = collaborators;
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

    public Hub getOrigin() {
        return origin;
    }

    public void setOrigin(Hub origin) {
        this.origin = origin;
    }

    public List<Hub> getHubs() {
        return hubs;
    }

    public void setHubs(List<Hub> hubs) {
        this.hubs = hubs;
    }

    public List<Integer> getCollaborators() {
        return collaborators;
    }

    public void setCollaborators(List<Integer> collaborators) {
        this.collaborators = collaborators;
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

    public void printCircuitDetails() {
        System.out.println("Vehicle: " + vehicle.getId());
        System.out.println("Origin: " + origin.getLocalId());
        System.out.println("Hubs in the circuit:");
        for (int i = 0; i < hubs.size(); i++) {
            Hub currentHub = hubs.get(i);
            System.out.println("Hub " + currentHub.getLocalId() + ", Collaborators: " + collaborators.get(i));
            if (i < distances.size()) {
                System.out.println("Distance to next hub: " + distances.get(i).getLenght() + " km");
            }
            System.out.println("Unloading Time at Hub: " + currentHub.getDischargeTime() + " minutes");
        }
        System.out.println("Total Distance: " + totalDistance + " km");
        System.out.println("Number of Chargings: " + numberOfChargings);
        System.out.println("Total Time: " + calculateVehicleDetails() + " minutes");
    }


    public double calculateVehicleDetails() {
        double chargingTime = numberOfChargings * vehicle.getChargingTime();
        double routeTime = (totalDistance / vehicle.getAverageVelocity()) * 60;
        double unloadingTime = hubs.stream().mapToDouble(Hub::getDischargeTime).sum();

        totalTime = chargingTime + routeTime + unloadingTime;
        return totalTime;
    }
}
}
