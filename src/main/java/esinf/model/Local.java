package esinf.model;

import esinf.gps.GPS;

import javax.sound.sampled.FloatControl;
import java.util.Objects;

public class Local {
    final private GPS DEFAULT_GPS=new GPS();

    private String localId;
    private GPS gps;

    public Local(String localId) {
        this.localId = localId;
        this.gps = DEFAULT_GPS;
    }

    public Local(String localId, GPS gps) {
        this.localId = localId;
        this.gps = gps;
    }

    public String getLocalId() {
        return localId;
    }

    public GPS getGps() {
        return gps;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Local local = (Local) o;
        return Objects.equals(localId, local.localId) && Objects.equals(gps, local.gps);
    }

    @Override
    public int hashCode() {
        return Objects.hash(localId, gps);
    }

    @Override
    public String toString() {

        final StringBuilder sb = new StringBuilder("Local {");

        sb.append("localId='").append(localId).append('\'');
        sb.append(", gps=").append(gps);
        sb.append('}');
        return sb.toString();
    }
}
