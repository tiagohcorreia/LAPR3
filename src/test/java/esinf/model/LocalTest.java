package esinf.model;

import esinf.gps.GPS;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.*;

class LocalTest {

    @Test
    void getNumberOfCollaborators() {

        Local l1=new Local("ct1", new GPS());
        Local l2=new Local("ct11", new GPS());
        Local l3=new Local("ct111", new GPS());

        int r1=l1.getNumberOfCollaborators();
        int r2=l2.getNumberOfCollaborators();
        int r3=l3.getNumberOfCollaborators();

        assertEquals(1, r1);
        assertEquals(11, r2);
        assertEquals(111, r3);
    }

    @Test
    void testClone(){
        Local original=new Local("ct12", new GPS());
        Local clone=original.clone();

        assertEquals(original, clone);

        clone.setLocalId("ct15");

        assertNotEquals(original, clone);
    }
}