package esinf.us_ei09;

import esinf.model.Hub;
import esinf.model.Local;

import java.util.Set;

public class HubLocal {

    private Local hub;
    private Set<Local> cluster;

    public HubLocal(Local hub, Set<Local> localSet) {
        this.hub = hub;
        this.cluster = localSet;
    }

    @Override
    public String toString() {

        final StringBuilder sb = new StringBuilder("Cluster: ");

        sb.append("Hub: ").append(hub);
        sb.append(", Lista de Locais: \n").append(cluster);

        return sb.toString();
    }
}
