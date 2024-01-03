package controller.us_bd06;

import dataAccess.Repositories;
import domain.Parcela;

import java.sql.ResultSet;
import java.time.LocalDate;
import java.util.List;

/**
 * The type Obter quantidade fp por tipo controller.
 */
public class ObterQuantidadeFpPorTipoController {

    /**
     * The Repo.
     */
    Repositories repo = Repositories.getInstance();

    /**
     * Obter parcelas list.
     *
     * @return the list
     */
    public List<Parcela> obterParcelas(){
        return repo.getParcelaRepository().getParcelas();
    }

    /**
     * Get query result set.
     *
     * @param parcelaId  the parcela id
     * @param dataInicio the data inicio
     * @param dataFim    the data fim
     * @return the result set
     */
    public ResultSet getQuery(int parcelaId,
                              LocalDate dataInicio,
                              LocalDate dataFim){
        return repo.getOthers().obterFpPorTipo(parcelaId, dataInicio, dataFim);
    }
}
