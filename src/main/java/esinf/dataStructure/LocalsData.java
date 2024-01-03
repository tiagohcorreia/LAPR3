package esinf.dataStructure;

import esinf.model.Local;

import java.time.LocalTime;
import java.util.Objects;

/**
 * The type Locals data.
 */
public class LocalsData {
    /**
     * The Default value.
     */
    LocalTime DEFAULT_VALUE=null;
    /**
     * The Default value 2.
     */
    Local DEFAULT_VALUE2=null;
    /**
     * The Default value 3.
     */
    Boolean DEFAULT_VALUE3=false;

    /**
     * The Local.
     */
    Local local;
    /**
     * The Arriving hour.
     */
    LocalTime arrivingHour;
    /**
     * The Departure hour.
     */
    LocalTime departureHour;
    /**
     * The Is hub.
     */
    Boolean isHub;

    /**
     * Instantiates a new Locals data.
     *
     * @param local        the local
     * @param arrivingHour the arriving hour
     */
    public LocalsData(Local local,LocalTime arrivingHour) {
        this.arrivingHour = arrivingHour;
        this.local =local;
        this.departureHour = DEFAULT_VALUE;
        this.isHub = DEFAULT_VALUE3;
    }

    /**
     * Instantiates a new Locals data.
     */
    public LocalsData() {
        this.local = DEFAULT_VALUE2;
        this.arrivingHour = DEFAULT_VALUE;
        this.departureHour = DEFAULT_VALUE;
        this.isHub = DEFAULT_VALUE3;
    }


    /**
     * Instantiates a new Locals data.
     *
     * @param local         the local
     * @param arrivingHour  the arriving hour
     * @param departureHour the departure hour
     * @param DEFAULT_VALUE the default value
     * @param isHub         the is hub
     */
    public LocalsData(Local local, LocalTime arrivingHour, LocalTime departureHour, LocalTime DEFAULT_VALUE, Boolean isHub) {
        this.local = local;
        this.arrivingHour = arrivingHour;
        this.departureHour = departureHour;
        this.DEFAULT_VALUE = DEFAULT_VALUE;
        this.isHub = isHub;
    }

    /**
     * Gets local.
     *
     * @return the local
     */
    public Local getLocal() {
        return local;
    }

    /**
     * Sets local.
     *
     * @param local the local
     */
    public void setLocal(Local local) {
        this.local = local;
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

    /**
     * Gets default value.
     *
     * @return the default value
     */
    public LocalTime getDEFAULT_VALUE() {
        return DEFAULT_VALUE;
    }

    /**
     * Sets default value.
     *
     * @param DEFAULT_VALUE the default value
     */
    public void setDEFAULT_VALUE(LocalTime DEFAULT_VALUE) {
        this.DEFAULT_VALUE = DEFAULT_VALUE;
    }

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

    @Override
    public String toString() {
        return "LocalsData{" +
                "local=" + local +
                ", arrivingHour=" + arrivingHour +
                ", departureHour=" + departureHour +
                ", DEFAULT_VALUE=" + DEFAULT_VALUE +
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
