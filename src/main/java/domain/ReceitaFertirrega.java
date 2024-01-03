package domain;

import java.util.Objects;

/**
 * The type Receita fertirrega.
 */
public class ReceitaFertirrega implements DatabaseObject {
    private int id;
    private String nome;

    private final int DEFAULT_ID=-1;
    private final String DEFAULT_NAME ="(no name)";

    /**
     * Instantiates a new Receita fertirrega.
     */
    public ReceitaFertirrega(){
        this.id=DEFAULT_ID;
        this.nome = DEFAULT_NAME;
    }

    /**
     * Instantiates a new Receita fertirrega.
     *
     * @param id   the id
     * @param nome the nome
     */
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

    /**
     * Set id.
     *
     * @param id the id
     */
    public void setId(int id){
        this.id=id;
    }

    /**
     * Sets nome.
     *
     * @param nome the nome
     */
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
