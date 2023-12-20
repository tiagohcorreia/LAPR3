package esinf.model;

import esinf.gps.GPS;

import javax.sound.sampled.FloatControl;
import java.util.Comparator;
import java.util.Objects;
import java.util.function.Function;
import java.util.function.ToDoubleFunction;
import java.util.function.ToIntFunction;
import java.util.function.ToLongFunction;

public class Local  {

    private String localId;
    private GPS gps;

    final private String DEFAULT_LOCAL_ID="(no id)";
    final private GPS DEFAULT_GPS=new GPS();

    public Local(){
        localId=DEFAULT_LOCAL_ID;
        gps=DEFAULT_GPS;
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
}
