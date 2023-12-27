package domain;

public class FatorProducao {

    private int id;
    private String nome;
    private int tipoId;
    private int formulacaoId;

    private final int DEFAULT_ID=-1;
    private final String DEFAULT_NAME="(no name)";
    private final int DEFAULT_ID_TYPE=-1;
    private final int DEFAULT_FORMULATION_ID=-1;

    public FatorProducao(){
        this.id = DEFAULT_ID;
        this.nome = DEFAULT_NAME;
        this.tipoId = DEFAULT_ID_TYPE;
        this.formulacaoId = DEFAULT_FORMULATION_ID;
    }

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
