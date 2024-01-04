package controller.us_bd13;

import dataAccess.Repositories;
import domain.*;

import java.time.LocalDate;
import java.util.List;

/**
 * The type Colheita register controller.
 */
public class ColheitaRegisterController {
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
     * Get produtos in parcela list.
     *
     * @param parcelId the parcel id
     * @return the list
     */
    public List<Produto> getProdutosInParcela(int parcelId){
        return repo.getProdutos().getProdutosInParcela(parcelId);
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
     * Register colheita boolean.
     *
     * @param data             the data
     * @param parcelaId        the parcela id
     * @param produtoId        the produto id
     * @param quantidade       the quantidade
     * @param metodoExecucaoId the metodo execucao id
     * @return the boolean
     */
    public boolean registerColheita(LocalDate data, int parcelaId, int produtoId, double quantidade, int metodoExecucaoId){
        return repo.getColheitaRepository().registarColheita(data, parcelaId, produtoId, quantidade, metodoExecucaoId);
    }
}
