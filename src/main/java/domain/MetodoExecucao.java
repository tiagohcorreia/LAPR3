package domain;

/**
 * The type Metodo execucao.
 */
public class MetodoExecucao implements DatabaseObject{

    //INSERT INTO Metodo_Execucao(id, nome) VALUES (?, ?);

    private int id;
    private String nome;

    /**
     * Instantiates a new Metodo execucao.
     *
     * @param id   the id
     * @param nome the nome
     */
    public MetodoExecucao(int id, String nome) {
        this.id = id;
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

        final StringBuilder sb = new StringBuilder("MetodoExecucao: ");

        sb.append("Id: ").append(id);
        sb.append(", Nome='").append(nome).append('\'');

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
