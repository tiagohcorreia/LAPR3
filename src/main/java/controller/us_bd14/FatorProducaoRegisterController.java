package controller.us_bd14;

import dataAccess.Repositories;
import dataAccess.*;
import domain.*;

import java.sql.*;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

public class FatorProducaoRegisterController {

    Repositories repo=Repositories.getInstance();

    public List<Parcela> getParcelas(){
        return repo.getParcelaRepository().getParcelas();
    }

    public List<Variedade> getVarietiesInParcel(int parcelId){
        return repo.getVariedadeRepository().getVarietiesInParcel(parcelId);
    }

    public ArrayList<MetodoAplicacao> getMetodosAplicacao(){
        return repo.getMetodosAplicacao().getMetodosAplicacao();
    }

    public List<FatorProducao> getFatoresProducao(){
        return repo.getFatorProducaoRepository().getFatoresProducao();
    }

    public boolean registerAplicacaoFPSolo(int parcelaID,
                                           double quantidade,
                                           String unidade,
                                           double area,
                                           int fpID,
                                           LocalDate data){

        return repo.getAplicacoesFP().registarAplicacaoFPSolo(parcelaID, quantidade, unidade, area, fpID, data);
    }

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
