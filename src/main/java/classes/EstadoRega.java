package classes;

public class EstadoRega {
    private boolean isActive;
    private String sector;
    private long remainingMinutes;

    public EstadoRega(boolean isActive, String sector, long remainingMinutes) {
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
