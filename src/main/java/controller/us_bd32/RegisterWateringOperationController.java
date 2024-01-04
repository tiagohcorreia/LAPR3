package controller.us_bd32;

import dataAccess.Repositories;
import domain.ReceitaFertirrega;
import domain.SetorRega;

import java.time.LocalDate;
import java.util.List;

/**
 * The type Register watering operation controller.
 */
public class RegisterWateringOperationController {

    /**
     * The Repo.
     */
    Repositories repo=Repositories.getInstance();

    /**
     * Get setores rega list.
     *
     * @return the list
     */
    public List<SetorRega> getSetoresRega(){
        return repo.getSetoresRega().getSetores();
    }

    /**
     * Get receitas fertirrega list.
     *
     * @return the list
     */
    public List<ReceitaFertirrega> getReceitasFertirrega(){
        return repo.getReceitasFertirrega().getReceitas();
    }

    /**
     * Register watering operation boolean.
     *
     * @param setorId the setor id
     * @param date    the date
     * @param duracao the duracao
     * @param hora    the hora
     * @return the boolean
     */
    public boolean registerWateringOperation(int setorId, LocalDate date, int duracao, String hora){

        return repo.getRegaRepository().registarRega(setorId, date, duracao, hora);
    }

    /**
     * Register fertigation operation boolean.
     *
     * @param setorId   the setor id
     * @param date      the date
     * @param duracao   the duracao
     * @param hora      the hora
     * @param receitaId the receita id
     * @return the boolean
     */
    public boolean registerFertigationOperation(int setorId,
                                                LocalDate date,
                                                int duracao,
                                                String hora,
                                                int receitaId){
        return repo.getRegaRepository().registarFertirrega(setorId, date, duracao, hora, receitaId);
    }
}
