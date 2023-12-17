package domain;

import esinf.model.Local;

import javax.xml.crypto.Data;
import java.time.LocalTime;
import java.util.Objects;

public class Hub {
    private Local local;
    private LocalTime openingHours;
    private LocalTime closingHours;
    private int dischargeTime;

    private final Local DEFAULT_LOCAL=new Local();
    private final LocalTime DEFAULT_OPENING_HOURS=LocalTime.MIDNIGHT;
    private final LocalTime DEFAULT_CLOSING_HOURS=LocalTime.MIDNIGHT;
    private final int DEFAULT_DISCHARGE_TIME=0;

    public Hub(){
        this.local = DEFAULT_LOCAL;
        this.openingHours = DEFAULT_OPENING_HOURS;
        this.closingHours = DEFAULT_CLOSING_HOURS;
        this.dischargeTime = DEFAULT_DISCHARGE_TIME;
    }

    public Hub(Local local, LocalTime openingHours, LocalTime closingHours, int dischargeTime) {
        this.local = local;
        this.openingHours = openingHours;
        this.closingHours = closingHours;
        this.dischargeTime = dischargeTime;
    }

    public Local getLocal() {
        return local;
    }

    public void setLocal(Local local) {
        this.local = local;
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
        Hub hub = (Hub) o;
        return getDischargeTime() == hub.getDischargeTime() && Objects.equals(getLocal(), hub.getLocal()) && Objects.equals(getOpeningHours(), hub.getOpeningHours()) && Objects.equals(getClosingHours(), hub.getClosingHours());
    }

    @Override
    public int hashCode() {
        return Objects.hash(getLocal(), getOpeningHours(), getClosingHours(), getDischargeTime());
    }

    @Override
    public String toString() {
        return "Hub {" +
                "local=" + local +
                ", openingHours=" + openingHours +
                ", closingHours=" + closingHours +
                ", dischargeTime=" + dischargeTime +
                "}\n";
    }

}
