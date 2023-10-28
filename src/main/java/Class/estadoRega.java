package Class;

public class estadoRega {
    private boolean isActive;
    private String sector;
    private long remainingMinutes;

    public estadoRega(boolean isActive, String sector, long remainingMinutes) {
        this.isActive = isActive;
        this.sector = sector;
        this.remainingMinutes = remainingMinutes;
    }

    public boolean isActive() {
        return isActive;
    }

    public String getSector() {
        return sector;
    }

    public long getRemainingMinutes() {
        return remainingMinutes;
    }
}
