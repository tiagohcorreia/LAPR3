package controller.us_bd15;

import dataAccess.*;
import domain.MetodoExecucao;
import domain.Parcela;
import domain.Variedade;

import java.time.LocalDate;
import java.util.List;

public class PodaRegisterController {

    Repositories repo=Repositories.getInstance();

    public int getNextId(){
        return repo.getOperacaoAgricolaRepository().getNextId();
    }

    public List<Parcela> getParcelas(){
        return repo.getParcelaRepository().getParcelas();
    }

    public List<Variedade> getVarietiesInParcel(int parcelId){
        return repo.getVariedadeRepository().getVarietiesInParcel(parcelId);
    }

    public List<MetodoExecucao> getExecutionMethods(){
        return repo.getMetodoExcucaoRepository().getMetodosExecucao();
    }

    public boolean isThereExecutionMethod(int methodId){
        return repo.getMetodoExcucaoRepository().isThereExecutionMethod(methodId);
    }

    public boolean registerPruning(LocalDate date,
                                   int parcelaId,
                                   int variedadeId,
                                   float quantidade,
                                   int metodoExecucaoId){

        return repo.getPodaRepository().podaRegister(date, parcelaId, variedadeId, quantidade, metodoExecucaoId);
    }

}
