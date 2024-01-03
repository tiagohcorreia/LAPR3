package watering_system_manager.watering_plan;

import java.time.LocalDate;
import java.time.LocalTime;
import java.util.Date;
import java.util.Objects;

/**
 * The type Watering plan entry.
 */
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

    /**
     * Instantiates a new Watering plan entry.
     */
    public WateringPlanEntry() {
        this.date = DEFAULT_DATE;
        this.sector = DEFAULT_SECTOR;
        this.duration = DEFAULT_DURATION;
        this.begin = DEFAULT_BEGIN;
        this.end = DEFAULT_END;
        this.isFertigation=DEFAUTL_IS_FERTIGATION;
        this.mix=DEFAULT_MIX;
    }

    /**
     * Instantiates a new Watering plan entry.
     *
     * @param date     the date
     * @param sector   the sector
     * @param duration the duration
     * @param begin    the begin
     * @param end      the end
     */
    public WateringPlanEntry(LocalDate date, String sector, int duration, LocalTime begin, LocalTime end) {
        this.date = date;
        this.sector = sector;
        this.duration = duration;
        this.begin = begin;
        this.end = end;
        this.isFertigation=false;
    }

    /**
     * Instantiates a new Watering plan entry.
     *
     * @param date     the date
     * @param sector   the sector
     * @param duration the duration
     * @param begin    the begin
     * @param end      the end
     * @param mix      the mix
     */
    public WateringPlanEntry(LocalDate date, String sector, int duration, LocalTime begin, LocalTime end, String mix) {
        this.date = date;
        this.sector = sector;
        this.duration = duration;
        this.begin = begin;
        this.end = end;
        this.isFertigation=true;
        this.mix=mix;
    }

    /**
     * Gets date.
     *
     * @return the date
     */
    public LocalDate getDate() {
        return date;
    }

    /**
     * Gets sector.
     *
     * @return the sector
     */
    public String getSector() {
        return sector;
    }

    /**
     * Gets duration.
     *
     * @return the duration
     */
    public int getDuration() {
        return duration;
    }

    /**
     * Gets begin.
     *
     * @return the begin
     */
    public LocalTime getBegin() {
        return begin;
    }

    /**
     * Gets end.
     *
     * @return the end
     */
    public LocalTime getEnd() {
        return end;
    }

    /**
     * Is fertigation boolean.
     *
     * @return the boolean
     */
    public boolean isFertigation() {
        return isFertigation;
    }

    /**
     * Gets mix.
     *
     * @return the mix
     */
    public String getMix() {
        return mix;
    }

    /**
     * Sets date.
     *
     * @param date the date
     */
    public void setDate(LocalDate date) {
        this.date = date;
    }

    /**
     * Sets sector.
     *
     * @param sector the sector
     */
    public void setSector(String sector) {
        this.sector = sector;
    }

    /**
     * Sets duration.
     *
     * @param duration the duration
     */
    public void setDuration(int duration) {
        this.duration = duration;
    }

    /**
     * Sets begin.
     *
     * @param begin the begin
     */
    public void setBegin(LocalTime begin) {
        this.begin = begin;
    }

    /**
     * Sets end.
     *
     * @param end the end
     */
    public void setEnd(LocalTime end) {
        this.end = end;
    }

    /**
     * Sets fertigation.
     *
     * @param fertigation the fertigation
     */
    public void setFertigation(boolean fertigation) {
        isFertigation = fertigation;
    }

    /**
     * Sets mix.
     *
     * @param mix the mix
     */
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
