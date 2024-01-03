package controller.us_bd12;

import java.sql.Connection;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.List;
import java.util.Objects;

import dataAccess.Repositories;
import dataAccess.operacoes_monda.MondaRepository;
import domain.MetodoExecucao;
import domain.Parcela;
import domain.Produto;
import domain.Variedade;

public class MondaRegisterController {

    Repositories repo = Repositories.getInstance();

    public List<Parcela> getParcelas() {
        return repo.getParcelaRepository().getParcelas();
    }

    public List<Variedade> getVarietiesInParcel(int parcelId){
        return repo.getVariedadeRepository().getVarietiesInParcel(parcelId);
    }

    public List<MetodoExecucao> getMetodosExecucao() {
        return repo.getMetodoExcucaoRepository().getMetodosExecucao();
    }

    public boolean registarMonda(int parcelaId,
                                 int variedadeId,
                                 int metodoExecucaoId,
                                 double quantidade,
                                 LocalDate data) {
        return repo.getMondaRepository().registarMonda(parcelaId, variedadeId, metodoExecucaoId, quantidade, data);
    }
}


