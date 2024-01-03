package domain;

import java.util.Objects;

public class ReceitaFertirrega implements DatabaseObject {
    private int id;
    private String nome;

    private final int DEFAULT_ID=-1;
    private final String DEFAULT_NAME ="(no name)";

    public ReceitaFertirrega(){
        this.id=DEFAULT_ID;
        this.nome = DEFAULT_NAME;
    }

    public ReceitaFertirrega(int id, String nome) {
        this.id=id;
        this.nome = nome;
    }

    public int getID(){
        return id;
    }
    public String getName() {
        return nome;
    }

    public void setId(int id){
        this.id=id;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        ReceitaFertirrega that = (ReceitaFertirrega) o;
        return getID() == that.getID() && Objects.equals(getName(), that.getName());
    }

    @Override
    public int hashCode() {
        return Objects.hash(getID(), getName());
    }

    @Override
    public String toString() {
        return "FertigationMix{" +
                "id=" + id +
                ", name='" + nome + '\'' +
                '}';
    }
}
