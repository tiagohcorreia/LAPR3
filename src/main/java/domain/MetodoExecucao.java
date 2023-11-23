package domain;

public class MetodoExecucao {

    //INSERT INTO Metodo_Execucao(id, nome) VALUES (?, ?);

    private int id;
    private String nome;

    public MetodoExecucao(int id, String nome) {
        this.id = id;
        nome = nome;
    }

    public int getId() {
        return id;
    }

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
}
