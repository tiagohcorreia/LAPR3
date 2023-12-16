package controller;

import dataAccess.Repositories;
import dataAccess.*;

import java.sql.*;
import java.util.Objects;

public class FatorProducaoRegisterController {

    private FatorProducaoRepository fatorProducaoRepository;
    private Connection connection;



    public FatorProducaoRegisterController() {
        getFatorProducaoRepository();
    }

    private FatorProducaoRepository getFatorProducaoRepository() {

        if (Objects.isNull(fatorProducaoRepository)) {

            Repositories repositories = Repositories.getInstance();
            fatorProducaoRepository = repositories.getFatorProducaoRepository();
        }
        return fatorProducaoRepository;
    }

    public void fatorProducaoRegister(int operacaoId, int parcelaId, int variedadeId,int fatorProducaoId, int metodoAplicacaoId, float quantidade,float area) throws SQLException {
        if (quantidade < 0) {
            throw new SQLException("Error: Quantity cannot be negative.");
        }
        FatorProducaoRepository.fatorProducaoRegister(operacaoId, parcelaId, variedadeId,fatorProducaoId, metodoAplicacaoId, quantidade,area);
    }

}
