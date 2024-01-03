package watering_system_manager;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * The type Rega.
 */
public class Rega {

    /**
     * Is valid regularidade boolean.
     *
     * @param value the value
     * @return the boolean
     */
    public static boolean isValidRegularidade(String value) {
        return value.matches("[TPI3]");
    }
}