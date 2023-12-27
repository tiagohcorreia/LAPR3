package domain;

import java.util.Objects;

public class Unit {

    private String unit;

    private final String DEFAULT_UNIT="(no unit)";

    public Unit(){
        this.unit=DEFAULT_UNIT;
    }

    public Unit(String unit) {
        this.unit = unit;
    }

    public String getUnit() {
        return unit;
    }

    public void setUnit(String unit) {
        this.unit = unit;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Unit unit1 = (Unit) o;
        return Objects.equals(getUnit(), unit1.getUnit());
    }

    @Override
    public int hashCode() {
        return Objects.hash(getUnit());
    }

    @Override
    public String toString() {
        return "Unit{" +
                "unit='" + unit + '\'' +
                '}';
    }
}
