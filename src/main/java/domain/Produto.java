package domain;

import java.util.Objects;

public class Produto implements DatabaseObject{

    private int id;
    private String nome;
    private int variedade_id;

    public Produto(int id, String nome, int variedade_id) {
        this.id = id;
        this.nome = nome;
        this.variedade_id = variedade_id;
    }

    @Override
    public int getID() {
        return id;
    }

    @Override
    public String getName() {
        return nome;
    }

    public int getVariedade_id() {
        return variedade_id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public void setVariedade_id(int variedade_id) {
        this.variedade_id = variedade_id;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Produto produto = (Produto) o;
        return id == produto.id && getVariedade_id() == produto.getVariedade_id() && Objects.equals(nome, produto.nome);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, nome, getVariedade_id());
    }

    @Override
    public String toString() {
        return "Produto{" +
                "id=" + id +
                ", nome='" + nome + '\'' +
                ", variedade_id=" + variedade_id +
                '}';
    }
}
