package controller.us_bd11;

import dataAccess.Repositories;
import domain.MetodoExecucao;
import domain.Parcela;
import domain.Variedade;

import java.sql.Date;
import java.sql.ResultSet;
import java.time.LocalDate;
import java.util.List;

public class RegisterSeedingController {

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

    public boolean registerSeeding(LocalDate date,
                                int parcelaId,
                                int variedadeId,
                                float quantidade,
                                float area,
                                int metodoExecucaoId){

        return repo.getSeedingOperationsRepository().registerSeeding(date, parcelaId, variedadeId, quantidade, area, metodoExecucaoId);
    }
}
