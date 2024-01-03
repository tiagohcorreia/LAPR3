package controller.us_bd17;

import dataAccess.Repositories;
import domain.Parcela;

import java.sql.ResultSet;
import java.time.LocalDate;
import java.util.List;

/**
 * The type Obter fp aplicados controller.
 */
public class ObterFPAplicadosController {

    /**
     * The Repo.
     */
    Repositories repo=Repositories.getInstance();

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
     * @param parcelaID    the parcela id
     * @param dataInferior the data inferior
     * @param dataSuperior the data superior
     * @return the result set
     */
    public ResultSet getQuery(int parcelaID,
                              LocalDate dataInferior,
                              LocalDate dataSuperior){
        return repo.getOthers().obterFatoresProducaoAplicados(parcelaID, dataInferior, dataSuperior);
    }
}
