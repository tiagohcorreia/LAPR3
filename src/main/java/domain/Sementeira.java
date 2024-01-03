package domain;

/**
 * The type Sementeira.
 */
public class Sementeira {
    private Integer operacaoId;
    private Integer parcelaId;
    private Integer variedadeTempId;
    private Float quantidade;
    private Float area;
    private Integer metodoExecucaoId;

    /**
     * Instantiates a new Sementeira.
     *
     * @param operacaoId       the operacao id
     * @param parcelaId        the parcela id
     * @param variedadeTempId  the variedade temp id
     * @param quantidade       the quantidade
     * @param area             the area
     * @param metodoExecucaoId the metodo execucao id
     */
    public Sementeira(Integer operacaoId,Integer parcelaId, Integer variedadeTempId, Float quantidade, Float area, Integer metodoExecucaoId) {
        this.operacaoId = operacaoId;
        this.parcelaId = parcelaId;
        this.variedadeTempId = variedadeTempId;
        this.quantidade = setQuantidade(quantidade);
        this.area = setArea(area);
        this.metodoExecucaoId = metodoExecucaoId;
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
     * Gets variedade temp id.
     *
     * @return the variedade temp id
     */
    public Integer getVariedadeTempId() {
        return variedadeTempId;
    }

    /**
     * Gets quantidade.
     *
     * @return the quantidade
     */
    public Float getQuantidade() {
        return quantidade;
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
     * Gets metodo execucao id.
     *
     * @return the metodo execucao id
     */
    public Integer getMetodoExecucaoId() {
        return metodoExecucaoId;
    }


    /**
     * Sets parcela id.
     *
     * @param parcelaId the parcela id
     */
    public void setParcelaId(Integer parcelaId) {
        this.parcelaId = parcelaId;
    }

    /**
     * Sets variedade temp id.
     *
     * @param variedadeTempId the variedade temp id
     */
    public void setVariedadeTempId(Integer variedadeTempId) {
        this.variedadeTempId = variedadeTempId;
    }

    /**
     * Sets quantidade.
     *
     * @param quantidade the quantidade
     * @return the quantidade
     */
    public float setQuantidade(Float quantidade) {

        if (quantidade < 0) {

            throw new IllegalArgumentException("Quantidade não pode ser negativa");

        } else if (quantidade == 0) {

            throw new IllegalArgumentException("Quantidade não pode ser zero");
        }
        return quantidade;
    }

    /**
     * Sets area.
     *
     * @param area the area
     * @return the area
     */
    public float setArea(Float area) {

        if (area < 0) {

            throw new IllegalArgumentException("Area não pode ser negativa");

        } else if (area == 0) {

            throw new IllegalArgumentException("Area não pode ser zero");
        }
        return area;
    }

    /**
     * Sets metodo execucao id.
     *
     * @param metodoExecucaoId the metodo execucao id
     */
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
