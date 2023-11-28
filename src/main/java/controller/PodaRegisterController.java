package controller;

import dataAccess.*;

import java.sql.*;
import java.util.Date;
import java.util.Objects;

public class PodaRegisterController {

    private PodaRepository podaRepository;
    private Connection connection;



    public PodaRegisterController() {
        getPodaRepository();
    }

    private PodaRepository getPodaRepository() {

        if (Objects.isNull(podaRepository)) {

            Repositories repositories = Repositories.getInstance();
            podaRepository = repositories.getPodaRepository();
        }
        return podaRepository;
    }

    public void podaRegister(int operacaoId, int parcelaId, int variedadeId, float quantidade, int metodoExecucaoId) throws SQLException {
        if (quantidade < 0) {
            throw new SQLException("Error: Quantity cannot be negative.");
        }
        PodaRepository.podaRegister(operacaoId, parcelaId, variedadeId, quantidade, metodoExecucaoId);
    }

}
