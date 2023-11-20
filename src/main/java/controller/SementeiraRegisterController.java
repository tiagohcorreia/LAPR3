package controller;

import dataAccess.Repositories;
import dataAccess.SementeiraRepository;

import java.sql.SQLException;
import java.util.Objects;

public class SementeiraRegisterController {

    private SementeiraRepository sementeiraRepository;

    public SementeiraRegisterController() {
        getSementeiraRepository();
    }

    private SementeiraRepository getSementeiraRepository() {

        if (Objects.isNull(sementeiraRepository)) {

            Repositories repositories = Repositories.getInstance();
            sementeiraRepository = repositories.getSementeiraRepository();
        }
        return sementeiraRepository;
    }

    public void sementeiraRegister(int operacaoId, int parcelaId, int variedadeId, float quantidade, float area, int metodoExecucaoId) throws SQLException {

        sementeiraRepository.sementeiraRegister(operacaoId, parcelaId, variedadeId, quantidade, area, metodoExecucaoId);
    }
}
