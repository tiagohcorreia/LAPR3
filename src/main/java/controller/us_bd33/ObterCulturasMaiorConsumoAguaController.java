package controller.us_bd33;

import dataAccess.Repositories;

import java.sql.ResultSet;
import java.time.LocalDate;

public class ObterCulturasMaiorConsumoAguaController {

    Repositories repo = Repositories.getInstance();

    public ResultSet getQuery(int ano){
        return repo.getOthers().obterCulturasComMaiorConsumoAgua(ano);
    }
}
