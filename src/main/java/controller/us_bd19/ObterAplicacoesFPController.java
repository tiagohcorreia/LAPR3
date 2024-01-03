package controller.us_bd19;

import dataAccess.Repositories;
import domain.Parcela;
import domain.TipoFP;

import java.sql.ResultSet;
import java.time.LocalDate;
import java.util.List;

public class ObterAplicacoesFPController {

    Repositories repo=Repositories.getInstance();

    public List<Parcela> obterParcelas(){
        return repo.getParcelaRepository().getParcelas();
    }

    public List<TipoFP> obterTiposFP(){
        return repo.getTiposFP().obterTiposFP();
    }

    public ResultSet getQuery(int parcelaID,
                              LocalDate dataInferior,
                              LocalDate dataSuperior,
                              int tipoFpId){
        return repo.getOthers().obterAplicacoesFP(parcelaID, dataInferior, dataSuperior, tipoFpId);
    }
}
