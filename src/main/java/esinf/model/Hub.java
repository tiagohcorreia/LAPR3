package esinf.model;

import esinf.gps.GPS;

import java.time.LocalTime;
import java.util.Objects;

/**
 * The type Hub.
 */
public class Hub extends Local {

    private Schedule schedule;
    private int dischargeTime;

    private final Schedule DEFAULT_SCHEDULE = new Schedule();
    private final int DEFAULT_DISCHARGE_TIME = 0;

    private final int NUMBER_OF_COLLABORATORS_LIMIT_1 = 105;
    private final int NUMBER_OF_COLLABORATORS_LIMIT_2 = 215;

    /**
     * The constant SCHEDULE_1.
     */
    public static final Schedule SCHEDULE_1 = new Schedule(LocalTime.of(9, 0), LocalTime.of(14, 0));
    /**
     * The constant SCHEDULE_2.
     */
    public static final Schedule SCHEDULE_2 = new Schedule(LocalTime.of(11, 0), LocalTime.of(16, 0));
    /**
     * The constant SCHEDULE_3.
     */
    public static final Schedule SCHEDULE_3 = new Schedule(LocalTime.of(12, 0), LocalTime.of(17, 0));

    /**
     * Instantiates a new Hub.
     */
    public Hub() {
        super();
        this.schedule = DEFAULT_SCHEDULE;
        this.dischargeTime = DEFAULT_DISCHARGE_TIME;
    }

    /**
     * Instantiates a new Hub.
     *
     * @param localId       the local id
     * @param gps           the gps
     * @param dischargeTime the discharge time
     */
    public Hub(String localId, GPS gps, int dischargeTime) {
        super(localId, gps);
        generateSchedule();
        this.dischargeTime = dischargeTime;
    }

    /**
     * Instantiates a new Hub.
     *
     * @param local         the local
     * @param dischargeTime the discharge time
     */
    public Hub(Local local, int dischargeTime){
        super(local.getLocalId(), local.getGps());
        generateSchedule();
        this.dischargeTime=dischargeTime;
    }

    /**
     * Instantiates a new Hub.
     *
     * @param localId  the local id
     * @param schedule the schedule
     */
    public Hub(String localId, Schedule schedule) {
        localId = this.getLocalId();
        schedule = this.schedule;
    }

    /**
     * Gets schedule.
     *
     * @return the schedule
     */
    public Schedule getSchedule() {
        return schedule;
    }

    /**
     * Sets schedule.
     *
     * @param schedule the schedule
     */
    public void setSchedule(Schedule schedule) {
        this.schedule = schedule;
    }

    /**
     * Gets discharge time.
     *
     * @return the discharge time
     */
    public int getDischargeTime() {
        return dischargeTime;
    }

    /**
     * Sets discharge time.
     *
     * @param dischargeTime the discharge time
     */
    public void setDischargeTime(int dischargeTime) {
        this.dischargeTime = dischargeTime;
    }

    private Schedule generateSchedule() {

        if (this.getNumberOfCollaborators() <= NUMBER_OF_COLLABORATORS_LIMIT_1) {
            schedule = SCHEDULE_1;
        } else if (this.getNumberOfCollaborators() <= NUMBER_OF_COLLABORATORS_LIMIT_2) {
            schedule = SCHEDULE_2;
        } else {
            schedule = SCHEDULE_3;
        }

        return schedule;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        if (!super.equals(o)) return false;
        Hub hub = (Hub) o;
        return this.getLocalId().equals(hub.getLocalId()) &&
                this.getGps().equals(hub.getGps()) &&
                this.getDischargeTime() == hub.getDischargeTime() &&
                Objects.equals(this.getSchedule(), hub.getSchedule());
    }

    @Override
    public int hashCode() {
        return Objects.hash(super.hashCode(), getSchedule(), getDischargeTime());
    }

    @Override
    public String toString() {
        return "Hub{" +
                "id=" + super.getLocalId() +
                ", gps=" + super.getGps() +
                ", schedule=" + schedule +
                ", dischargeTime=" + dischargeTime +
                "}\n";
    }

    @Override
    public Hub clone() {
        return (Hub) super.clone();
    }
}
