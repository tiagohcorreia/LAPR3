package esinf.dataStructure;

import esinf.model.Local;

import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;
import java.util.Objects;

/**
 * The type Furthest places data.
 */
public class FurthestPlacesData {

    private Local local1;
    private Local local2;
    private double vehicleAutonomy;
    private List<Local> shortPath;
    private double distanceFromOriginToDestination;// todos os locals
    private List<Local> vehicleChargeStops; //onde o veiculo carregou
    private List<Distance> distanceBetweenLocals;//distancia entre todos os pares
    private int vehiclesStops; //nmr de lugares onde o veiculo parou
    private int numberOfTimesVehicleWasCharged; //quantas vezes o veiculo parou

    private final int DEFAULT_VALUE = 0;
    private final Local DEFAULT_LOCAL = new Local();
    private final Local DEFAULT_DISTANCE = new Local();
    private final List<Local> DEFAULT_SHORTPATH = new ArrayList<>();
    private final double DEFAULT_VALUE2 = 0;
    private final List<Distance> DEFAULT_DISTANCE2 = new ArrayList<>();


    /**
     * Instantiates a new Furthest places data.
     */
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

    /**
     * Instantiates a new Furthest places data.
     *
     * @param local1                          the local 1
     * @param local2                          the local 2
     * @param vehicleAutonomy                 the vehicle autonomy
     * @param shortPath                       the short path
     * @param distanceFromOriginToDestination the distance from origin to destination
     * @param vehicleChargeStops              the vehicle charge stops
     * @param distanceBetweenLocals           the distance between locals
     * @param vehiclesStops                   the vehicles stops
     * @param numberOfTimesVehicleWasCharged  the number of times vehicle was charged
     */
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

    /**
     * Gets local 1.
     *
     * @return the local 1
     */
    public Local getLocal1() {
        return local1;
    }

    /**
     * Sets local 1.
     *
     * @param local1 the local 1
     */
    public void setLocal1(Local local1) {
        this.local1 = local1;
    }

    /**
     * Gets local 2.
     *
     * @return the local 2
     */
    public Local getLocal2() {
        return local2;
    }

    /**
     * Sets local 2.
     *
     * @param local2 the local 2
     */
    public void setLocal2(Local local2) {
        this.local2 = local2;
    }

    /**
     * Gets vehicle autonomy.
     *
     * @return the vehicle autonomy
     */
    public double getVehicleAutonomy() {
        return vehicleAutonomy;
    }

    /**
     * Sets vehicle autonomy.
     *
     * @param vehicleAutonomy the vehicle autonomy
     */
    public void setVehicleAutonomy(double vehicleAutonomy) {
        this.vehicleAutonomy = vehicleAutonomy;
    }

    /**
     * Gets short path.
     *
     * @return the short path
     */
    public List<Local> getShortPath() {
        return shortPath;
    }

    /**
     * Sets short path.
     *
     * @param shortPath the short path
     */
    public void setShortPath(LinkedList<Local> shortPath) {
        this.shortPath = shortPath;
    }

    /**
     * Gets distance from origin to destination.
     *
     * @return the distance from origin to destination
     */
    public double getDistanceFromOriginToDestination() {
        return distanceFromOriginToDestination;
    }

    /**
     * Sets distance from origin to destination.
     *
     * @param distanceFromOriginToDestination the distance from origin to destination
     */
    public void setDistanceFromOriginToDestination(double distanceFromOriginToDestination) {
        this.distanceFromOriginToDestination = distanceFromOriginToDestination;
    }

    /**
     * Gets vehicle charge stops.
     *
     * @return the vehicle charge stops
     */
    public List<Local> getVehicleChargeStops() {
        return vehicleChargeStops;
    }

    /**
     * Sets vehicle charge stops.
     *
     * @param vehicleChargeStops the vehicle charge stops
     */
    public void setVehicleChargeStops(List<Local> vehicleChargeStops) {
        this.vehicleChargeStops = vehicleChargeStops;
    }

    /**
     * Gets distance between locals.
     *
     * @return the distance between locals
     */
    public List<Distance> getDistanceBetweenLocals() {
        return distanceBetweenLocals;
    }

    /**
     * Sets distance between locals.
     *
     * @param distanceBetweenLocals the distance between locals
     */
    public void setDistanceBetweenLocals(List<Distance> distanceBetweenLocals) {
        this.distanceBetweenLocals = distanceBetweenLocals;
    }

    /**
     * Gets vehicles stops.
     *
     * @return the vehicles stops
     */
    public int getVehiclesStops() {
        return vehiclesStops;
    }

    /**
     * Sets vehicles stops.
     *
     * @param vehiclesStops the vehicles stops
     */
    public void setVehiclesStops(int vehiclesStops) {
        this.vehiclesStops = vehiclesStops;
    }

    /**
     * Gets number of times vehicle was charged.
     *
     * @return the number of times vehicle was charged
     */
    public int getNumberOfTimesVehicleWasCharged() {
        return numberOfTimesVehicleWasCharged;
    }

    /**
     * Sets number of times vehicle was charged.
     *
     * @param numberOfTimesVehicleWasCharged the number of times vehicle was charged
     */
    public void setNumberOfTimesVehicleWasCharged(int numberOfTimesVehicleWasCharged) {
        this.numberOfTimesVehicleWasCharged = numberOfTimesVehicleWasCharged;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        FurthestPlacesData that = (FurthestPlacesData) o;
        return Double.compare(getVehicleAutonomy(), that.getVehicleAutonomy()) == 0
                && Double.compare(getDistanceFromOriginToDestination(), that.getDistanceFromOriginToDestination()) == 0
                && getVehiclesStops() == that.getVehiclesStops()
                && getNumberOfTimesVehicleWasCharged() == that.getNumberOfTimesVehicleWasCharged()
                && Objects.equals(getLocal1(), that.getLocal1())
                && Objects.equals(getLocal2(), that.getLocal2())
                && Objects.equals(getShortPath(), that.getShortPath())
                && Objects.equals(getVehicleChargeStops(), that.getVehicleChargeStops())
                && Objects.equals(getDistanceBetweenLocals(), that.getDistanceBetweenLocals());
    }

    @Override
    public int hashCode() {
        return Objects.hash(getLocal1(), getLocal2(), getVehicleAutonomy(), getShortPath(), getDistanceFromOriginToDestination(), getVehicleChargeStops(), getDistanceBetweenLocals(), getVehiclesStops(), getNumberOfTimesVehicleWasCharged());
    }

    @Override
    public String toString() {
        return "FurthestPlacesData{" +
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
