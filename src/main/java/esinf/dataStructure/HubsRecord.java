package esinf.dataStructure;

import esinf.model.Hub;

import java.time.LocalTime;
import java.util.Objects;

public class HubsRecord {
private Hub hub;
private LocalTime arrivingHour;
private LocalTime leavingHour;



    public Hub getHub() {
        return hub;
    }

    public void setHub(Hub hub) {
        this.hub = hub;
    }

    public LocalTime getArrivingHour() {
        return arrivingHour;
    }

    public void setArrivingHour(LocalTime arrivingHour) {
        this.arrivingHour = arrivingHour;
    }

    public LocalTime getLeavingHour() {
        return leavingHour;
    }

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
