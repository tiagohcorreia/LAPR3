package controller.us_bd32;

import dataAccess.Repositories;
import domain.ReceitaFertirrega;
import domain.SetorRega;

import java.time.LocalDate;
import java.util.List;

public class RegisterWateringOperationController {

    Repositories repo=Repositories.getInstance();

    public List<SetorRega> getSetoresRega(){
        return repo.getSetoresRega().getSetores();
    }

    public List<ReceitaFertirrega> getReceitasFertirrega(){
        return repo.getReceitasFertirrega().getReceitas();
    }

    public boolean registerWateringOperation(int setorId, LocalDate date, int duracao, String hora){

        return repo.getRegaRepository().registarRega(setorId, date, duracao, hora);
    }

    public boolean registerFertigationOperation(int setorId,
                                                LocalDate date,
                                                int duracao,
                                                String hora,
                                                int receitaId){
        return repo.getRegaRepository().registarFertirrega(setorId, date, duracao, hora, receitaId);
    }
}
