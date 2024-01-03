package esinf.dataStructure;

import esinf.model.Local;

import java.util.Objects;

/**
 * The type Distance.
 */
public class Distance {

    private Local local1;
    private Local local2;
    private double lenght;

    /**
     * Instantiates a new Distance.
     *
     * @param local1 the local 1
     * @param local2 the local 2
     * @param lenght the lenght
     */
    public Distance(Local local1, Local local2, double lenght) {
        this.local1 = local1;
        this.local2 = local2;
        this.lenght = lenght;
    }

    /**
     * Gets local 1.
     *
     * @return the local 1
     */
    public Local getLocal1() {
        return local1;
    }

    /**
     * Gets local 2.
     *
     * @return the local 2
     */
    public Local getLocal2() {
        return local2;
    }

    /**
     * Gets lenght.
     *
     * @return the lenght
     */
    public double getLenght() {
        return lenght;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Distance distance = (Distance) o;
        return lenght == distance.lenght && Objects.equals(local1, distance.local1) && Objects.equals(local2, distance.local2);
    }

    @Override
    public int hashCode() {
        return Objects.hash(local1, local2, lenght);
    }

    @Override
    public String toString() {

        final StringBuilder sb = new StringBuilder("Distance {");

        sb.append("local1=").append(local1);
        sb.append(", local2=").append(local2);
        sb.append(", lenght=").append(lenght);
        sb.append('}');
        return sb.toString();
    }
}
