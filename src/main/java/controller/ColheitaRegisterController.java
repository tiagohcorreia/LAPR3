package controller;

import dataAccess.ColheitaRepository;
import dataAccess.Repositories;
import dataAccess.SailorRepository;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Date;
import java.util.Objects;

public class ColheitaRegisterController {

    private ColheitaRepository colheitaRepository;
    private Connection connection;



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
        if (quantidade < 0) {
            throw new SQLException("Error: Quantity cannot be negative.");
        }
        ColheitaRepository.colheitaRegister(operacaoId, parcelaId, produtoId, metodoExecucaoId, quantidade);
    }

    public void beginTransaction() throws SQLException {
        // Set auto-commit to false to start a transaction
        connection.setAutoCommit(false);
    }

    public void commit() throws SQLException {
        // Commit the transaction
        connection.commit();
        // Set auto-commit to true after committing
        connection.setAutoCommit(true);
    }

    public void rollback() throws SQLException {
        // Rollback the transaction
        connection.rollback();
        // Set auto-commit to true after rolling back
        connection.setAutoCommit(true);
    }

    public void close() {
        try {
            if (connection != null) {
                connection.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
            // Handle the exception as needed
        }
    }
}
