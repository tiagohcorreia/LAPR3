package watering_system_manager;

import org.junit.jupiter.api.Test;

import java.time.LocalDate;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;

import static org.junit.jupiter.api.Assertions.*;

class WateringSystemManagerTest {

    @Test
    void test(){
        LocalDate date=LocalDate.parse("2023-03-02", DateTimeFormatter.ISO_LOCAL_DATE);
        System.out.println(date);
        LocalTime time=LocalTime.parse("23:00", DateTimeFormatter.ISO_LOCAL_TIME);
        System.out.println(time);

        System.out.println(LocalTime.of(3, 30).minusMinutes(LocalTime.now().getMinute()));
    }
}