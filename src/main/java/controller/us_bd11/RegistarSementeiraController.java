package controller.us_bd11;

import dataAccess.Repositories;
import domain.MetodoExecucao;
import domain.Parcela;
import domain.Variedade;

import java.time.LocalDate;
import java.util.List;

/**
 * The type Registar sementeira controller.
 */
public class RegistarSementeiraController {

    /**
     * The Repo.
     */
    Repositories repo=Repositories.getInstance();

    /**
     * Get parcelas list.
     *
     * @return the list
     */
    public List<Parcela> getParcelas(){
        return repo.getParcelaRepository().getParcelas();
    }

    /**
     * Get varieties in parcel list.
     *
     * @param parcelId the parcel id
     * @return the list
     */
    public List<Variedade> getVarietiesInParcel(int parcelId){
        return repo.getVariedadeRepository().getVarietiesInParcel(parcelId);
    }

    /**
     * Get metodos execucao list.
     *
     * @return the list
     */
    public List<MetodoExecucao> getMetodosExecucao(){
        return repo.getMetodoExcucaoRepository().getMetodosExecucao();
    }


    /**
     * Registar sementeira boolean.
     *
     * @param date             the date
     * @param parcelaId        the parcela id
     * @param variedadeId      the variedade id
     * @param quantidade       the quantidade
     * @param area             the area
     * @param metodoExecucaoId the metodo execucao id
     * @return the boolean
     */
    public boolean registarSementeira(LocalDate date,
                                      int parcelaId,
                                      int variedadeId,
                                      double quantidade,
                                      double area,
                                      int metodoExecucaoId){

        return repo.getOperacoesSementeiraRepo().registarSementeira(date, parcelaId, variedadeId, quantidade, area, metodoExecucaoId);
    }
}
