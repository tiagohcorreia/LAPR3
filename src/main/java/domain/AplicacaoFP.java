package domain;

public class AplicacaoFP {

        private Integer operacaoId;
        private Integer parcelaId;
        private Integer variedadeId;
        private Integer fatorProducaoId;
        private Integer metodoExecucaoId;
        private Float quantidade;
        private Float area;

        public AplicacaoFP(Integer operacaoId, Integer parcelaId, Integer variedadeId,Integer fatorProducaoId, Integer metodoExecucaoId, Float quantidade,Float area) {
            this.operacaoId = operacaoId;
            this.parcelaId = parcelaId;
            this.variedadeId = variedadeId;
            this.fatorProducaoId = fatorProducaoId;
            this.metodoExecucaoId = metodoExecucaoId;
            this.quantidade = quantidade;
            this.area = area;
        }

        public Integer getOperacaoId() {
            return operacaoId;
        }

    public Integer getVariedadeId() {
        return variedadeId;
    }

    public Integer getFatorProducaoId() {
        return fatorProducaoId;
    }

    public Float getArea() {
        return area;
    }

    public Integer getParcelaId() {
            return parcelaId;
        }



        public Integer getMetodoExecucaoId() {
            return metodoExecucaoId;
        }

        public Float getQuantidade() {
            return quantidade;
        }
}
