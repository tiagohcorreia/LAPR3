package esinf.dataStructure;

import esinf.model.Hub;

import java.time.LocalTime;
import java.util.Objects;

public class Record {
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
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof Record)) return false;
        Record record=(Record) o;
        return getHub().equals(record.getHub()) && getArrivingHour().equals(record.getArrivingHour()) && getLeavingHour().equals(record.getLeavingHour());
    }

    @Override
    public int hashCode() {
        return Objects.hash(getHub(), getArrivingHour(), getLeavingHour());
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
