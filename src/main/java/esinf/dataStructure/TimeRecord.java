package esinf.dataStructure;

import java.time.LocalTime;
import java.util.Objects;

/**
 * The type Time record.
 */
public class TimeRecord {
    private LocalTime totalTime;
    private LocalTime TimeAffectedToVehicleCharging;
    private LocalTime TimeAffectedToTheRoute;
    private LocalTime TimeAffectedBTheUnloadingTime;


    /**
     * Gets total time.
     *
     * @return the total time
     */
    public LocalTime getTotalTime() {
        return totalTime;
    }

    /**
     * Sets total time.
     *
     * @param totalTime the total time
     */
    public void setTotalTime(LocalTime totalTime) {
        this.totalTime = totalTime;
    }

    /**
     * Gets time affected to vehicle charging.
     *
     * @return the time affected to vehicle charging
     */
    public LocalTime getTimeAffectedToVehicleCharging() {
        return TimeAffectedToVehicleCharging;
    }

    /**
     * Sets time affected to vehicle charging.
     *
     * @param timeAffectedToVehicleCharging the time affected to vehicle charging
     */
    public void setTimeAffectedToVehicleCharging(LocalTime timeAffectedToVehicleCharging) {
        TimeAffectedToVehicleCharging = timeAffectedToVehicleCharging;
    }

    /**
     * Gets time affected to the route.
     *
     * @return the time affected to the route
     */
    public LocalTime getTimeAffectedToTheRoute() {
        return TimeAffectedToTheRoute;
    }

    /**
     * Sets time affected to the route.
     *
     * @param timeAffectedToTheRoute the time affected to the route
     */
    public void setTimeAffectedToTheRoute(LocalTime timeAffectedToTheRoute) {
        TimeAffectedToTheRoute = timeAffectedToTheRoute;
    }

    /**
     * Gets time affected b the unloading time.
     *
     * @return the time affected b the unloading time
     */
    public LocalTime getTimeAffectedBTheUnloadingTime() {
        return TimeAffectedBTheUnloadingTime;
    }

    /**
     * Sets time affected b the unloading time.
     *
     * @param timeAffectedBTheUnloadingTime the time affected b the unloading time
     */
    public void setTimeAffectedBTheUnloadingTime(LocalTime timeAffectedBTheUnloadingTime) {
        TimeAffectedBTheUnloadingTime = timeAffectedBTheUnloadingTime;
    }


    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof TimeRecord)) return false;
        TimeRecord that=(TimeRecord) o;
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
