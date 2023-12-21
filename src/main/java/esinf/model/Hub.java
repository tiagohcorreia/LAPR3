package esinf.model;

import esinf.gps.GPS;
import esinf.model.Local;
import esinf.model.Schedule;

import java.time.LocalTime;
import java.util.Objects;

public class Hub extends Local {

    private Schedule schedule;
    private int dischargeTime;

    private final Schedule DEFAULT_SCHEDULE = new Schedule();
    private final int DEFAULT_DISCHARGE_TIME = 0;

    private final int NUMBER_OF_COLLABORATORS_LIMIT_1 = 105;
    private final int NUMBER_OF_COLLABORATORS_LIMIT_2 = 215;

    private final Schedule SCHEDULE_1 = new Schedule(LocalTime.of(9, 0), LocalTime.of(14, 0));
    private final Schedule SCHEDULE_2 = new Schedule(LocalTime.of(11, 0), LocalTime.of(16, 0));
    private final Schedule SCHEDULE_3 = new Schedule(LocalTime.of(12, 0), LocalTime.of(17, 0));

    public Hub() {
        super();
        this.schedule = DEFAULT_SCHEDULE;
        this.dischargeTime = DEFAULT_DISCHARGE_TIME;
    }

    public Hub(String localId, GPS gps, int dischargeTime) {
        super(localId, gps);
        generateSchedule();
        this.dischargeTime = dischargeTime;
    }

    public Schedule getSchedule() {
        return schedule;
    }

    public void setSchedule(Schedule schedule) {
        this.schedule = schedule;
    }

    public int getDischargeTime() {
        return dischargeTime;
    }

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
}
