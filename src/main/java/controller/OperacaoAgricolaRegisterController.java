package controller;

import dataAccess.DatabaseConnection;
import dataAccess.OperacaoAgricolaRepository;
import dataAccess.Repositories;

import java.sql.*;
import java.util.*;
import java.util.Date;

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
            String query = "SELECT * FROM " + tableName;
            try (PreparedStatement preparedStatement = connection.prepareStatement(query);
                 ResultSet resultSet = preparedStatement.executeQuery()) {

                ResultSetMetaData metaData = resultSet.getMetaData();
                int columnCount = metaData.getColumnCount();

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


        String[] columnNames = getColumnNames(tableName);


        if (columnNames != null) {
            printTableHeader(columnNames);
        }

        for (String[] row : data) {
            printTableLine(row);
        }
    }

    private String[] getColumnNames(String tableName) {
        try (Connection connection = DriverManager.getConnection(JDBC_URL, USERNAME, PASSWORD)) {
            String query = "SELECT * FROM " + tableName + " WHERE ROWNUM <= 1";
            try (PreparedStatement preparedStatement = connection.prepareStatement(query);
                 ResultSet resultSet = preparedStatement.executeQuery()) {

                ResultSetMetaData metaData = resultSet.getMetaData();
                int columnCount = metaData.getColumnCount();
                String[] columnNames = new String[columnCount];

                for (int i = 1; i <= columnCount; i++) {
                    columnNames[i - 1] = metaData.getColumnName(i);
                }

                return columnNames;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return null;
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

    public List<String[]> getTableDataByFatorProducaoId(String tableName, int fatorProducaoId) {
        List<String[]> result = new ArrayList<>();

        try (Connection connection = DriverManager.getConnection(JDBC_URL, USERNAME, PASSWORD)) {
            String query = "SELECT * FROM " + tableName + " WHERE Fator_Producao_ID = ?";
            try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
                preparedStatement.setInt(1, fatorProducaoId);

                try (ResultSet resultSet = preparedStatement.executeQuery()) {
                    ResultSetMetaData metaData = resultSet.getMetaData();
                    int columnCount = metaData.getColumnCount();

                    while (resultSet.next()) {
                        String[] row = new String[columnCount];
                        for (int i = 1; i <= columnCount; i++) {
                            row[i - 1] = resultSet.getString(i);
                        }
                        result.add(row);
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return result;
    }

    public void printTableDataByFatorId(String tableName, List<String[]> data, int fatorProducaoId) {
        if (data.isEmpty()) {
            System.out.println("No data found in the table.");
            return;
        }

        String[] columnNames = new String[]{data.get(0)[0], data.get(0)[1]};
        printTableHeader(columnNames);

        for (String[] row : data) {
            int rowFatorProducaoId = Integer.parseInt(row[0]);
            if (rowFatorProducaoId == fatorProducaoId) {
                printTableLine(new String[]{row[0], row[1]});
            }
        }
    }

}
