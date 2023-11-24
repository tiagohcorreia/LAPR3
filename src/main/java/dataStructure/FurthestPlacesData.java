package dataStructure;

import esinf.model.Local;

import java.util.LinkedList;
import java.util.List;
import java.util.Objects;

public class FurthestPlacesData {
    private final int DEFAULT_VALUE = 0;
    private final Local DEFAULT_LOCAL = null;
    private final Local DEFAULT_DISTANCE = null;

    private final List<Local> DEFAULT_SHORTPATH = null;
    private final double DEFAULT_VALUE2 = 0;
    private final List<Distance> DEFAULT_DISTANCE2 = null;


    private Local local1;
    private Local local2;
    private double vehicleAutonomy;
    private List<Local> shortPath;
    private double distanceFromOriginToDestination;// todos os locals
    private List<Local> vehicleChargeStops; //onde o veiculo carregou
    private List<Distance> distanceBetweenLocals;//distanciaa entre todos os pares
    private int vehiclesStops; //nmr de lugares onde o veiculo parou



    public FurthestPlacesData() {
        this.local1 = DEFAULT_LOCAL;
        this.local2 = DEFAULT_LOCAL;
        this.vehicleAutonomy = 0;
        this.shortPath = DEFAULT_SHORTPATH;
        this.distanceFromOriginToDestination = DEFAULT_VALUE2;
        this.vehicleChargeStops = DEFAULT_SHORTPATH;
        this.distanceBetweenLocals = DEFAULT_DISTANCE2;
        this.vehiclesStops = DEFAULT_VALUE;
        this.numberOfTimesVehicleWasCharged = DEFAULT_VALUE;
    }
    public FurthestPlacesData(Local local1, Local local2, double vehicleAutonomy, LinkedList<Local> shortPath, double distanceFromOriginToDestination, List<Local> vehicleChargeStops, List<Distance> distanceBetweenLocals, int vehiclesStops, int numberOfTimesVehicleWasCharged) {
        this.local1 = local1;
        this.local2 = local2;
        this.vehicleAutonomy = vehicleAutonomy;
        this.shortPath = shortPath;
        this.distanceFromOriginToDestination = distanceFromOriginToDestination;
        this.vehicleChargeStops = vehicleChargeStops;
        this.distanceBetweenLocals = distanceBetweenLocals;
        this.vehiclesStops = vehiclesStops;
        this.numberOfTimesVehicleWasCharged = numberOfTimesVehicleWasCharged;
    }
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

    public List<Local> getShortPath() {
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

    public List<Distance> getDistanceBetweenLocals() {
        return distanceBetweenLocals;
    }

    public void setDistanceBetweenLocals(List<Distance> distanceBetweenLocals) {
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
        return DEFAULT_VALUE == that.DEFAULT_VALUE && Double.compare(that.DEFAULT_VALUE2, DEFAULT_VALUE2) == 0 && Double.compare(that.getVehicleAutonomy(), getVehicleAutonomy()) == 0 && Double.compare(that.getDistanceFromOriginToDestination(), getDistanceFromOriginToDestination()) == 0 && getVehiclesStops() == that.getVehiclesStops() && getNumberOfTimesVehicleWasCharged() == that.getNumberOfTimesVehicleWasCharged() && Objects.equals(DEFAULT_LOCAL, that.DEFAULT_LOCAL) && Objects.equals(DEFAULT_DISTANCE, that.DEFAULT_DISTANCE) && Objects.equals(DEFAULT_SHORTPATH, that.DEFAULT_SHORTPATH) && Objects.equals(DEFAULT_DISTANCE2, that.DEFAULT_DISTANCE2) && getLocal1().equals(that.getLocal1()) && getLocal2().equals(that.getLocal2()) && getShortPath().equals(that.getShortPath()) && getVehicleChargeStops().equals(that.getVehicleChargeStops()) && getDistanceBetweenLocals().equals(that.getDistanceBetweenLocals());
    }

    @Override
    public int hashCode() {
        return Objects.hash(DEFAULT_VALUE, DEFAULT_LOCAL, DEFAULT_DISTANCE, DEFAULT_SHORTPATH, DEFAULT_VALUE2, DEFAULT_DISTANCE2, getLocal1(), getLocal2(), getVehicleAutonomy(), getShortPath(), getDistanceFromOriginToDestination(), getVehicleChargeStops(), getDistanceBetweenLocals(), getVehiclesStops(), getNumberOfTimesVehicleWasCharged());
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
