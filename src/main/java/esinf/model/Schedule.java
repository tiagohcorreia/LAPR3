package esinf.model;

import java.time.LocalTime;
import java.util.Objects;

/**
 * The type Schedule.
 */
public class Schedule {

    private LocalTime openingHours;
    private LocalTime closingHours;

    private final LocalTime DEFAULT_OPENING_HOURS = LocalTime.MIDNIGHT;
    private final LocalTime DEFAULT_CLOSING_HOURS = LocalTime.MIDNIGHT;

    /**
     * Instantiates a new Schedule.
     */
    public Schedule() {
        openingHours = DEFAULT_OPENING_HOURS;
        closingHours = DEFAULT_CLOSING_HOURS;
    }

    /**
     * Instantiates a new Schedule.
     *
     * @param openingHours the opening hours
     * @param closingHours the closing hours
     */
    public Schedule(LocalTime openingHours, LocalTime closingHours) {
        this.openingHours = openingHours;
        this.closingHours = closingHours;
    }

    /**
     * Gets opening hours.
     *
     * @return the opening hours
     */
    public LocalTime getOpeningHours() {
        return openingHours;
    }

    /**
     * Sets opening hours.
     *
     * @param openingHours the opening hours
     */
    public void setOpeningHours(LocalTime openingHours) {
        this.openingHours = openingHours;
    }

    /**
     * Gets closing hours.
     *
     * @return the closing hours
     */
    public LocalTime getClosingHours() {
        return closingHours;
    }

    /**
     * Sets closing hours.
     *
     * @param closingHours the closing hours
     */
    public void setClosingHours(LocalTime closingHours) {
        this.closingHours = closingHours;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Schedule schedule = (Schedule) o;
        return Objects.equals(getOpeningHours(), schedule.getOpeningHours())
                && Objects.equals(getClosingHours(), schedule.getClosingHours());
    }

    @Override
    public int hashCode() {
        return Objects.hash(getOpeningHours(), getClosingHours());
    }

    @Override
    public String toString() {
        return "Schedule{" +
                "openingHours=" + openingHours +
                ", closingHours=" + closingHours +
                "}\n";
    }
}
