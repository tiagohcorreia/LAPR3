package domain;

public class Sementeira {

    private Integer operacaoId;
    private Integer parcelaId;
    private Integer variedadeTempId;
    private Float quantidade;
    private Float area;
    private Integer metodoExecucaoId;

    public Sementeira(Integer operacaoId, Integer parcelaId, Integer variedadeTempId, Float quantidade, Float area, Integer metodoExecucaoId) {
        this.operacaoId = operacaoId;
        this.parcelaId = parcelaId;
        this.variedadeTempId = variedadeTempId;
        this.quantidade = quantidade;
        this.area = area;
        this.metodoExecucaoId = metodoExecucaoId;
    }

    public Integer getOperacaoId() {
        return operacaoId;
    }

    public Integer getParcelaId() {
        return parcelaId;
    }

    public Integer getVariedadeTempId() {
        return variedadeTempId;
    }

    public Float getQuantidade() {
        return quantidade;
    }

    public Float getArea() {
        return area;
    }

    public Integer getMetodoExecucaoId() {
        return metodoExecucaoId;
    }
}
