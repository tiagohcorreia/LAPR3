package watering_system_manager;
import java.text.SimpleDateFormat;
import java.util.*;

public class Rega {



    public static String calcularFimRega(Calendar inicioRega, int duracao) {
        Calendar fimRega = (Calendar) inicioRega.clone();
        fimRega.add(Calendar.MINUTE, duracao);
        SimpleDateFormat dateFormat = new SimpleDateFormat("HH:mm");
        return dateFormat.format(fimRega.getTime());
    }

    public static boolean isValidRegularidade(String value) {
        return value.matches("[TPI3]");
    }
}