import org.junit.jupiter.api.Test;
import ui.utils.Utils;

import java.time.ZoneId;
import java.util.Date;
import java.time.LocalDate;

public class RandomTests {

    @Test
    void test() {
    }

    public static void main(String[] args) {
        Date tmp=Utils.readDateFromConsole("input:");
        System.out.println(tmp.toInstant().atZone(ZoneId.systemDefault()).toLocalDate());
    }
}
