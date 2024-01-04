package esinf.dataStructure;

import java.time.LocalTime;
import java.util.Objects;

/**
 * The type Data.
 */
public class Data {
    /**
     * The Arriving hour.
     */
    LocalTime arrivingHour;
    /**
     * The Departure hour.
     */
    LocalTime departureHour;

    /**
     * The Default value.
     */
    LocalTime DEFAULT_VALUE=null;
    /**
     * The Is hub.
     */
    Boolean isHub;

    /**
     * Gets hub.
     *
     * @return the hub
     */
    public Boolean getHub() {
        return isHub;
    }

    /**
     * Sets hub.
     *
     * @param hub the hub
     */
    public void setHub(Boolean hub) {
        isHub = hub;
    }

    /**
     * Instantiates a new Data.
     *
     * @param arrivingHour the arriving hour
     */
    public Data(LocalTime arrivingHour) {
        this.arrivingHour = arrivingHour;
        this.departureHour = DEFAULT_VALUE;
    }

    /**
     * Instantiates a new Data.
     *
     * @param arrivingHour  the arriving hour
     * @param departureHour the departure hour
     */
    public Data(LocalTime arrivingHour, LocalTime departureHour) {
        this.arrivingHour = arrivingHour;
        this.departureHour = departureHour;
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
     * Gets departure hour.
     *
     * @return the departure hour
     */
    public LocalTime getDepartureHour() {
        return departureHour;
    }

    /**
     * Sets departure hour.
     *
     * @param departureHour the departure hour
     */
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
