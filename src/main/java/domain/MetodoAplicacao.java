package domain;

import java.util.Objects;

public class MetodoAplicacao implements DatabaseObject{

    private int id;
    private String nome;

    public MetodoAplicacao(int id, String nome) {
        this.id = id;
        this.nome = nome;
    }

    @Override
    public int getID() {
        return id;
    }

    @Override
    public String getName() {
        return nome;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        MetodoAplicacao that = (MetodoAplicacao) o;
        return getID() == that.getID() && Objects.equals(getName(), that.getName());
    }

    @Override
    public int hashCode() {
        return Objects.hash(getID(), getName());
    }

    @Override
    public String toString() {
        return "MetodoAplicacao{" +
                "id=" + id +
                ", nome='" + nome + '\'' +
                '}';
    }
}
