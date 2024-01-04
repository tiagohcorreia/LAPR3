package domain;

import java.util.Date;

/**
 * The type Operacao agricola.
 */
public class OperacaoAgricola {

    private Integer operacaoId;
    private Date date;


    /**
     * Instantiates a new Operacao agricola.
     *
     * @param operacaoId the operacao id
     * @param date       the date
     */
    public OperacaoAgricola(Integer operacaoId, Date date) {
        this.operacaoId = operacaoId;
        this.date = date;
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
     * Gets date.
     *
     * @return the date
     */
    public Date getDate() {
        return date;
    }

}
