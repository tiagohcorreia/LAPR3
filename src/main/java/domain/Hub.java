package domain;

import esinf.model.Local;

import javax.xml.crypto.Data;
import java.time.LocalTime;
import java.util.Objects;

public class Hub {
    private Local local;
    private LocalTime openingHours;
    private int dischargeTime;



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

    public int getDischargeTime() {
        return dischargeTime;
    }

    public void setDischargeTime(int dischargeTime) {
        this.dischargeTime = dischargeTime;
    }


    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof Hub hub)) return false;
        return getDischargeTime() == hub.getDischargeTime() && getLocal().equals(hub.getLocal()) && getOpeningHours().equals(hub.getOpeningHours());
    }

    @Override
    public int hashCode() {
        return Objects.hash(getLocal(), getOpeningHours(), getDischargeTime());
    }

    @Override
    public String toString() {
        return "Hub{" +
                "local=" + local +
                ", openingHours=" + openingHours +
                ", dischargeTime=" + dischargeTime +
                '}';
    }

}
