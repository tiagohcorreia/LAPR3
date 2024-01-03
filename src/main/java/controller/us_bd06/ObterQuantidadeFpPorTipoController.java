package controller.us_bd06;

import dataAccess.Repositories;
import domain.Parcela;

import java.sql.ResultSet;
import java.time.LocalDate;
import java.util.List;

public class ObterQuantidadeFpPorTipoController {

    Repositories repo = Repositories.getInstance();

    public List<Parcela> obterParcelas(){
        return repo.getParcelaRepository().getParcelas();
    }

    public ResultSet getQuery(int parcelaId,
                              LocalDate dataInicio,
                              LocalDate dataFim){
        return repo.getOthers().obterFpPorTipo(parcelaId, dataInicio, dataFim);
    }
}
