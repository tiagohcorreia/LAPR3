package domain;


import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class RegaTable {

    private Integer operacaoId;
    private String setor;
    private Integer duracao;
    private String hora;
    private Date data;

    public RegaTable(Date data,Integer operacaoId, String setor, Integer duracao, String hora) {
        this.data = data;
        this.operacaoId = operacaoId;
        this.setor = setor;
        this.duracao = duracao;
        this.hora = hora;
    }

    public Integer getOperacaoId() {
        return operacaoId;
    }

    public String  getSetor() {
        return setor;
    }

    public Integer getDuracao() {
        return duracao;
    }

    public String getHora() {
        return hora;
    }

    public Date getData(){return data;}

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


