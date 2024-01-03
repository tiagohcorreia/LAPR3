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
        java.sql.Date date=java.sql.Date.valueOf(LocalDate.now());
        System.out.println(date);
    }
}
