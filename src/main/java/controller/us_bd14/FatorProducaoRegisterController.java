package controller.us_bd14;

import dataAccess.Repositories;
import dataAccess.*;
import domain.*;

import java.sql.*;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

/**
 * The type Fator producao register controller.
 */
public class FatorProducaoRegisterController {

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
     * Get metodos aplicacao array list.
     *
     * @return the array list
     */
    public ArrayList<MetodoAplicacao> getMetodosAplicacao(){
        return repo.getMetodosAplicacao().getMetodosAplicacao();
    }

    /**
     * Get fatores producao list.
     *
     * @return the list
     */
    public List<FatorProducao> getFatoresProducao(){
        return repo.getFatorProducaoRepository().getFatoresProducao();
    }

    /**
     * Register aplicacao fp solo boolean.
     *
     * @param parcelaID  the parcela id
     * @param quantidade the quantidade
     * @param unidade    the unidade
     * @param area       the area
     * @param fpID       the fp id
     * @param data       the data
     * @return the boolean
     */
    public boolean registerAplicacaoFPSolo(int parcelaID,
                                           double quantidade,
                                           String unidade,
                                           double area,
                                           int fpID,
                                           LocalDate data){

        return repo.getAplicacoesFP().registarAplicacaoFPSolo(parcelaID, quantidade, unidade, area, fpID, data);
    }

    /**
     * Register aplicacao fp variedade boolean.
     *
     * @param parcelaID         the parcela id
     * @param variedadeID       the variedade id
     * @param metodoAplicacaoID the metodo aplicacao id
     * @param quantidade        the quantidade
     * @param unidade           the unidade
     * @param fpID              the fp id
     * @param data              the data
     * @return the boolean
     */
    public boolean registerAplicacaoFPVariedade(int parcelaID,
                                                int variedadeID,
                                                int metodoAplicacaoID,
                                                double quantidade,
                                                String unidade,
                                                int fpID,
                                                LocalDate data){

        return repo.getAplicacoesFP().registarAplicacaoFPVariedade(parcelaID, variedadeID, metodoAplicacaoID, quantidade, unidade, fpID, data);
    }
}
