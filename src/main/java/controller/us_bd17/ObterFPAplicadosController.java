package controller.us_bd17;

import dataAccess.Repositories;
import domain.Parcela;

import java.sql.ResultSet;
import java.time.LocalDate;
import java.util.List;

public class ObterFPAplicadosController {

    Repositories repo=Repositories.getInstance();

    public List<Parcela> obterParcelas(){
        return repo.getParcelaRepository().getParcelas();
    }

    public ResultSet getQuery(int parcelaID,
                              LocalDate dataInferior,
                              LocalDate dataSuperior){
        return repo.getOthers().obterFatoresProducaoAplicados(parcelaID, dataInferior, dataSuperior);
    }
}
