package controller.us_bd12;

import java.sql.Connection;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.List;
import java.util.Objects;

import dataAccess.Repositories;
import dataAccess.operacoes_monda.MondaRepository;
import domain.MetodoExecucao;
import domain.Parcela;
import domain.Produto;
import domain.Variedade;

/**
 * The type Monda register controller.
 */
public class MondaRegisterController {

    /**
     * The Repo.
     */
    Repositories repo = Repositories.getInstance();

    /**
     * Gets parcelas.
     *
     * @return the parcelas
     */
    public List<Parcela> getParcelas() {
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
     * Gets metodos execucao.
     *
     * @return the metodos execucao
     */
    public List<MetodoExecucao> getMetodosExecucao() {
        return repo.getMetodoExcucaoRepository().getMetodosExecucao();
    }

    /**
     * Registar monda boolean.
     *
     * @param parcelaId        the parcela id
     * @param variedadeId      the variedade id
     * @param metodoExecucaoId the metodo execucao id
     * @param quantidade       the quantidade
     * @param data             the data
     * @return the boolean
     */
    public boolean registarMonda(int parcelaId,
                                 int variedadeId,
                                 int metodoExecucaoId,
                                 double quantidade,
                                 LocalDate data) {
        return repo.getMondaRepository().registarMonda(parcelaId, variedadeId, metodoExecucaoId, quantidade, data);
    }
}


