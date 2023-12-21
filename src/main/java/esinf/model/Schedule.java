package esinf.model;

import java.time.LocalTime;
import java.util.Objects;

public class Schedule {

    private LocalTime openingHours;
    private LocalTime closingHours;

    private final LocalTime DEFAULT_OPENING_HOURS=LocalTime.MIDNIGHT;
    private final LocalTime DEFAULT_CLOSING_HOURS=LocalTime.MIDNIGHT;

    public Schedule(){
        openingHours=DEFAULT_OPENING_HOURS;
        closingHours=DEFAULT_CLOSING_HOURS;
    }

    public Schedule(LocalTime openingHours, LocalTime closingHours) {
        this.openingHours = openingHours;
        this.closingHours = closingHours;
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
