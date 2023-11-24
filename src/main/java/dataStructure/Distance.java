package dataStructure;

import esinf.model.Local;

import java.util.Objects;

public class Distance {

    private Local local1;
    private Local local2;
    private double lenght;

    public Distance(Local local1, Local local2, double lenght) {
        this.local1 = local1;
        this.local2 = local2;
        this.lenght = lenght;
    }

    public Local getLocal1() {
        return local1;
    }

    public Local getLocal2() {
        return local2;
    }

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
