package esinf.model;

import java.util.Objects;

/**
 * The type Vehicle.
 */
public class Vehicle {

private int id;
private float autonomyDistance;
private float averageVelocity;
private float chargingTime;

private final int DEFAULT_ID = 1;
private final float DEFAULT_AUTONOMY_DISTANCE=200;
private final float DEFAULT_AVERAGE_VELOCITY=40;
private final float DEFAULT_CHARGING_TIME=90;

    /**
     * Instantiates a new Vehicle.
     */
    public Vehicle(){
    this.id = DEFAULT_ID;
    this.autonomyDistance = DEFAULT_AUTONOMY_DISTANCE;
    this.averageVelocity = DEFAULT_AVERAGE_VELOCITY;
    this.chargingTime = DEFAULT_CHARGING_TIME;
}

    /**
     * Instantiates a new Vehicle.
     *
     * @param id               the id
     * @param autonomyDistance the autonomy distance
     * @param averageVelocity  the average velocity
     * @param chargingTime     the charging time
     */
    public Vehicle(int id,float autonomyDistance,float averageVelocity,float chargingTime){
    this.id = id;
    this.autonomyDistance = autonomyDistance;
    this.averageVelocity = averageVelocity;
    this.chargingTime = chargingTime;

}

    /**
     * Gets id.
     *
     * @return the id
     */
    public int getId() {
        return id;
    }

    /**
     * Sets id.
     *
     * @param id the id
     */
    public void setId(int id) {
        this.id = id;
    }

    /**
     * Gets autonomy distance.
     *
     * @return the autonomy distance
     */
    public float getAutonomyDistance() {
        return autonomyDistance;
    }

    /**
     * Sets autonomy distance.
     *
     * @param autonomyDistance the autonomy distance
     */
    public void setAutonomyDistance(float autonomyDistance) {
        this.autonomyDistance = autonomyDistance;
    }

    /**
     * Gets average velocity.
     *
     * @return the average velocity
     */
    public float getAverageVelocity() {
        return averageVelocity;
    }

    /**
     * Sets average velocity.
     *
     * @param averageVelocity the average velocity
     */
    public void setAverageVelocity(float averageVelocity) {
        this.averageVelocity = averageVelocity;
    }

    @Override
    public String toString() {
        return "Vehicle{" +
                "id=" + id +
                ", autonomyDistance=" + autonomyDistance +
                ", averageVelocity=" + averageVelocity +
                ", chargingTime=" + chargingTime +
                '}';
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Vehicle vehicle = (Vehicle) o;
        return id == vehicle.id && Float.compare(vehicle.autonomyDistance, autonomyDistance) == 0 && Float.compare(vehicle.averageVelocity, averageVelocity) == 0 && Float.compare(vehicle.chargingTime, chargingTime) == 0;
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, autonomyDistance, averageVelocity, chargingTime);
    }

    /**
     * Gets charging time.
     *
     * @return the charging time
     */
    public float getChargingTime() {
        return chargingTime;
    }

    /**
     * Sets charging time.
     *
     * @param chargingTime the charging time
     */
    public void setChargingTime(float chargingTime) {
        this.chargingTime = chargingTime;
    }
}
