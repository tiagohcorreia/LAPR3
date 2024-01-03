package controller.us_bd11;

import dataAccess.Repositories;
import domain.MetodoExecucao;
import domain.Parcela;
import domain.Variedade;

import java.time.LocalDate;
import java.util.List;

public class RegistarSementeiraController {

    Repositories repo=Repositories.getInstance();

    public List<Parcela> getParcelas(){
        return repo.getParcelaRepository().getParcelas();
    }

    public List<Variedade> getVarietiesInParcel(int parcelId){
        return repo.getVariedadeRepository().getVarietiesInParcel(parcelId);
    }

    public List<MetodoExecucao> getMetodosExecucao(){
        return repo.getMetodoExcucaoRepository().getMetodosExecucao();
    }


    public boolean registarSementeira(LocalDate date,
                                      int parcelaId,
                                      int variedadeId,
                                      double quantidade,
                                      double area,
                                      int metodoExecucaoId){

        return repo.getOperacoesSementeiraRepo().registarSementeira(date, parcelaId, variedadeId, quantidade, area, metodoExecucaoId);
    }
}
