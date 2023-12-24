package esinf.dataStructure;

import esinf.gps.GPS;
import esinf.model.Local;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.*;

class VertexMetricsTest {

    @Test
    void testToString() {
        VertexMetrics<Local, Integer> v=new VertexMetrics<>(new Local("ct10", new GPS()),
                1, 1, 1);

        System.out.println(v);
    }
}