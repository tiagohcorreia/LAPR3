package domain;


/**
 * The type Poda.
 */
public class Poda {

    private Integer operacaoId;
    private Integer parcelaId;
    private Integer variedadeId;
    private Float quantidade;
    private Integer metodoExecucaoId;

    /**
     * Instantiates a new Poda.
     *
     * @param operacaoId       the operacao id
     * @param parcelaId        the parcela id
     * @param variedadeId      the variedade id
     * @param quantidade       the quantidade
     * @param metodoExecucaoId the metodo execucao id
     */
    public Poda(Integer operacaoId, Integer parcelaId, Integer variedadeId, Float quantidade, Integer metodoExecucaoId) {
        this.operacaoId = operacaoId;
        this.parcelaId = parcelaId;
        this.variedadeId = variedadeId;
        this.quantidade= quantidade;
        this.metodoExecucaoId = metodoExecucaoId;
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
