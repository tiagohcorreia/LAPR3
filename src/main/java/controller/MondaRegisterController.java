package controller;

import dataAccess.*;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.Objects;
import dataAccess.Repositories;

public class MondaRegisterController {

        private MondaRepository mondaRepository;
        private Connection connection;



        public MondaRegisterController() {
            getMondaRepository();
        }

        private MondaRepository getMondaRepository() {

            if (Objects.isNull(mondaRepository)) {

                Repositories repositories = Repositories.getInstance();
                mondaRepository = repositories.getMondaRepository();
            }
            return mondaRepository;
        }

        public void mondaRegister(int operacaoId, int parcelaId, int variedadeId,int fatorProducaoId, int metodoExecucaoId, float quantidade) throws SQLException {
            if (quantidade < 0) {
                throw new SQLException("Error: Quantity cannot be negative.");
            }
            MondaRepository.mondaRegister(operacaoId, parcelaId, variedadeId,fatorProducaoId, metodoExecucaoId, quantidade);
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


