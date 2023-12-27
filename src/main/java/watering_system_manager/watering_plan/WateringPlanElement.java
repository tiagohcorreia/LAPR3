package watering_system_manager.watering_plan;

import java.time.LocalTime;
import java.util.Date;
import java.util.Objects;

public class WateringPlanElement {

    private Date date;
    private String sector;
    private int duration;
    private LocalTime begin;
    private LocalTime end;

    private final Date DEFAULT_DATE=new Date();
    private final String DEFAULT_SECTOR="(no sector)";
    private final int DEFAULT_DURATION=-1;
    private final LocalTime DEFAULT_BEGIN=LocalTime.MIDNIGHT;
    private final LocalTime DEFAULT_END=LocalTime.MIDNIGHT;

    public WateringPlanElement() {
        this.date = DEFAULT_DATE;
        this.sector = DEFAULT_SECTOR;
        this.duration = DEFAULT_DURATION;
        this.begin = DEFAULT_BEGIN;
        this.end = DEFAULT_END;
    }

    public WateringPlanElement(Date date, String sector, int duration, LocalTime begin, LocalTime end) {
        this.date = date;
        this.sector = sector;
        this.duration = duration;
        this.begin = begin;
        this.end = end;
    }

    public Date getDate() {
        return date;
    }

    public String getSector() {
        return sector;
    }

    public int getDuration() {
        return duration;
    }

    public LocalTime getBegin() {
        return begin;
    }

    public LocalTime getEnd() {
        return end;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public void setSector(String sector) {
        this.sector = sector;
    }

    public void setDuration(int duration) {
        this.duration = duration;
    }

    public void setBegin(LocalTime begin) {
        this.begin = begin;
    }

    public void setEnd(LocalTime end) {
        this.end = end;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        WateringPlanElement that = (WateringPlanElement) o;
        return getDuration() == that.getDuration() && Objects.equals(getDate(), that.getDate()) && Objects.equals(getSector(), that.getSector()) && Objects.equals(getBegin(), that.getBegin()) && Objects.equals(getEnd(), that.getEnd());
    }

    @Override
    public int hashCode() {
        return Objects.hash(getDate(), getSector(), getDuration(), getBegin(), getEnd());
    }

    @Override
    public String toString() {
        return "WateringPlanElement{" +
                "date=" + date +
                ", sector='" + sector + '\'' +
                ", duration=" + duration +
                ", begin=" + begin +
                ", end=" + end +
                '}';
    }
}
