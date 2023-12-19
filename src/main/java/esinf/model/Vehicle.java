package esinf.model;

import java.util.Objects;

public class Vehicle {

private int id;
private float autonomyDistance;
private float averageVelocity;
private float chargingTime;

private final int DEFAULT_ID = 1;
private final float DEFAULT_AUTONOMY_DISTANCE=200;
private final float DEFAULT_AVERAGE_VELOCITY=40;
private final float DEFAULT_CHARGING_TIME=90;

public Vehicle(){
    this.id = DEFAULT_ID;
    this.autonomyDistance = DEFAULT_AUTONOMY_DISTANCE;
    this.averageVelocity = DEFAULT_AVERAGE_VELOCITY;
    this.chargingTime = DEFAULT_CHARGING_TIME;
}

public Vehicle(int id,float autonomyDistance,float averageVelocity,float chargingTime){
    this.id = id;
    this.autonomyDistance = autonomyDistance;
    this.averageVelocity = averageVelocity;
    this.chargingTime = chargingTime;

}

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public float getAutonomyDistance() {
        return autonomyDistance;
    }

    public void setAutonomyDistance(float autonomyDistance) {
        this.autonomyDistance = autonomyDistance;
    }

    public float getAverageVelocity() {
        return averageVelocity;
    }

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

    public float getChargingTime() {
        return chargingTime;
    }

    public void setChargingTime(float chargingTime) {
        this.chargingTime = chargingTime;
    }
}
