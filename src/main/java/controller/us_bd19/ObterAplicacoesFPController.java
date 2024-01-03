package controller.us_bd19;

import dataAccess.Repositories;
import domain.Parcela;
import domain.TipoFP;

import java.sql.ResultSet;
import java.time.LocalDate;
import java.util.List;

/**
 * The type Obter aplicacoes fp controller.
 */
public class ObterAplicacoesFPController {

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
     * Obter tipos fp list.
     *
     * @return the list
     */
    public List<TipoFP> obterTiposFP(){
        return repo.getTiposFP().obterTiposFP();
    }

    /**
     * Get query result set.
     *
     * @param parcelaID    the parcela id
     * @param dataInferior the data inferior
     * @param dataSuperior the data superior
     * @param tipoFpId     the tipo fp id
     * @return the result set
     */
    public ResultSet getQuery(int parcelaID,
                              LocalDate dataInferior,
                              LocalDate dataSuperior,
                              int tipoFpId){
        return repo.getOthers().obterAplicacoesFP(parcelaID, dataInferior, dataSuperior, tipoFpId);
    }
}
