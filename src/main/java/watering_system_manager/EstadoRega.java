package watering_system_manager;

/**
 * The type Estado rega.
 */
public class EstadoRega {
    private boolean isActive;
    private String sector;
    private long remainingMinutes;

    /**
     * Instantiates a new Estado rega.
     *
     * @param isActive         the is active
     * @param sector           the sector
     * @param remainingMinutes the remaining minutes
     */
    public EstadoRega(boolean isActive, String sector, long remainingMinutes) {
        this.isActive = isActive;
        this.sector = sector;
        this.remainingMinutes = remainingMinutes;
    }

    /**
     * Is active boolean.
     *
     * @return the boolean
     */
    public boolean isActive() {
        return isActive;
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
     * Gets remaining minutes.
     *
     * @return the remaining minutes
     */
    public long getRemainingMinutes() {
        return remainingMinutes;
    }
}
