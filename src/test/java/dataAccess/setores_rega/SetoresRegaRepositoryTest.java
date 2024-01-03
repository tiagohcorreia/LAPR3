package dataAccess.setores_rega;

import dataAccess.Repositories;
import domain.SetorRega;
import org.junit.jupiter.api.Test;

import java.util.ArrayList;

import static org.junit.jupiter.api.Assertions.*;

class SetoresRegaRepositoryTest {

    Repositories repo=Repositories.getInstance();

    @Test
    void getSectors() {
        ArrayList<SetorRega> sectors=repo.getSetoresRega().getSetores();
        for (SetorRega s: sectors){
            System.out.printf("%s\n\n", s);
        }
    }

    @Test
    void isThereSector() {
        boolean out1=repo.getSetoresRega().isThereSector("Setor 10");
        boolean out2=repo.getSetoresRega().isThereSector("setor 10");
        boolean out3=repo.getSetoresRega().isThereSector("SEtor 10");
        boolean out4=repo.getSetoresRega().isThereSector("SETOR 10");

        assertEquals(true, out1);
        assertEquals(true, out2);
        assertEquals(true, out3);
        assertEquals(true, out4);

        boolean out5=repo.getSetoresRega().isThereSector("Setor10");
        boolean out6=repo.getSetoresRega().isThereSector("Setor 90");

        assertEquals(false, out5);
        assertEquals(false, out6);
    }
}