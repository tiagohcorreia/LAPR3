package domain;

/**
 * The type Tipo fp.
 */
public class TipoFP implements DatabaseObject{

    /**
     * The Id.
     */
    int id;
    /**
     * The Nome.
     */
    String nome;

    /**
     * Instantiates a new Tipo fp.
     *
     * @param id   the id
     * @param nome the nome
     */
    public TipoFP(int id, String nome) {
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
     * Gets id.
     *
     * @return the id
     */
    public int getId() {
        return id;
    }

    /**
     * Gets nome.
     *
     * @return the nome
     */
    public String getNome() {
        return nome;
    }

    @Override
    public String toString() {
        return "TipoFP{" +
                "id=" + id +
                ", nome='" + nome + '\'' +
                '}';
    }
}
