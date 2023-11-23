package controller;



import dataAccess.OperacaoAgricolaRepository;
import dataAccess.Repositories;

import java.sql.*;
import java.util.Date;
import java.util.Objects;

public class OperacaoAgricolaRegisterController {

    private OperacaoAgricolaRepository operacaoAgricolaRepository;
    private Connection connection;
    private static final String JDBC_URL = "jdbc:oracle:thin:@vsgate-s1.dei.isep.ipp.pt:11127/xe";
    private static final String USERNAME = "UserA";
    private static final String PASSWORD = "basedados";

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

    public void beginTransaction() throws SQLException {

        connection.setAutoCommit(false);
    }

    public void commit() throws SQLException {

        connection.commit();

        connection.setAutoCommit(true);
    }

    public void rollback() throws SQLException {

        connection.rollback();

        connection.setAutoCommit(true);
    }

    public void close() {
        try {
            if (connection != null) {
                connection.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();

        }

    }
    public int getNextId() {
        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");


            try (Connection connection = DriverManager.getConnection(JDBC_URL, USERNAME, PASSWORD)) {

                String query = "SELECT MAX(id) FROM OPERACAO_AGRICOLA";
                try (PreparedStatement preparedStatement = connection.prepareStatement(query);
                     ResultSet resultSet = preparedStatement.executeQuery()) {
                    if (resultSet.next()) {
                        int maxId = resultSet.getInt(1);
                        return maxId + 1;
                    } else {

                        return 1;
                    }
                }
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }


        return -1;
    }
}
