package esinf.dataStructure;

import esinf.model.Hub;

import java.time.LocalTime;
import java.util.Objects;

/**
 * The type Hubs record.
 */
public class HubsRecord {
private Hub hub;
private LocalTime arrivingHour;
private LocalTime leavingHour;


    /**
     * Gets hub.
     *
     * @return the hub
     */
    public Hub getHub() {
        return hub;
    }

    /**
     * Sets hub.
     *
     * @param hub the hub
     */
    public void setHub(Hub hub) {
        this.hub = hub;
    }

    /**
     * Gets arriving hour.
     *
     * @return the arriving hour
     */
    public LocalTime getArrivingHour() {
        return arrivingHour;
    }

    /**
     * Sets arriving hour.
     *
     * @param arrivingHour the arriving hour
     */
    public void setArrivingHour(LocalTime arrivingHour) {
        this.arrivingHour = arrivingHour;
    }

    /**
     * Gets leaving hour.
     *
     * @return the leaving hour
     */
    public LocalTime getLeavingHour() {
        return leavingHour;
    }

    /**
     * Sets leaving hour.
     *
     * @param leavingHour the leaving hour
     */
    public void setLeavingHour(LocalTime leavingHour) {
        this.leavingHour = leavingHour;
    }


    @Override
    public String toString() {
        return "Record{" +
                "hub=" + hub +
                ", arrivingHour=" + arrivingHour +
                ", leavingHour=" + leavingHour +
                '}';
    }
}
