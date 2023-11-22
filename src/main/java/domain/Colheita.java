package domain;

import java.util.Date;

public class Colheita {

    private Integer operacaoId;
    private Integer parcelaId;
    private Integer produtoId;
    private Integer metodoExecucaoId;
    private Float quantidade;

    public Colheita(Integer operacaoId, Integer parcelaId, Integer produtoId, Integer metodoExecucaoId, Float quantidade) {
        this.operacaoId = operacaoId;
        this.parcelaId = parcelaId;
        this.produtoId = produtoId;
        this.metodoExecucaoId = metodoExecucaoId;
        this.quantidade = quantidade;
    }

    public Integer getOperacaoId() {
        return operacaoId;
    }

    public Integer getParcelaId() {
        return parcelaId;
    }

    public Integer getProdutoId() {
        return produtoId;
    }

    public Integer getMetodoExecucaoId() {
        return metodoExecucaoId;
    }

    public Float getQuantidade() {
        return quantidade;
    }
}
