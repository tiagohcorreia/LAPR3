package domain;

/**
 * The type Monda.
 */
public class Monda {

    private Integer operacaoId;
    private Integer parcelaId;
    private Integer variedadeId;
    private Integer fatorProducaoId;
    private Integer metodoExecucaoId;
    private Float quantidade;

    /**
     * Instantiates a new Monda.
     *
     * @param operacaoId       the operacao id
     * @param parcelaId        the parcela id
     * @param variedadeId      the variedade id
     * @param fatorProducaoId  the fator producao id
     * @param metodoExecucaoId the metodo execucao id
     * @param quantidade       the quantidade
     */
    public Monda(Integer operacaoId, Integer parcelaId, Integer variedadeId,Integer fatorProducaoId, Integer metodoExecucaoId, Float quantidade) {
        this.operacaoId = operacaoId;
        this.parcelaId = parcelaId;
        this.variedadeId = variedadeId;
        this.fatorProducaoId = fatorProducaoId;
        this.metodoExecucaoId = metodoExecucaoId;
        this.quantidade = quantidade;
    }

    /**
     * Gets operacao id.
     *
     * @return the operacao id
     */
    public Integer getOperacaoId() {
        return operacaoId;
    }

    /**
     * Gets parcela id.
     *
     * @return the parcela id
     */
    public Integer getParcelaId() {
        return parcelaId;
    }

    /**
     * Gets variedade id.
     *
     * @return the variedade id
     */
    public Integer getVariedadeId() {
        return variedadeId;
    }

    /**
     * Gets fator producao id.
     *
     * @return the fator producao id
     */
    public Integer getFatorProducaoId() {
        return fatorProducaoId;
    }

    /**
     * Gets metodo execucao id.
     *
     * @return the metodo execucao id
     */
    public Integer getMetodoExecucaoId() {
        return metodoExecucaoId;
    }

    /**
     * Gets quantidade.
     *
     * @return the quantidade
     */
    public Float getQuantidade() {
        return quantidade;
    }



}
