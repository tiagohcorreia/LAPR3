package esinf.model;

import esinf.gps.GPS;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.*;

class RouteTest {

    @Test
    void testEquals() {

        Route<Local> r1=new Route<>();
        r1.getRoute().add(new Local("ct1", new GPS()));

        Route<Local> r2=new Route<>();
        r2.getRoute().add(new Local("ct1", new GPS()));

        Route<Local> r3=new Route<>();
        r3.getRoute().add(new Local("ct2", new GPS()));

        boolean result1=r1.equals(r2);
        boolean result2=r1.equals(r3);

        assertEquals(true, result1);
        assertEquals(false, result2);
    }
}