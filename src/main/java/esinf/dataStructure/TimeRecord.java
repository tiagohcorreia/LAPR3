package esinf.dataStructure;

import java.time.LocalTime;
import java.util.Objects;

public class TimeRecord {
    private LocalTime totalTime;
    private LocalTime TimeAffectedToVehicleCharging;
    private LocalTime TimeAffectedToTheRoute;
    private LocalTime TimeAffectedBTheUnloadingTime;


    public LocalTime getTotalTime() {
        return totalTime;
    }

    public void setTotalTime(LocalTime totalTime) {
        this.totalTime = totalTime;
    }

    public LocalTime getTimeAffectedToVehicleCharging() {
        return TimeAffectedToVehicleCharging;
    }

    public void setTimeAffectedToVehicleCharging(LocalTime timeAffectedToVehicleCharging) {
        TimeAffectedToVehicleCharging = timeAffectedToVehicleCharging;
    }

    public LocalTime getTimeAffectedToTheRoute() {
        return TimeAffectedToTheRoute;
    }

    public void setTimeAffectedToTheRoute(LocalTime timeAffectedToTheRoute) {
        TimeAffectedToTheRoute = timeAffectedToTheRoute;
    }

    public LocalTime getTimeAffectedBTheUnloadingTime() {
        return TimeAffectedBTheUnloadingTime;
    }

    public void setTimeAffectedBTheUnloadingTime(LocalTime timeAffectedBTheUnloadingTime) {
        TimeAffectedBTheUnloadingTime = timeAffectedBTheUnloadingTime;
    }


    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof TimeRecord that)) return false;
        return getTotalTime().equals(that.getTotalTime()) && getTimeAffectedToVehicleCharging().equals(that.getTimeAffectedToVehicleCharging()) && getTimeAffectedToTheRoute().equals(that.getTimeAffectedToTheRoute()) && getTimeAffectedBTheUnloadingTime().equals(that.getTimeAffectedBTheUnloadingTime());
    }

    @Override
    public int hashCode() {
        return Objects.hash(getTotalTime(), getTimeAffectedToVehicleCharging(), getTimeAffectedToTheRoute(), getTimeAffectedBTheUnloadingTime());
    }

    @Override
    public String toString() {
        return "TimeRecord{" +
                "totalTime=" + totalTime +
                ", TimeAffectedToVehicleCharging=" + TimeAffectedToVehicleCharging +
                ", TimeAffectedToTheRoute=" + TimeAffectedToTheRoute +
                ", TimeAffectedBTheUnloadingTime=" + TimeAffectedBTheUnloadingTime +
                '}';
    }


}
