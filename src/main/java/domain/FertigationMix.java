package domain;

import java.util.Objects;

public class FertigationMix {
    private int id;
    private String name;

    private final int DEFAULT_ID=-1;
    private final String DEFAULT_NAME ="(no name)";

    public FertigationMix(){
        this.id=DEFAULT_ID;
        this.name = DEFAULT_NAME;
    }

    public FertigationMix(int id, String name) {
        this.id=id;
        this.name = name;
    }

    public int getId(){
        return id;
    }
    public String getName() {
        return name;
    }

    public void setId(int id){
        this.id=id;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        FertigationMix that = (FertigationMix) o;
        return getId() == that.getId() && Objects.equals(getName(), that.getName());
    }

    @Override
    public int hashCode() {
        return Objects.hash(getId(), getName());
    }

    @Override
    public String toString() {
        return "FertigationMix{" +
                "id=" + id +
                ", name='" + name + '\'' +
                '}';
    }
}
