package esinf.dataStructure;

import esinf.model.Hub;
import esinf.model.Local;

import java.util.List;
import java.util.Objects;

public class PathWithMostHubsData {
    private final int DEFAULT_VALUE = 0;
    private final Local DEFAULT_LOCAL = null;
    private final Local DEFAULT_DISTANCE = null;
    private final List<Hub> DEFAULT_HUB = null;

    private final List<Local> DEFAULT_SHORTPATH = null;
    private final double DEFAULT_VALUE2 = 0;
    private final List<Distance> DEFAULT_DISTANCE2 = null;
    private final List<HubsRecord> DEFAULT_DISTANCE3 = null;


    private Local origin;  //local de partida
    private List<Hub> hubs; //locais(hubs) de passagem em Hubs
    List<HubsRecord> arrivingHourInEachHub;
    private double pathTotalDistance; // distancia do percurso inteiro
    private int numberOfTimesTheVehicleWasCharged;

    private double vehicleAutonomy; //autonomia do veiculo
    private double vehicleSpeed; //velocidade do veiculo
    private double distanceFromOriginToDestination;// todos os locals
    private List<Local> vehicleChargeStops; //onde o veiculo carregou
    private List<Distance> distanceBetweenLocals;//distancia entre todos os pares
    private int vehiclesStops; //nmr de lugares onde o veiculo parou



    public PathWithMostHubsData() {
        this.origin = DEFAULT_DISTANCE;
        this.hubs = DEFAULT_HUB;
        this.arrivingHourInEachHub = DEFAULT_DISTANCE3;
        this.pathTotalDistance = DEFAULT_VALUE;
        this.numberOfTimesTheVehicleWasCharged = DEFAULT_VALUE;
        this.vehicleAutonomy = DEFAULT_VALUE;
        this.vehicleSpeed = DEFAULT_VALUE;
        this.distanceFromOriginToDestination = DEFAULT_VALUE;
        this.vehicleChargeStops = DEFAULT_SHORTPATH;
        this.distanceBetweenLocals = DEFAULT_DISTANCE2;
        this.vehiclesStops = DEFAULT_VALUE;
    }

    public PathWithMostHubsData(Local origin, List<Hub> hubs, List<HubsRecord> arrivingHourInEachHub, double pathTotalDistance, int numberOfTimesTheVehicleWasCharged, double vehicleAutonomy, double vehicleSpeed, double distanceFromOriginToDestination, List<Local> vehicleChargeStops, List<Distance> distanceBetweenLocals, int vehiclesStops) {
        this.origin = origin;
        this.hubs = hubs;
        this.arrivingHourInEachHub = arrivingHourInEachHub;
        this.pathTotalDistance = pathTotalDistance;
        this.numberOfTimesTheVehicleWasCharged = numberOfTimesTheVehicleWasCharged;
        this.vehicleAutonomy = vehicleAutonomy;
        this.vehicleSpeed = vehicleSpeed;
        this.distanceFromOriginToDestination = distanceFromOriginToDestination;
        this.vehicleChargeStops = vehicleChargeStops;
        this.distanceBetweenLocals = distanceBetweenLocals;
        this.vehiclesStops = vehiclesStops;
    }

    public int getDEFAULT_VALUE() {
        return DEFAULT_VALUE;
    }

    public Local getDEFAULT_LOCAL() {
        return DEFAULT_LOCAL;
    }

    public Local getDEFAULT_DISTANCE() {
        return DEFAULT_DISTANCE;
    }

    public List<Local> getDEFAULT_SHORTPATH() {
        return DEFAULT_SHORTPATH;
    }

    public double getDEFAULT_VALUE2() {
        return DEFAULT_VALUE2;
    }

    public List<Distance> getDEFAULT_DISTANCE2() {
        return DEFAULT_DISTANCE2;
    }

    public Local getOrigin() {
        return origin;
    }

    public void setOrigin(Local origin) {
        this.origin = origin;
    }

    public List<Hub> getHubs() {
        return hubs;
    }

    public void setHubs(List<Hub> hubs) {
        this.hubs = hubs;
    }

    public List<HubsRecord> getArrivingHourInEachHub() {
        return arrivingHourInEachHub;
    }

