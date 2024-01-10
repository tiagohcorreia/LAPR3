package controller.us_bd34;

import dataAccess.Repositories;

import java.sql.ResultSet;

public class ObterCompostosNaoNesseAnoController {

    Repositories repo = Repositories.getInstance();

    public ResultSet getQuery(int ano){
        return repo.getOthers().obterCompostosQuimicosUsadosNaoNesseAno(ano);
    }
}
