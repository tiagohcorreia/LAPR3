package controller.us_bd20;

import dataAccess.Repositories;
import domain.Parcela;
import domain.TipoFP;

import java.sql.ResultSet;
import java.time.LocalDate;
import java.util.List;

/**
 * The type Obter totais mensais rega controller.
 */
public class ObterTotaisMensaisRegaController {

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
     * @param dataInferior the data inferior
     * @param dataSuperior the data superior
     * @return the result set
     */
    public ResultSet getQuery(LocalDate dataInferior,
                              LocalDate dataSuperior){
        return repo.getOthers().obterTotaisMensaisRega(dataInferior, dataSuperior);
    }
}