    public void setArrivingHourInEachHub(List<HubsRecord> arrivingHourInEachHub) {
        this.arrivingHourInEachHub = arrivingHourInEachHub;
    }

    public double getPathTotalDistance() {
        return pathTotalDistance;
    }

    public void setPathTotalDistance(double pathTotalDistance) {
        this.pathTotalDistance = pathTotalDistance;
    }

    public int getNumberOfTimesTheVehicleWasCharged() {
        return numberOfTimesTheVehicleWasCharged;
    }

    public void setNumberOfTimesTheVehicleWasCharged(int numberOfTimesTheVehicleWasCharged) {
        this.numberOfTimesTheVehicleWasCharged = numberOfTimesTheVehicleWasCharged;
    }

    public double getVehicleAutonomy() {
        return vehicleAutonomy;
    }

    public void setVehicleAutonomy(double vehicleAutonomy) {
        this.vehicleAutonomy = vehicleAutonomy;
    }

    public double getVehicleSpeed() {
        return vehicleSpeed;
    }

    public void setVehicleSpeed(double vehicleSpeed) {
        this.vehicleSpeed = vehicleSpeed;
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


    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof PathWithMostHubsData)) return false;
        PathWithMostHubsData that = (PathWithMostHubsData) o;
        return getDEFAULT_VALUE() == that.getDEFAULT_VALUE() && Double.compare(getDEFAULT_VALUE2(), that.getDEFAULT_VALUE2()) == 0 && Double.compare(getPathTotalDistance(), that.getPathTotalDistance()) == 0 && getNumberOfTimesTheVehicleWasCharged() == that.getNumberOfTimesTheVehicleWasCharged() && Double.compare(getVehicleAutonomy(), that.getVehicleAutonomy()) == 0 && Double.compare(getVehicleSpeed(), that.getVehicleSpeed()) == 0 && Double.compare(getDistanceFromOriginToDestination(), that.getDistanceFromOriginToDestination()) == 0 && getVehiclesStops() == that.getVehiclesStops() && Objects.equals(getDEFAULT_LOCAL(), that.getDEFAULT_LOCAL()) && Objects.equals(getDEFAULT_DISTANCE(), that.getDEFAULT_DISTANCE()) && Objects.equals(getDEFAULT_SHORTPATH(), that.getDEFAULT_SHORTPATH()) && Objects.equals(getDEFAULT_DISTANCE2(), that.getDEFAULT_DISTANCE2()) && Objects.equals(getOrigin(), that.getOrigin()) && Objects.equals(getHubs(), that.getHubs()) && Objects.equals(getArrivingHourInEachHub(), that.getArrivingHourInEachHub()) && Objects.equals(getVehicleChargeStops(), that.getVehicleChargeStops()) && Objects.equals(getDistanceBetweenLocals(), that.getDistanceBetweenLocals());
    }

    @Override
    public int hashCode() {
        return Objects.hash(getDEFAULT_VALUE(), getDEFAULT_LOCAL(), getDEFAULT_DISTANCE(), getDEFAULT_SHORTPATH(), getDEFAULT_VALUE2(), getDEFAULT_DISTANCE2(), getOrigin(), getHubs(), getArrivingHourInEachHub(), getPathTotalDistance(), getNumberOfTimesTheVehicleWasCharged(), getVehicleAutonomy(), getVehicleSpeed(), getDistanceFromOriginToDestination(), getVehicleChargeStops(), getDistanceBetweenLocals(), getVehiclesStops());
    }
    @Override
    public String toString() {
        return "PathWithMostHubsData{" +
                ", origin=" + origin +
                ", hubs=" + hubs +
                ", arrivingHourInEachHub=" + arrivingHourInEachHub +
                ", pathTotalDistance=" + pathTotalDistance +
                ", numberOfTimesTheVehicleWasCharged=" + numberOfTimesTheVehicleWasCharged +
                ", vehicleAutonomy=" + vehicleAutonomy +
                ", vehicleSpeed=" + vehicleSpeed +
                ", distanceFromOriginToDestination=" + distanceFromOriginToDestination +
                ", vehicleChargeStops=" + vehicleChargeStops +
                ", distanceBetweenLocals=" + distanceBetweenLocals +
                ", vehiclesStops=" + vehiclesStops +
                '}';
    }
}
