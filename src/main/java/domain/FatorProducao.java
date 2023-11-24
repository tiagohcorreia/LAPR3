package domain;

public class FatorProducao {

    //INSERT INTO Fator_Producao(id, nome, tipo_id, formulacao_id) VALUES (?, ?, ?, ?);
    private int id;
    private String nome;
    private int tipoId;
    private int formulacaoId;

    public FatorProducao(int id, String nome, int tipoId, int formulacaoId) {
        this.id = id;
        this.nome = nome;
        this.tipoId = tipoId;
        this.formulacaoId = formulacaoId;
    }

    public int getId() {
        return id;
    }

    public String getNome() {
        return nome;
    }

    public int getTipoId() {
        return tipoId;
    }

    public int getFormulacaoId() {
        return formulacaoId;
    }

    @Override
    public String toString() {
        return "FatorProducao{" +
                "id=" + id +
                ", nome='" + nome + '\'' +
                ", tipoId=" + tipoId +
                ", formulacaoId=" + formulacaoId +
                '}';
    }
}
