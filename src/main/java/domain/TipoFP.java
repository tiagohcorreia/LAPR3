package domain;

public class TipoFP implements DatabaseObject{

    int id;
    String nome;

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

    public void setId(int id) {
        this.id = id;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public int getId() {
        return id;
    }

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
