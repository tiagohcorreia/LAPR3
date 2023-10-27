package Class;
import java.text.SimpleDateFormat;
import java.util.*;

public class Rega {

    public static class RegaInstruction {
        private String regularidade;
        private String setor;
        private int duracao;

        public String getRegularidade() {
            return regularidade;
        }

        public String getSetor() {
            return setor;
        }

        public int getDuracao() {
            return duracao;
        }

        public RegaInstruction(String setor, int duracao, String regularidade) {
            this.setor = setor;
            this.duracao = duracao;
            this.regularidade = regularidade;
        }
    }

    public static List<Date> calcularDiasDeRega(Date dataInicial, String regularidade, int numeroDeDias) {
        List<Date> datasDeRega = new ArrayList<>();
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(dataInicial);

        if (regularidade.equals("T")) {
            for (int i = 0; i < numeroDeDias; i++) {
                datasDeRega.add(calendar.getTime());
                calendar.add(Calendar.DAY_OF_MONTH, 1);
            }
        } else if (regularidade.equals("I")) {
            for (int i = 0; i < numeroDeDias; i++) {

                if (calendar.get(Calendar.DAY_OF_MONTH) % 2 != 0) {
                    datasDeRega.add(calendar.getTime());
                }
                calendar.add(Calendar.DAY_OF_MONTH, 1);
            }
        } else if (regularidade.equals("P")) {
            for (int i = 0; i < numeroDeDias; i++) {
                if(calendar.get(Calendar.DAY_OF_MONTH) % 2 == 0){
                datasDeRega.add(calendar.getTime());}
                calendar.add(Calendar.DAY_OF_MONTH, 1);
            }
        } else if (regularidade.equals("3")) {
            for (int i = 0; i < numeroDeDias/3; i++) {
                datasDeRega.add(calendar.getTime());
                calendar.add(Calendar.DAY_OF_MONTH, 3);
            }
        }
        return datasDeRega;
    }

    public static String calcularFimRega(Calendar inicioRega, int duracao) {
        Calendar fimRega = (Calendar) inicioRega.clone();
        fimRega.add(Calendar.MINUTE, duracao);
        SimpleDateFormat dateFormat = new SimpleDateFormat("HH:mm");
        return dateFormat.format(fimRega.getTime());
    }
}
