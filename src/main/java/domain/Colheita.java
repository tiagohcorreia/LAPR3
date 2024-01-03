package domain;

import java.util.Date;

/**
 * The type Colheita.
 */
public class Colheita {

    private Integer operacaoId;
    private Integer parcelaId;
    private Integer produtoId;
    private Integer metodoExecucaoId;
    private Float quantidade;

    /**
     * Instantiates a new Colheita.
     *
     * @param operacaoId       the operacao id
     * @param parcelaId        the parcela id
     * @param produtoId        the produto id
     * @param metodoExecucaoId the metodo execucao id
     * @param quantidade       the quantidade
     */
    public Colheita(Integer operacaoId, Integer parcelaId, Integer produtoId, Integer metodoExecucaoId, Float quantidade) {
        this.operacaoId = operacaoId;
        this.parcelaId = parcelaId;
        this.produtoId = produtoId;
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
     * Gets produto id.
     *
     * @return the produto id
     */
    public Integer getProdutoId() {
        return produtoId;
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
