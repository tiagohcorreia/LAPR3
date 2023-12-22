package esinf.model;

import esinf.gps.GPS;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.*;

class PathTest {

    @Test
    void testEquals() {

        Path<Local> r1=new Path<>();
        r1.getRoute().add(new Local("ct1", new GPS()));

        Path<Local> r2=new Path<>();
        r2.getRoute().add(new Local("ct1", new GPS()));

        Path<Local> r3=new Path<>();
        r3.getRoute().add(new Local("ct2", new GPS()));

        boolean result1=r1.equals(r2);
        boolean result2=r1.equals(r3);

        assertEquals(true, result1);
        assertEquals(false, result2);
    }
}