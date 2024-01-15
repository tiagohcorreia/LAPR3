package esinf.dataStructure;

import esinf.model.Hub;
import esinf.model.Local;

import java.time.Duration;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Objects;

/**
 * The type Path with most hubs data.
 */
public class PathWithMostHubsData {
    private final int DEFAULT_VALUE = 0;
    private final Local DEFAULT_LOCAL = null;
    private final float DEFAULT_VALUE2 = 0;
    private final List<LocalsData> DEFAULT_LOCALS = null;
    private final LinkedList<Local> DEFAULT_SHORTPATH = null;

    /////
    private Local origin;  //local de partida
    private List<LocalsData> locals; //informação sobre os locals(locais,os que sao hub, arriving hour, e se for hub departuretime)
    /**
     * The Path.
     */
    LinkedList<Local> path;
    private double pathTotalDistance; // distancia do percurso inteiro
    private int numberOfTimesTheVehicleWasCharged;
    private float routeTotalDuration;  // duração total do percurso
    private float vehicleChargingDuration;  // duração total dos carregamentos do veiculo
    private float vehicleInTheRoadDuration;  // duração total do percurso na estrada
    private float vehicleDischargingDuration;  // duração total dos descarregamentos dos cabazes nos hubs
    private int numberOfHubsTheVehicleWentThrough=0;  //numero de hubs pelo qual o veiculo conseguiu passar a horas


    /**
     * Instantiates a new Path with most hubs data.
     */
    public PathWithMostHubsData() {
        this.origin = DEFAULT_LOCAL;
        this.locals = DEFAULT_LOCALS;
        this.path = DEFAULT_SHORTPATH;
        this.pathTotalDistance = DEFAULT_VALUE;
        this.numberOfTimesTheVehicleWasCharged = DEFAULT_VALUE;
        this.routeTotalDuration = DEFAULT_VALUE2;
        this.vehicleChargingDuration = DEFAULT_VALUE2;
        this.vehicleInTheRoadDuration = DEFAULT_VALUE2;
        this.vehicleDischargingDuration = DEFAULT_VALUE2;
    }

