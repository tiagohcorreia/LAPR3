package dataStructure;

import esinf.model.Local;

import java.util.LinkedList;
import java.util.List;
import java.util.Objects;

public class FurthestPlacesData {
    private final Local DEFAULT_LOCAL = null;
    private final double DEFAULT_DISTANCE = 0;
    private Local local1;
    private Local local2;
    private double vehicleAutonomy;
    private LinkedList<Local> shortPath;
    private double distanceFromOriginToDestination;// todos os locals
    private List<Local> vehicleChargeStops; //onde o veiculo carregou
    private List<Distancia> distanceBetweenLocals;//distanciaa entre todos os pares
    private int vehiclesStops; //nmr de lugares onde o veiculo parou
    private int numberOfTimesVehicleWasCharged; //quantas vezes o veiculo parou

    public Local getLocal1() {
        return local1;
    }

    public void setLocal1(Local local1) {
        this.local1 = local1;
    }

    public Local getLocal2() {
        return local2;
    }

    public void setLocal2(Local local2) {
        this.local2 = local2;
    }

    public double getVehicleAutonomy() {
        return vehicleAutonomy;
    }

    public void setVehicleAutonomy(double vehicleAutonomy) {
        this.vehicleAutonomy = vehicleAutonomy;
    }

    public LinkedList<Local> getShortPath() {
        return shortPath;
    }

    public void setShortPath(LinkedList<Local> shortPath) {
        this.shortPath = shortPath;
    }

    public double getDistanceFromOriginToDestination() {
        return distanceFromOriginToDestination;
    }

    public void setDistanceFromOriginToDestination(double distanceFromOriginToDestination) {
        this.distanceFromOriginToDestination = distanceFromOriginToDestination;
    }

    public List<Local> getVehicleChargeStops() {
        return vehicleChargeStops;
    }

    public void setVehicleChargeStops(List<Local> vehicleChargeStops) {
        this.vehicleChargeStops = vehicleChargeStops;
    }

    public List<Distancia> getDistanceBetweenLocals() {
        return distanceBetweenLocals;
    }

    public void setDistanceBetweenLocals(List<Distancia> distanceBetweenLocals) {
        this.distanceBetweenLocals = distanceBetweenLocals;
    }

    public int getVehiclesStops() {
        return vehiclesStops;
    }

    public void setVehiclesStops(int vehiclesStops) {
        this.vehiclesStops = vehiclesStops;
    }

    public int getNumberOfTimesVehicleWasCharged() {
        return numberOfTimesVehicleWasCharged;
    }

    public void setNumberOfTimesVehicleWasCharged(int numberOfTimesVehicleWasCharged) {
        this.numberOfTimesVehicleWasCharged = numberOfTimesVehicleWasCharged;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof FurthestPlacesData that)) return false;
        return Double.compare(that.DEFAULT_DISTANCE, DEFAULT_DISTANCE) == 0 && Double.compare(that.vehicleAutonomy, vehicleAutonomy) == 0 && Double.compare(that.distanceFromOriginToDestination, distanceFromOriginToDestination) == 0 && vehiclesStops == that.vehiclesStops && numberOfTimesVehicleWasCharged == that.numberOfTimesVehicleWasCharged && Objects.equals(DEFAULT_LOCAL, that.DEFAULT_LOCAL) && local1.equals(that.local1) && local2.equals(that.local2) && shortPath.equals(that.shortPath) && vehicleChargeStops.equals(that.vehicleChargeStops) && distanceBetweenLocals.equals(that.distanceBetweenLocals);
    }

    @Override
    public int hashCode() {
        return Objects.hash(DEFAULT_LOCAL, DEFAULT_DISTANCE, local1, local2, vehicleAutonomy, shortPath, distanceFromOriginToDestination, vehicleChargeStops, distanceBetweenLocals, vehiclesStops, numberOfTimesVehicleWasCharged);
    }

    @Override
    public String toString() {
        return "FurthestPlacesData{" +
                ", DEFAULT_DISTANCE=" + DEFAULT_DISTANCE +
                ", local1=" + local1 +
                ", local2=" + local2 +
                ", vehicleAutonomy=" + vehicleAutonomy +
                ", shortPath=" + shortPath +
                ", distanceFromOriginToDestination=" + distanceFromOriginToDestination +
                ", vehicleChargeStops=" + vehicleChargeStops +
                ", distanceBetweenLocals=" + distanceBetweenLocals +
                ", vehiclesStops=" + vehiclesStops +
                ", numberOfTimesVehicleWasCharged=" + numberOfTimesVehicleWasCharged +
                '}';
    }
}
