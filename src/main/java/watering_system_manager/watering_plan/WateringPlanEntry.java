package watering_system_manager.watering_plan;

import java.time.LocalDate;
import java.time.LocalTime;
import java.util.Date;
import java.util.Objects;

public class WateringPlanEntry {

    private LocalDate date;
    private String sector;
    private int duration;
    private LocalTime begin;
    private LocalTime end;
    private boolean isFertigation;
    private String mix;

    private final LocalDate DEFAULT_DATE=LocalDate.now();
    private final String DEFAULT_SECTOR="(no sector)";
    private final int DEFAULT_DURATION=-1;
    private final LocalTime DEFAULT_BEGIN=LocalTime.MIDNIGHT;
    private final LocalTime DEFAULT_END=LocalTime.MIDNIGHT;
    private final boolean DEFAUTL_IS_FERTIGATION=false;
    private final String DEFAULT_MIX="(no mix)";

    public WateringPlanEntry() {
        this.date = DEFAULT_DATE;
        this.sector = DEFAULT_SECTOR;
        this.duration = DEFAULT_DURATION;
        this.begin = DEFAULT_BEGIN;
        this.end = DEFAULT_END;
        this.isFertigation=DEFAUTL_IS_FERTIGATION;
        this.mix=DEFAULT_MIX;
    }

    public WateringPlanEntry(LocalDate date, String sector, int duration, LocalTime begin, LocalTime end) {
        this.date = date;
        this.sector = sector;
        this.duration = duration;
        this.begin = begin;
        this.end = end;
        this.isFertigation=false;
    }

    public WateringPlanEntry(LocalDate date, String sector, int duration, LocalTime begin, LocalTime end, String mix) {
        this.date = date;
        this.sector = sector;
        this.duration = duration;
        this.begin = begin;
        this.end = end;
        this.isFertigation=true;
        this.mix=mix;
    }

    public LocalDate getDate() {
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

    public boolean isFertigation() {
        return isFertigation;
    }

    public String getMix() {
        return mix;
    }

    public void setDate(LocalDate date) {
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

    public void setFertigation(boolean fertigation) {
        isFertigation = fertigation;
    }

    public void setMix(String mix) {
        this.mix = mix;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        WateringPlanEntry that = (WateringPlanEntry) o;
        return getDuration() == that.getDuration() && isFertigation() == that.isFertigation() && Objects.equals(getDate(), that.getDate()) && Objects.equals(getSector(), that.getSector()) && Objects.equals(getBegin(), that.getBegin()) && Objects.equals(getEnd(), that.getEnd()) && Objects.equals(getMix(), that.getMix());
    }

    @Override
    public int hashCode() {
        return Objects.hash(getDate(), getSector(), getDuration(), getBegin(), getEnd(), isFertigation(), getMix());
    }

    @Override
    public String toString() {
        return "WateringPlanEntry{" +
                "date=" + date +
                ", sector='" + sector + '\'' +
                ", duration=" + duration +
                ", begin=" + begin +
                ", end=" + end +
                ", isFertigation=" + isFertigation +
                ", mix='" + mix + '\'' +
                '}';
    }
}