    /**
     * Instantiates a new Path with most hubs data.
     *
     * @param origin                            the origin
     * @param locals                            the locals
     * @param path                              the path
     * @param pathTotalDistance                 the path total distance
     * @param numberOfTimesTheVehicleWasCharged the number of times the vehicle was charged
     * @param routeTotalDuration                the route total duration
     * @param vehicleChargingDuration           the vehicle charging duration
     * @param vehicleInTheRoadDuration          the vehicle in the road duration
     * @param vehicleDischargingDuration        the vehicle discharging duration
     */
    public PathWithMostHubsData(Local origin, List<LocalsData> locals, LinkedList<Local> path, double pathTotalDistance, int numberOfTimesTheVehicleWasCharged, float routeTotalDuration, float vehicleChargingDuration, float vehicleInTheRoadDuration, float vehicleDischargingDuration) {
        this.origin = origin;
        this.locals = locals;
        this.path = path;
        this.pathTotalDistance = pathTotalDistance;
        this.numberOfTimesTheVehicleWasCharged = numberOfTimesTheVehicleWasCharged;
        this.routeTotalDuration = routeTotalDuration;
        this.vehicleChargingDuration = vehicleChargingDuration;
        this.vehicleInTheRoadDuration = vehicleInTheRoadDuration;
        this.vehicleDischargingDuration = vehicleDischargingDuration;
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
    public void setOrigin(Local origin) {
        this.origin = origin;
    }

    /**
     * Gets locals.
     *
     * @return the locals
     */
    public List<LocalsData> getLocals() {
        return locals;
    }

    /**
     * Sets locals.
     *
     * @param locals the locals
     */
    public void setLocals(List<LocalsData> locals) {
        this.locals = locals;
    }

    /**
     * Gets path.
     *
     * @return the path
     */
    public LinkedList<Local> getPath() {
        return path;
    }

    /**
     * Sets path.
     *
     * @param path the path
     */
    public void setPath(LinkedList<Local> path) {
        this.path = path;
    }

    /**
     * Gets path total distance.
     *
     * @return the path total distance
     */
    public double getPathTotalDistance() {
        return pathTotalDistance;
    }

    /**
     * Sets path total distance.
     *
     * @param pathTotalDistance the path total distance
     */
    public void setPathTotalDistance(double pathTotalDistance) {
        this.pathTotalDistance = pathTotalDistance;
    }

    /**
     * Gets number of times the vehicle was charged.
     *
     * @return the number of times the vehicle was charged
     */
    public int getNumberOfTimesTheVehicleWasCharged() {
        return numberOfTimesTheVehicleWasCharged;
    }

    /**
     * Sets number of times the vehicle was charged.
     *
     * @param numberOfTimesTheVehicleWasCharged the number of times the vehicle was charged
     */
    public void setNumberOfTimesTheVehicleWasCharged(int numberOfTimesTheVehicleWasCharged) {
        this.numberOfTimesTheVehicleWasCharged = numberOfTimesTheVehicleWasCharged;
    }

    /**
     * Gets route total duration.
     *
     * @return the route total duration
     */
    public float getRouteTotalDuration() {
        return routeTotalDuration;
    }

    /**
     * Sets route total duration.
     *
     * @param routeTotalDuration the route total duration
     */
    public void setRouteTotalDuration(float routeTotalDuration) {
        this.routeTotalDuration = routeTotalDuration;
    }

    /**
     * Gets vehicle charging duration.
     *
     * @return the vehicle charging duration
     */
    public float getVehicleChargingDuration() {
        return vehicleChargingDuration;
    }

    /**
     * Sets vehicle charging duration.
     *
     * @param vehicleChargingDuration the vehicle charging duration
     */
    public void setVehicleChargingDuration(float vehicleChargingDuration) {
        this.vehicleChargingDuration = vehicleChargingDuration;
    }

    /**
     * Sets number of hubs the vehicle went through.
     *
     * @param x the x
     */
    public void setNumberOfHubsTheVehicleWentThrough(int x) {
        this.numberOfHubsTheVehicleWentThrough = x;
    }

    /**
     * Gets of hubs the vehicle went through.
     *
     * @return the of hubs the vehicle went through
     */
    public int getnumberOfHubsTheVehicleWentThrough() {
        return numberOfHubsTheVehicleWentThrough;
    }

    /**
     * Gets vehicle in the road duration.
     *
     * @return the vehicle in the road duration
     */
    public float getVehicleInTheRoadDuration() {
        return vehicleInTheRoadDuration;
    }


    /**
     * Sets vehicle in the road duration.
     *
     * @param vehicleInTheRoadDuration the vehicle in the road duration
     */
    public void setVehicleInTheRoadDuration(float vehicleInTheRoadDuration) {
        this.vehicleInTheRoadDuration = vehicleInTheRoadDuration;
    }

    /**
     * Gets vehicle discharging duration.
     *
     * @return the vehicle discharging duration
     */
    public float getVehicleDischargingDuration() {
        return vehicleDischargingDuration;
    }

    /**
     * Sets vehicle discharging duration.
     *
     * @param vehicleDischargingDuration the vehicle discharging duration
     */
    public void setVehicleDischargingDuration(float vehicleDischargingDuration) {
        this.vehicleDischargingDuration = vehicleDischargingDuration;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof PathWithMostHubsData)) return false;
        PathWithMostHubsData that = (PathWithMostHubsData) o;
        return  Double.compare(pathTotalDistance, that.pathTotalDistance) == 0 && numberOfTimesTheVehicleWasCharged == that.numberOfTimesTheVehicleWasCharged && Objects.equals(DEFAULT_LOCAL, that.DEFAULT_LOCAL) &&Objects.equals(DEFAULT_SHORTPATH, that.DEFAULT_SHORTPATH)  && Objects.equals(origin, that.origin) && Objects.equals(locals, that.locals) && Objects.equals(path, that.path) && Objects.equals(routeTotalDuration, that.routeTotalDuration) && Objects.equals(vehicleChargingDuration, that.vehicleChargingDuration) && Objects.equals(vehicleInTheRoadDuration, that.vehicleInTheRoadDuration) && Objects.equals(vehicleDischargingDuration, that.vehicleDischargingDuration);
    }

    @Override
    public int hashCode() {
        return Objects.hash(DEFAULT_VALUE, DEFAULT_LOCAL,  DEFAULT_SHORTPATH, DEFAULT_VALUE2,  origin, locals, path, pathTotalDistance, numberOfTimesTheVehicleWasCharged, routeTotalDuration, vehicleChargingDuration, vehicleInTheRoadDuration, vehicleDischargingDuration);
    }

    @Override
    public String toString() {
        return "PathWithMostHubsData{" +
              ", origin=" + origin +
                ", locals=" + locals +
                ", path=" + path +
                ", pathTotalDistance=" + pathTotalDistance +
                ", numberOfTimesTheVehicleWasCharged=" + numberOfTimesTheVehicleWasCharged +
                ", routeTotalDuration=" + routeTotalDuration +
                ", vehicleChargingDuration=" + vehicleChargingDuration +
                ", vehicleInTheRoadDuration=" + vehicleInTheRoadDuration +
                ", vehicleDischargingDuration=" + vehicleDischargingDuration +
                '}';
    }
}
