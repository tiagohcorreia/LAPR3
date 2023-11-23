package controller;

import dataAccess.ColheitaRepository;
import dataAccess.DatabaseConnection;
import dataAccess.Repositories;
import dataAccess.SailorRepository;

import java.sql.*;
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

    public boolean isIdValid(String tableName, int id) throws SQLException {
        Connection connection = DatabaseConnection.getInstance().getConnection();
        String sql = "SELECT COUNT(*) FROM " + tableName + " WHERE id = ?";

        try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            preparedStatement.setInt(1, id);
            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                if (resultSet.next()) {
                    int count = resultSet.getInt(1);
                    return count > 0;
                }
            }
        }
        return false;
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
