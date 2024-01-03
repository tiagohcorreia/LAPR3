package controller.us_bd09;

import dataAccess.Repositories;
import domain.Parcela;

import java.sql.ResultSet;
import java.time.LocalDate;
import java.util.List;

public class ObterQuantidadeAplicacoesFpPorTipoController {

    Repositories repo = Repositories.getInstance();

    public ResultSet getQuery(LocalDate dataInicio,
                              LocalDate dataFim){
        return repo.getOthers().obterAplicacoesFpPorTipo(dataInicio, dataFim);
    }
}
