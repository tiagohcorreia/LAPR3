package domain;

/**
 * The type Fator producao.
 */
public class FatorProducao implements DatabaseObject{

    private int id;
    private String nome;
    private int tipoId;
    private int formulacaoId;

    private final int DEFAULT_ID=-1;
    private final String DEFAULT_NAME="(no name)";
    private final int DEFAULT_ID_TYPE=-1;
    private final int DEFAULT_FORMULATION_ID=-1;

    /**
     * Instantiates a new Fator producao.
     */
    public FatorProducao(){
        this.id = DEFAULT_ID;
        this.nome = DEFAULT_NAME;
        this.tipoId = DEFAULT_ID_TYPE;
        this.formulacaoId = DEFAULT_FORMULATION_ID;
    }

    /**
     * Instantiates a new Fator producao.
     *
     * @param id           the id
     * @param nome         the nome
     * @param tipoId       the tipo id
     * @param formulacaoId the formulacao id
     */
    public FatorProducao(int id, String nome, int tipoId, int formulacaoId) {
        this.id = id;
        this.nome = nome;
        this.tipoId = tipoId;
        this.formulacaoId = formulacaoId;
    }

    public int getID() {
        return id;
    }

    public String getName() {
        return nome;
    }

    /**
     * Gets tipo id.
     *
     * @return the tipo id
     */
    public int getTipoId() {
        return tipoId;
    }

    /**
     * Gets formulacao id.
     *
     * @return the formulacao id
     */
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
