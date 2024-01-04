package esinf.dataStructure;

import esinf.model.Local;

import java.time.LocalTime;
import java.util.Objects;

public class LocalsData {
    LocalTime DEFAULT_VALUE=null;
    Local DEFAULT_VALUE2=null;
    Boolean DEFAULT_VALUE3=false;

    Local local;
    LocalTime arrivingHour;
    LocalTime departureHour;
    Boolean isHub;

    public LocalsData(Local local,LocalTime arrivingHour) {
        this.arrivingHour = arrivingHour;
        this.local =local;
        this.departureHour = DEFAULT_VALUE;
        this.isHub = DEFAULT_VALUE3;
    }

    public LocalsData() {
        this.local = DEFAULT_VALUE2;
        this.arrivingHour = DEFAULT_VALUE;
        this.departureHour = DEFAULT_VALUE;
        this.isHub = DEFAULT_VALUE3;
    }



    public LocalsData(Local local, LocalTime arrivingHour, LocalTime departureHour, LocalTime DEFAULT_VALUE, Boolean isHub) {
        this.local = local;
        this.arrivingHour = arrivingHour;
        this.departureHour = departureHour;
        this.DEFAULT_VALUE = DEFAULT_VALUE;
        this.isHub = isHub;
    }

    public Local getLocal() {
        return local;
    }

    public void setLocal(Local local) {
        this.local = local;
    }

    public LocalTime getArrivingHour() {
        return arrivingHour;
    }

    public void setArrivingHour(LocalTime arrivingHour) {
        this.arrivingHour = arrivingHour;
    }

    public LocalTime getDepartureHour() {
        return departureHour;
    }

    public void setDepartureHour(LocalTime departureHour) {
        this.departureHour = departureHour;
    }

    public LocalTime getDEFAULT_VALUE() {
        return DEFAULT_VALUE;
    }

    public void setDEFAULT_VALUE(LocalTime DEFAULT_VALUE) {
        this.DEFAULT_VALUE = DEFAULT_VALUE;
    }

    public Boolean getHub() {
        return isHub;
    }

    public void setHub(Boolean hub) {
        isHub = hub;
    }

    @Override
    public String toString() {
        return "LocalsData{" +
                "local=" + local +
                ", arrivingHour=" + arrivingHour +
                ", departureHour=" + departureHour +
                ", isHub=" + isHub +
                '}';
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof LocalsData)) return false;
        LocalsData localsData = (LocalsData) o;
        return Objects.equals(getLocal(), localsData.getLocal()) && Objects.equals(getArrivingHour(), localsData.getArrivingHour()) && Objects.equals(getDepartureHour(), localsData.getDepartureHour()) && Objects.equals(getDEFAULT_VALUE(), localsData.getDEFAULT_VALUE()) && Objects.equals(isHub, localsData.isHub);
    }

    @Override
    public int hashCode() {
        return Objects.hash(getLocal(), getArrivingHour(), getDepartureHour(), getDEFAULT_VALUE(), isHub);
    }

}
