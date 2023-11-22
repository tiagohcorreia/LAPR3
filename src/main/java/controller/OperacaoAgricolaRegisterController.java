package controller;


import dataAccess.OperacaoAgricolaRepository;
import dataAccess.Repositories;

import java.sql.SQLException;
import java.util.Date;
import java.util.Objects;

public class OperacaoAgricolaRegisterController {

    private OperacaoAgricolaRepository operacaoAgricolaRepository;

    public OperacaoAgricolaRegisterController() {
        getOperacaoAgricolaRepository();
    }

    private OperacaoAgricolaRepository getOperacaoAgricolaRepository() {

        if (Objects.isNull(operacaoAgricolaRepository)) {

            Repositories repositories = Repositories.getInstance();
            operacaoAgricolaRepository = repositories.getOperacaoAgricolaRepository();
        }
        return operacaoAgricolaRepository;
    }

    public void operacaoAgricolaRegister(int operacaoId, Date date) throws SQLException {
        OperacaoAgricolaRepository.OperacaoAgricolaRegister(operacaoId,date);
    }
}
