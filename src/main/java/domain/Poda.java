package domain;



public class Poda {

    private Integer operacaoId;
    private Integer parcelaId;
    private Integer variedadeId;
    private Float quantidade;
    private Integer metodoExecucaoId;

    public Poda(Integer operacaoId, Integer parcelaId, Integer variedadeId, Float quantidade, Integer metodoExecucaoId) {
        this.operacaoId = operacaoId;
        this.parcelaId = parcelaId;
        this.variedadeId = variedadeId;
        this.quantidade= quantidade;
        this.metodoExecucaoId = metodoExecucaoId;
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

    public Integer getMetodoExecucaoId() {
        return metodoExecucaoId;
    }

    public Float getQuantidade() {
        return quantidade;
    }
}
