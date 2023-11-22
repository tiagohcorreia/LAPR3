package controller;

import dataAccess.ColheitaRepository;
import dataAccess.Repositories;
import dataAccess.SailorRepository;

import java.sql.SQLException;
import java.util.Date;
import java.util.Objects;

public class ColheitaRegisterController {

    private ColheitaRepository colheitaRepository;

    public ColheitaRegisterController() {
        getColheitaRepository();
    }

    private ColheitaRepository getColheitaRepository() {

        if (Objects.isNull(colheitaRepository)) {

            Repositories repositories = Repositories.getInstance();
            colheitaRepository = repositories.getColheitaRepository();
        }
        return colheitaRepository;
    }

    public void colheitaRegister(int operacaoId, int parcelaId, int produtoId, int metodoExecucaoId, float quantidade) throws SQLException {
        ColheitaRepository.colheitaRegister(operacaoId, parcelaId, produtoId, metodoExecucaoId, quantidade);
    }
}
