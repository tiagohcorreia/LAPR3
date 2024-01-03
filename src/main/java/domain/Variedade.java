package domain;

/**
 * The type Variedade.
 */
public class Variedade implements DatabaseObject{

    private int id;
    private String nome;
    private int culturaId;

    /**
     * Instantiates a new Variedade.
     *
     * @param id        the id
     * @param nome      the nome
     * @param culturaId the cultura id
     */
    public Variedade(int id, String nome, int culturaId) {
        this.id = id;
        this.nome = nome;
        this.culturaId = culturaId;
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

    /**
     * Gets cultura id.
     *
     * @return the cultura id
     */
    public int getCulturaId() {
        return culturaId;
    }

    @Override
    public String toString() {

        final StringBuilder sb = new StringBuilder("Variedade: ");

        sb.append("Id: ").append(id);
        sb.append(", Nome:'").append(nome).append('\'');
        sb.append(", Id Cultura: ").append(culturaId);

        return sb.toString();
    }

    @Override
    public int getID() {
        return id;
    }

    @Override
    public String getName() {
        return nome;
    }
}
