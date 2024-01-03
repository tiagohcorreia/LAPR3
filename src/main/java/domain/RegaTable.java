package domain;


import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

/**
 * The type Rega table.
 */
public class RegaTable {

    private Integer operacaoId;
    private String setor;
    private Integer duracao;
    private String hora;
    private Date data;

    /**
     * Gets mix.
     *
     * @return the mix
     */
    public String getMix() {
        return mix;
    }

    /**
     * Sets mix.
     *
     * @param mix the mix
     */
    public void setMix(String mix) {
        this.mix = mix;
    }

    private String mix;

    /**
     * Instantiates a new Rega table.
     *
     * @param data       the data
     * @param operacaoId the operacao id
     * @param setor      the setor
     * @param duracao    the duracao
     * @param hora       the hora
     * @param mix        the mix
     */
    public RegaTable(Date data,Integer operacaoId, String setor, Integer duracao, String hora,String mix) {
        this.data = data;
        this.operacaoId = operacaoId;
        this.setor = setor;
        this.duracao = duracao;
        this.hora = hora;
        this.mix = mix;
    }

    /**
     * Instantiates a new Rega table.
     *
     * @param data       the data
     * @param operacaoId the operacao id
     * @param setor      the setor
     * @param duracao    the duracao
     * @param hora       the hora
     */
    public RegaTable(Date data, Integer operacaoId, String setor, Integer duracao, String hora) {
        this(data, operacaoId, setor, duracao, hora, null);
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
     * Gets setor.
     *
     * @return the setor
     */
    public String  getSetor() {
        return setor;
    }

    /**
     * Gets duracao.
     *
     * @return the duracao
     */
    public Integer getDuracao() {
        return duracao;
    }

    /**
     * Gets hora.
     *
     * @return the hora
     */
    public String getHora() {
        return hora;
    }

    /**
     * Get data date.
     *
     * @return the date
     */
    public Date getData(){return data;}

    /**
     * Gets end time.
     *
     * @return the end time
     */
    public String getEndTime() {
        try {
            SimpleDateFormat timeFormat = new SimpleDateFormat("HH:mm");
            Calendar calendar = Calendar.getInstance();
            calendar.setTime(data);


            Date startTime = timeFormat.parse(hora);

            int startHour = startTime.getHours();
            int startMinute = startTime.getMinutes();

            calendar.set(Calendar.HOUR_OF_DAY, startHour);
            calendar.set(Calendar.MINUTE, startMinute);
            calendar.add(Calendar.MINUTE, duracao);
            SimpleDateFormat dateTimeFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm");
            return dateTimeFormat.format(calendar.getTime());

        } catch (ParseException e) {
            e.printStackTrace();
            return null;
        }
    }
}


