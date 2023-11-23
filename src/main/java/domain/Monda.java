package domain;

public class Monda {

    private Integer operacaoId;
    private Integer parcelaId;
    private Integer variedadeId;
    private Integer fatorProducaoId;
    private Integer metodoExecucaoId;
    private Float quantidade;

    public Monda(Integer operacaoId, Integer parcelaId, Integer variedadeId,Integer fatorProducaoId, Integer metodoExecucaoId, Float quantidade) {
        this.operacaoId = operacaoId;
        this.parcelaId = parcelaId;
        this.variedadeId = variedadeId;
        this.fatorProducaoId = fatorProducaoId;
        this.metodoExecucaoId = metodoExecucaoId;
        this.quantidade = quantidade;
    }

    public Integer getOperacaoId() {
        return operacaoId;
    }

    public Integer getParcelaId() {
        return parcelaId;
    }

    public Integer getVariedadeId() {
        return variedadeId;
    }

    public Integer getFatorProducaoId() {
        return fatorProducaoId;
    }

    public Integer getMetodoExecucaoId() {
        return metodoExecucaoId;
    }

    public Float getQuantidade() {
        return quantidade;
    }



}
