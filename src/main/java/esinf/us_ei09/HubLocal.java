package esinf.us_ei09;

import esinf.model.Local;

import java.util.Set;

/**
 * The type Hub local.
 */
public class HubLocal {

    private Local hub;
    private Set<Local> cluster;

    /**
     * Instantiates a new Hub local.
     *
     * @param hub      the hub
     * @param localSet the local set
     */
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
