package controller;

import dataAccess.DatabaseConnection;
import dataAccess.OperacaoAgricolaRepository;
import dataAccess.Repositories;

import java.sql.*;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Objects;

public class OperacaoAgricolaRegisterController {

    private OperacaoAgricolaRepository operacaoAgricolaRepository;
    private Connection connection;
    private static final String JDBC_URL = "jdbc:oracle:thin:@localhost:1521/xe";
    private static final String USERNAME = "loc";

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
        OperacaoAgricolaRepository.OperacaoAgricolaRegister(operacaoId, date);
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

    public List<String[]> getTableData(String tableName) {
        List<String[]> result = new ArrayList<>();

        try (Connection connection = DriverManager.getConnection(JDBC_URL, USERNAME, PASSWORD)) {
            String query = "SELECT * FROM " + tableName + " FETCH FIRST 2 ROWS ONLY";
            try (PreparedStatement preparedStatement = connection.prepareStatement(query);
                 ResultSet resultSet = preparedStatement.executeQuery()) {

                int columnCount = resultSet.getMetaData().getColumnCount();

                while (resultSet.next()) {
                    String[] row = new String[columnCount];
                    for (int i = 1; i <= columnCount; i++) {
                        row[i - 1] = resultSet.getString(i);
                    }
                    result.add(row);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return result;
    }

    public void printTableData(String tableName) {
        List<String[]> data = getTableData(tableName);

        if (data.isEmpty()) {
            System.out.println("No data found in the table.");
            return;
        }

        try (Connection connection = DriverManager.getConnection(JDBC_URL, USERNAME, PASSWORD);
             PreparedStatement preparedStatement = connection.prepareStatement("SELECT * FROM " + tableName + " WHERE ROWNUM <= 1");
             ResultSet resultSet = preparedStatement.executeQuery()) {

            ResultSetMetaData metaData = resultSet.getMetaData();
            int columnCount = metaData.getColumnCount();

            if (columnCount < 2) {
                System.out.println("Table doesn't have enough columns.");
                return;
            }

            String[] columnNames = new String[]{metaData.getColumnName(1), metaData.getColumnName(2)};

            printTableHeader(columnNames);

            for (String[] row : data) {
                printTableLine(new String[]{row[0], row[1]});
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    private void printTableHeader(String[] values) {
        System.out.printf("%-8s|\t%-8s|\n", values[0], values[1]);
        printTableSeparator(2);
    }

    private void printTableLine(String[] values) {
        System.out.printf("%-8s|\t%-8s|\n", values[0], values[1]);
        printTableSeparator(2);
    }

    private void printTableSeparator(int columnCount) {
        for (int i = 0; i < columnCount; i++) {
            System.out.print("--------|\t");
        }
        System.out.println();
    }

}
