package domain;

import java.util.Objects;

/**
 * The type Produto.
 */
public class Produto implements DatabaseObject{

    private int id;
    private String nome;
    private int variedade_id;

    /**
     * Instantiates a new Produto.
     *
     * @param id           the id
     * @param nome         the nome
     * @param variedade_id the variedade id
     */
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

    /**
     * Gets variedade id.
     *
     * @return the variedade id
     */
    public int getVariedade_id() {
        return variedade_id;
    }

    /**
     * Sets id.
     *
     * @param id the id
     */
    public void setId(int id) {
        this.id = id;
    }

    /**
     * Sets nome.
     *
     * @param nome the nome
     */
    public void setNome(String nome) {
        this.nome = nome;
    }

    /**
     * Sets variedade id.
     *
     * @param variedade_id the variedade id
     */
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
