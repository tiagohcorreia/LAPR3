package esinf.dataStructure;

import java.time.LocalTime;
import java.util.Objects;

public class Data {
    LocalTime arrivingHour;
    LocalTime departureHour;

    LocalTime DEFAULT_VALUE=null;
    Boolean isHub;

    public Boolean getHub() {
        return isHub;
    }

    public void setHub(Boolean hub) {
        isHub = hub;
    }

    public Data(LocalTime arrivingHour) {
        this.arrivingHour = arrivingHour;
        this.departureHour = DEFAULT_VALUE;
    }
    public Data(LocalTime arrivingHour, LocalTime departureHour) {
        this.arrivingHour = arrivingHour;
        this.departureHour = departureHour;
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


    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof Data)) return false;
        Data data = (Data) o;
        return Objects.equals(getArrivingHour(), data.getArrivingHour()) && Objects.equals(getDepartureHour(), data.getDepartureHour()) && Objects.equals(DEFAULT_VALUE, data.DEFAULT_VALUE) && Objects.equals(isHub, data.isHub);
    }

    @Override
    public int hashCode() {
        return Objects.hash(getArrivingHour(), getDepartureHour(), DEFAULT_VALUE, isHub);
    }

    @Override
    public String toString() {
        return "Data{" +
                "arrivingHour=" + arrivingHour +
                ", departureHour=" + departureHour +
                ", DEFAULT_VALUE=" + DEFAULT_VALUE +
                ", isHub=" + isHub +
                '}';
    }

   }
