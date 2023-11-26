package controller;

import dataAccess.ColheitaRepository;
import dataAccess.DatabaseConnection;
import dataAccess.Repositories;
import dataAccess.*;
import dataAccess.SailorRepository;

import java.sql.*;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
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
