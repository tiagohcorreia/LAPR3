import org.junit.jupiter.api.Test;
import ui.utils.Utils;

import java.sql.Date;
import java.time.LocalDate;

public class RandomTests {

    @Test
    void test() {
    }

    public static void main(String[] args) {
        LocalDate d=Utils.getLocalDateFromConsole("teste:", "yyyy-MM-dd");
        System.out.println(Date.valueOf(d));;

    }
}
