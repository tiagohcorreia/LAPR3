package dataAccess.receitas_fertirrega;

import dataAccess.Repositories;
import org.junit.jupiter.api.Test;
import domain.ReceitaFertirrega;

class ReceitasFertirregaRepositoryTest {

    Repositories repo=Repositories.getInstance();

    @Test
    void getFertigationMixes() {
        for (ReceitaFertirrega m: repo.getReceitasFertirrega().getReceitas()){
            System.out.println(m);
        }
    }

    @Test
    void isThereMix() {
    }
}