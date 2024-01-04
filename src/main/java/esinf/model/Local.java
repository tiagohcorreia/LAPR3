package esinf.model;

import esinf.gps.GPS;

import javax.sound.sampled.FloatControl;
import java.util.Comparator;
import java.util.Objects;
import java.util.function.Function;
import java.util.function.ToDoubleFunction;
import java.util.function.ToIntFunction;
import java.util.function.ToLongFunction;

/**
 * The type Local.
 */
public class Local implements Cloneable{

    private String localId;
    private GPS gps;

    final private String DEFAULT_LOCAL_ID="(no id)";
    final private GPS DEFAULT_GPS=new GPS();

    /**
     * Instantiates a new Local.
     */
    public Local(){
        localId=DEFAULT_LOCAL_ID;
        gps=DEFAULT_GPS;
    }

    /**
     * Instantiates a new Local.
     *
     * @param localId the local id
     * @param gps     the gps
     */
    public Local(String localId, GPS gps) {
        this.localId = localId;
        this.gps = gps;
    }

    /**
     * Gets local id.
     *
     * @return the local id
     */
    public String getLocalId() {
        return localId;
    }

    /**
     * Gets gps.
     *
     * @return the gps
     */
    public GPS getGps() {
        return gps;
    }

    /**
     * Sets local id.
     *
     * @param localId the local id
     */
    public void setLocalId(String localId) {
        this.localId = localId;
    }

    /**
     * Sets gps.
     *
     * @param gps the gps
     */
    public void setGps(GPS gps) {
        this.gps = gps;
    }

    /**
     * Get number of collaborators int.
     *
     * @return the int
     */
    public int getNumberOfCollaborators(){
        return Integer.parseInt(localId.substring(2));
    }


    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Local local = (Local) o;
        return Objects.equals(localId, local.localId)
                && Objects.equals(gps, local.gps);
    }



    @Override
    public int hashCode() {
        return Objects.hash(localId, gps);
    }

    @Override
    public String toString() {
        return "Local{" +
                "localId='" + localId + '\'' +
                ", gps=" + gps +
                "}\n";
    }

    @Override
    public Local clone() {
        try {
            Local clone = (Local) super.clone();
            return clone;
        } catch (CloneNotSupportedException e) {
            throw new AssertionError();
        }
    }
}
