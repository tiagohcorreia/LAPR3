package dataAccess.fertigation_mixes;

import dataAccess.Repositories;
import org.junit.jupiter.api.Test;
import domain.FertigationMix;

class FertigationMixesRepositoryTest {

    Repositories repo=Repositories.getInstance();

    @Test
    void getFertigationMixes() {
        for (FertigationMix m: repo.getFertigationMixes().getFertigationMixes()){
            System.out.println(m);
        }
    }

    @Test
    void isThereMix() {
    }
}