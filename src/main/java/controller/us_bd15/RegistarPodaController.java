package controller.us_bd15;

import dataAccess.*;
import domain.MetodoExecucao;
import domain.Parcela;
import domain.Variedade;

import java.time.LocalDate;
import java.util.List;

public class RegistarPodaController {

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

    public boolean registarPoda(LocalDate date,
                                int parcelaId,
                                int variedadeId,
                                double quantidade,
                                int metodoExecucaoId){

        return repo.getPodaRepository().registarPoda(date, parcelaId, variedadeId, quantidade, metodoExecucaoId);
    }

}
