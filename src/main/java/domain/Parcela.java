package domain;

public class Parcela implements DatabaseObject{
    private int id;
    private String nome;
    private double area;

    public Parcela(int id, String nome, double area) {
        this.id = id;
        this.nome = nome;
        this.area = area;
    }

    public int getId() {
        return id;
    }

    public String getNome() {
        return nome;
    }

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
