package controller.us_bd20;

import dataAccess.Repositories;
import domain.Parcela;
import domain.TipoFP;

import java.sql.ResultSet;
import java.time.LocalDate;
import java.util.List;

public class ObterTotaisMensaisRegaController {

    Repositories repo=Repositories.getInstance();

    public List<Parcela> obterParcelas(){
        return repo.getParcelaRepository().getParcelas();
    }

    public ResultSet getQuery(int parcelaID,
                              LocalDate dataInferior,
                              LocalDate dataSuperior){
        return repo.getOthers().obterTotaisMensaisRega(parcelaID, dataInferior, dataSuperior);
    }
}
