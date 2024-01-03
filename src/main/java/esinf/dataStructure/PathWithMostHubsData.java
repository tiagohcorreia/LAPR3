package esinf.dataStructure;

import esinf.model.Hub;
import esinf.model.Local;

import java.time.Duration;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Objects;

public class PathWithMostHubsData {
    private final int DEFAULT_VALUE = 0;
    private final Local DEFAULT_LOCAL = null;
    private final float DEFAULT_VALUE2 = 0;
    private final List<LocalsData> DEFAULT_LOCALS = null;
    private final LinkedList<Local> DEFAULT_SHORTPATH = null;

    /////
    private Local origin;  //local de partida
    private List<LocalsData> locals; //informação sobre os locals(locais,os que sao hub, arriving hour, e se for hub departuretime)
    LinkedList<Local> path;
    private double pathTotalDistance; // distancia do percurso inteiro
    private int numberOfTimesTheVehicleWasCharged;
    private float routeTotalDuration;  // duração total do percurso
    private float vehicleChargingDuration;  // duração total dos carregamentos do veiculo
    private float vehicleInTheRoadDuration;  // duração total do percurso na estrada
    private float vehicleDischargingDuration;  // duração total dos descarregamentos dos cabazes
    private int numberOfHubsTheVehicleWentThrough=0;  //numero de hubs pelo qual o veiculo conseguiu passar


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

    public Local getOrigin() {
        return origin;
    }

    public void setOrigin(Local origin) {
        this.origin = origin;
    }

    public List<LocalsData> getLocals() {
        return locals;
    }

    public void setLocals(List<LocalsData> locals) {
        this.locals = locals;
    }

    public LinkedList<Local> getPath() {
        return path;
    }

    public void setPath(LinkedList<Local> path) {
        this.path = path;
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

    public float getRouteTotalDuration() {
        return routeTotalDuration;
    }

    public void setRouteTotalDuration(float routeTotalDuration) {
        this.routeTotalDuration = routeTotalDuration;
    }

    public float getVehicleChargingDuration() {
        return vehicleChargingDuration;
    }

    public void setVehicleChargingDuration(float vehicleChargingDuration) {
        this.vehicleChargingDuration = vehicleChargingDuration;
    }

    public void setNumberOfHubsTheVehicleWentThrough(int x) {
        this.numberOfHubsTheVehicleWentThrough = x;
    }

    public int getnumberOfHubsTheVehicleWentThrough() {
        return numberOfHubsTheVehicleWentThrough;
    }
    public float getVehicleInTheRoadDuration() {
        return vehicleInTheRoadDuration;
    }


    public void setVehicleInTheRoadDuration(float vehicleInTheRoadDuration) {
        this.vehicleInTheRoadDuration = vehicleInTheRoadDuration;
    }

    public float getVehicleDischargingDuration() {
        return vehicleDischargingDuration;
    }

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
