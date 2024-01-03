package esinf.gps;

import java.util.Objects;

/**
 * The type Gps.
 */
public class GPS {

    private double latitude;
    private double longitude;

    private final double DEFAULT_LATIT = 0;
    private final double DEFAULT_LONGIT = 0;

    /**
     * Instantiates a new Gps.
     */
    public GPS() {
        this.latitude = DEFAULT_LATIT;
        this.longitude = DEFAULT_LONGIT;
    }

    /**
     * Instantiates a new Gps.
     *
     * @param latitude  the latitude
     * @param longitude the longitude
     */
    public GPS(double latitude, double longitude) {
        this.latitude = latitude;
        this.longitude = longitude;
    }

    /**
     * Instantiates a new Gps.
     *
     * @param gps the gps
     */
    public GPS(String gps) {
        this.latitude = Double.parseDouble(String.valueOf(gps.split(",")));
        this.longitude = Double.parseDouble(gps);
    }

    /**
     * Gets latitude.
     *
     * @return the latitude
     */
    public double getLatitude() {
        return latitude;
    }

    /**
     * Sets latitude.
     *
     * @param latitude the latitude
     */
    public void setLatitude(double latitude) {
        this.latitude = latitude;
    }

    /**
     * Gets longitude.
     *
     * @return the longitude
     */
    public double getLongitude() {
        return longitude;
    }

    /**
     * Sets longitude.
     *
     * @param longitude the longitude
     */
    public void setLongitude(double longitude) {
        this.longitude = longitude;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof GPS)) return false;
        GPS otherGPS=(GPS) o;
        return Double.compare(this.latitude, otherGPS.getLatitude()) == 0 &&
                Double.compare(this.longitude, otherGPS.getLongitude()) == 0;
    }

    @Override
    public int hashCode() {
        return Objects.hash(latitude, longitude);
    }

    @Override
    public String toString() {
        return "GPS COORDINATES: " + latitude + ", " + longitude;
    }

    /**
     * Calculates the distance, in km, between "this" gps coordinates and the coordinates given by parameter
     *
     * @param gps2 the other coordinates to determine the distance
     * @return the distance between the coordinates of "this" gps object and the one given by parameter
     */
    public double getDistance(GPS gps2) {

        double latitude2 = gps2.getLatitude();
        double longitude2 = gps2.getLongitude();

        final double EARTH_RADIUS = 6371;

        // Converte as latitudes e longitudes para radianos
        double latitude1Radians = this.latitude * Math.PI / 180;
        double latitude2Radians = latitude2 * Math.PI / 180;
        double longitude1Radians = this.longitude * Math.PI / 180;
        double longitude2Radians = longitude2 * Math.PI / 180;

        // Calcula a distância em quilómetros
        double distance = EARTH_RADIUS * Math.acos(Math.sin(latitude1Radians) * Math.sin(latitude2Radians) + Math.cos(latitude1Radians) * Math.cos(latitude2Radians) * Math.cos(longitude2Radians - longitude1Radians));

        return distance;
    }

    /**
     * Compare longitude int.
     *
     * @param other the other
     * @return the int
     */
    public int compareLongitude(GPS other) {
        return Double.compare(this.longitude, other.longitude);
    }

    /**
     * Compare latitude int.
     *
     * @param other the other
     * @return the int
     */
    public int compareLatitude(GPS other) {
        return Double.compare(this.latitude, other.latitude);
    }

    /**
     * Gets distance.
     *
     * @param gps  the gps
     * @param gps2 the gps 2
     * @return the distance
     */
//just for ex4
    public static double getDistance(GPS gps, GPS gps2) {
        double latitude1 = gps.getLatitude();
        double longitude1 = gps.getLongitude();

        double latitude2 = gps2.getLatitude();
        double longitude2 = gps2.getLongitude();

        return Math.sqrt(Math.pow(latitude2 - latitude1, 2) + Math.pow(longitude2 - longitude1, 2));
    }
}
