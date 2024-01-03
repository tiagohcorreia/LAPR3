package domain;

/**
 * The type Aplicacao fp.
 */
public class AplicacaoFP {

    private Integer operacaoId;
    private Integer parcelaId;
    private Integer variedadeId;
    private Integer fatorProducaoId;
    private Integer metodoExecucaoId;
    private Float quantidade;
    private Float area;

    /**
     * Instantiates a new Aplicacao fp.
     *
     * @param operacaoId       the operacao id
     * @param parcelaId        the parcela id
     * @param variedadeId      the variedade id
     * @param fatorProducaoId  the fator producao id
     * @param metodoExecucaoId the metodo execucao id
     * @param quantidade       the quantidade
     * @param area             the area
     */
    public AplicacaoFP(Integer operacaoId, Integer parcelaId, Integer variedadeId, Integer fatorProducaoId, Integer metodoExecucaoId, Float quantidade, Float area) {
        this.operacaoId = operacaoId;
        this.parcelaId = parcelaId;
        this.variedadeId = variedadeId;
        this.fatorProducaoId = fatorProducaoId;
        this.metodoExecucaoId = metodoExecucaoId;
        this.quantidade = quantidade;
        this.area = area;
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
     * Gets area.
     *
     * @return the area
     */
    public Float getArea() {
        return area;
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
