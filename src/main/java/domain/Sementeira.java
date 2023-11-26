package domain;

public class Sementeira {
    private Integer parcelaId;
    private Integer variedadeTempId;
    private Float quantidade;
    private Float area;
    private Integer metodoExecucaoId;

    public Sementeira(Integer parcelaId, Integer variedadeTempId, Float quantidade, Float area, Integer metodoExecucaoId) {
        this.parcelaId = parcelaId;
        this.variedadeTempId = variedadeTempId;
        this.quantidade = setQuantidade(quantidade);
        this.area = setArea(area);
        this.metodoExecucaoId = metodoExecucaoId;
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


    public void setParcelaId(Integer parcelaId) {
        this.parcelaId = parcelaId;
    }

    public void setVariedadeTempId(Integer variedadeTempId) {
        this.variedadeTempId = variedadeTempId;
    }

    public float setQuantidade(Float quantidade) {

        if (quantidade < 0) {

            throw new IllegalArgumentException("Quantidade não pode ser negativa");

        } else if (quantidade == 0) {

            throw new IllegalArgumentException("Quantidade não pode ser zero");
        }
        return quantidade;
    }

    public float setArea(Float area) {

        if (area < 0) {

            throw new IllegalArgumentException("Area não pode ser negativa");

        } else if (area == 0) {

            throw new IllegalArgumentException("Area não pode ser zero");
        }
        return area;
    }

    public void setMetodoExecucaoId(Integer metodoExecucaoId) {
        this.metodoExecucaoId = metodoExecucaoId;
    }

    @Override
    public String toString() {

        final StringBuilder sb = new StringBuilder("Sementeira{");

        sb.append(", parcelaId=").append(parcelaId);
        sb.append(", variedadeTempId=").append(variedadeTempId);
        sb.append(", quantidade=").append(quantidade);
        sb.append(", area=").append(area);
        sb.append(", metodoExecucaoId=").append(metodoExecucaoId);
        sb.append('}');

        return sb.toString();
    }
}
