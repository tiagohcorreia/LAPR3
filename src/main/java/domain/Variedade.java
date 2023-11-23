package domain;

public class Variedade {

    private int id;
    private String nome;
    private int culturaId;

    public Variedade(int id, String nome, int culturaId) {
        this.id = id;
        this.nome = nome;
        this.culturaId = culturaId;
    }

    public int getId() {
        return id;
    }

    public String getNome() {
        return nome;
    }

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
}
