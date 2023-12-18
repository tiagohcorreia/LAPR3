package domain;

import esinf.gps.GPS;
import esinf.model.Local;

import javax.xml.crypto.Data;
import java.time.LocalTime;
import java.util.Objects;

public class Hub extends Local{
    private LocalTime openingHours;
    private LocalTime closingHours;
    private int dischargeTime;

    private final LocalTime DEFAULT_OPENING_HOURS=LocalTime.MIDNIGHT;
    private final LocalTime DEFAULT_CLOSING_HOURS=LocalTime.MIDNIGHT;
    private final int DEFAULT_DISCHARGE_TIME=0;

    public Hub(){
        super();
        this.openingHours = DEFAULT_OPENING_HOURS;
        this.closingHours = DEFAULT_CLOSING_HOURS;
        this.dischargeTime = DEFAULT_DISCHARGE_TIME;
    }

    public Hub(String localId, GPS gps, LocalTime openingHours, LocalTime closingHours, int dischargeTime) {
        super(localId, gps);
        this.openingHours = openingHours;
        this.closingHours = closingHours;
        this.dischargeTime = dischargeTime;
    }

    public LocalTime getOpeningHours() {
        return openingHours;
    }

    public void setOpeningHours(LocalTime openingHours) {
        this.openingHours = openingHours;
    }

    public LocalTime getClosingHours() {
        return closingHours;
    }

    public void setClosingHours(LocalTime closingHours) {
        this.closingHours = closingHours;
    }

    public int getDischargeTime() {
        return dischargeTime;
    }

    public void setDischargeTime(int dischargeTime) {
        this.dischargeTime = dischargeTime;
    }


    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        if (!super.equals(o)) return false;
        Hub hub = (Hub) o;
        return getDischargeTime() == hub.getDischargeTime() && Objects.equals(getOpeningHours(), hub.getOpeningHours()) && Objects.equals(getClosingHours(), hub.getClosingHours());
    }

    @Override
    public int hashCode() {
        return Objects.hash(super.hashCode(), getOpeningHours(), getClosingHours(), getDischargeTime());
    }

    @Override
    public String toString() {
        return "Hub{" +
                "localId='" + super.getLocalId() +
                ", gps=" + super.getGps() +
                ", openingHours=" + openingHours +
                ", closingHours=" + closingHours +
                ", dischargeTime=" + dischargeTime +
                "}\n";
    }
}
