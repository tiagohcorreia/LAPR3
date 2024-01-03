package domain;

/**
 * The type Parcela.
 */
public class Parcela implements DatabaseObject{
    private int id;
    private String nome;
    private double area;

    /**
     * Instantiates a new Parcela.
     *
     * @param id   the id
     * @param nome the nome
     * @param area the area
     */
    public Parcela(int id, String nome, double area) {
        this.id = id;
        this.nome = nome;
        this.area = area;
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
     * Gets area.
     *
     * @return the area
     */
    public double getArea() {
        return area;
    }

    @Override
    public String toString() {

        final StringBuilder sb = new StringBuilder("Parcela: ");

        sb.append("Id: ").append(id);
        sb.append(", Nome: '").append(nome).append('\'');
        sb.append(", Area: ").append(area);

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
