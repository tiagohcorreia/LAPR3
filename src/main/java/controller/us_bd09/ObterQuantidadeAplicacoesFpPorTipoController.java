package controller.us_bd09;

import dataAccess.Repositories;
import domain.Parcela;

import java.sql.ResultSet;
import java.time.LocalDate;
import java.util.List;

/**
 * The type Obter quantidade aplicacoes fp por tipo controller.
 */
public class ObterQuantidadeAplicacoesFpPorTipoController {

    /**
     * The Repo.
     */
    Repositories repo = Repositories.getInstance();

    /**
     * Get query result set.
     *
     * @param dataInicio the data inicio
     * @param dataFim    the data fim
     * @return the result set
     */
    public ResultSet getQuery(LocalDate dataInicio,
                              LocalDate dataFim){
        return repo.getOthers().obterAplicacoesFpPorTipo(dataInicio, dataFim);
    }
}
