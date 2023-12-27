package watering_system_manager;
import java.text.SimpleDateFormat;
import java.util.*;

public class Rega {

    public static boolean isValidRegularidade(String value) {
        return value.matches("[TPI3]");
    }
}