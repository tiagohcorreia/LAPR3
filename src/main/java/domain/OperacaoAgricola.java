package domain;

import java.util.Date;

public class OperacaoAgricola {

    private Integer operacaoId;
    private Date date;


    public OperacaoAgricola(Integer operacaoId, Date date) {
        this.operacaoId = operacaoId;
        this.date = date;
    }

    public Integer getOperacaoId() {
        return operacaoId;
    }

    public Date getDate() {
        return date;
    }

}
