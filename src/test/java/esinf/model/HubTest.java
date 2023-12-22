package esinf.model;

import esinf.gps.GPS;
import esinf.model.Schedule;
import org.junit.jupiter.api.Test;

import java.time.LocalTime;

import static org.junit.jupiter.api.Assertions.*;

class HubTest {

    @Test
    void testScheduleGenerator(){
        Hub hub1=new Hub("ct1", new GPS(), 0);
        Hub hub2=new Hub("ct20", new GPS(), 0);
        Hub hub3=new Hub("ct105", new GPS(), 0);

        Hub hub4=new Hub("ct106", new GPS(), 0);
        Hub hub5=new Hub("ct150", new GPS(), 0);
        Hub hub6=new Hub("ct215", new GPS(), 0);

        Hub hub7=new Hub("ct216", new GPS(), 0);
        Hub hub8=new Hub("ct300", new GPS(), 0);

        Schedule s1 = new Schedule(LocalTime.of(9, 0), LocalTime.of(14, 0));
        Schedule s2 = new Schedule(LocalTime.of(11, 0), LocalTime.of(16, 0));
        Schedule s3 = new Schedule(LocalTime.of(12, 0), LocalTime.of(17, 0));

        assertEquals(s1, hub1.getSchedule());
        assertEquals(s1, hub2.getSchedule());
        assertEquals(s1, hub3.getSchedule());

        assertEquals(s2, hub4.getSchedule());
        assertEquals(s2, hub5.getSchedule());
        assertEquals(s2, hub6.getSchedule());

        assertEquals(s3, hub7.getSchedule());
        assertEquals(s3, hub8.getSchedule());
    }

    @Test
    void testClone(){
        Hub original=new Hub("ct12", new GPS(), 0);
        Hub clone=original.clone();

        System.out.println(clone);

        assertEquals(original, clone);

        clone.setDischargeTime(1);

        assertNotEquals(original, clone);
    }

}