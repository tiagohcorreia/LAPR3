package dataAccess;

import java.sql.*;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Objects;

import domain.OperacaoAgricola;

import oracle.jdbc.OracleTypes;

/**
 * The type Operacao agricola repository.
 */
public class OperacaoAgricolaRepository {

    /**
     * Gets next id.
     *
     * @return the next id
     */
    public int getNextId() {

        try {
            Connection connection = DatabaseConnection.getInstance().getConnection();
            Class.forName("oracle.jdbc.driver.OracleDriver");

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
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }

        return -1;
    }

    /**
     * Gets operacoes agricolas.
     *
     * @return the operacoes agricolas
     * @throws SQLException the sql exception
     */
    public List<OperacaoAgricola> getOperacoesAgricolas() throws SQLException {

        CallableStatement callStmt = null;
        ResultSet resultSet = null;
        List<OperacaoAgricola> operacaoAgricolas = null;

        try {

            Connection connection = DatabaseConnection.getInstance().getConnection();
            callStmt = connection.prepareCall("{ ? = call fncOperacoesAgricolas() }");

            callStmt.registerOutParameter(1, OracleTypes.CURSOR);

            callStmt.execute();
            resultSet = (ResultSet) callStmt.getObject(1);

            operacaoAgricolas = resultSetToList(resultSet);

        } finally {

            if (!Objects.isNull(callStmt)) {
                callStmt.close();
            }

            if (!Objects.isNull(resultSet)) {
                resultSet.close();
            }
        }

        return operacaoAgricolas;
    }

    /**
     * Operacao agricola register.
     *
     * @param operacaoId the operacao id
     * @param date       the date
     * @throws SQLException the sql exception
     */
    public static void OperacaoAgricolaRegister(int operacaoId, Date date) throws SQLException {

        CallableStatement callStmt = null;
        try {
            Connection connection = DatabaseConnection.getInstance().getConnection();
            callStmt = connection.prepareCall("{ call RegistrarOperacaoAgricola(?,?) }");

            callStmt.setInt(1, operacaoId);
            java.sql.Date sqlDate = new java.sql.Date(date.getTime());
            callStmt.setDate(2, sqlDate);

            callStmt.execute();
            connection.commit();
        } finally {
            if (!Objects.isNull(callStmt)) {
                callStmt.close();
            }
        }
    }


    /**
     * Operacao agricola delete int.
     *
     * @param operacaoId the operacao id
     * @return the int
     * @throws SQLException the sql exception
     */
    public int operacaoAgricolaDelete(int operacaoId) throws SQLException {

        CallableStatement callStmt = null;
        int deletedRows = 0;

        try {
            Connection connection = DatabaseConnection.getInstance().getConnection();
            callStmt = connection.prepareCall("{ ? = call fncOperacaoAgricolaDelete(?) }");

            callStmt.registerOutParameter(1, OracleTypes.INTEGER);
            callStmt.setInt(2, operacaoId);

            callStmt.execute();
            deletedRows = callStmt.getInt(1);

            connection.commit();

        } finally {

            if (!Objects.isNull(callStmt)) {
                callStmt.close();
            }
        }
        return deletedRows;
    }

    /**
     * Operacao agricola cancel int.
     *
     * @param operacaoId the operacao id
     * @return the int
     * @throws SQLException the sql exception
     */
    public int operacaoAgricolaCancel(int operacaoId) throws SQLException {

        CallableStatement callStmt = null;
        int canceledRows = 0;

        try {
            Connection connection = DatabaseConnection.getInstance().getConnection();
            callStmt = connection.prepareCall("{ ? = call cancel_operation(?) }");

            callStmt.registerOutParameter(1, OracleTypes.INTEGER);
            callStmt.setInt(2, operacaoId);

            callStmt.execute();
            canceledRows = callStmt.getInt(1);

            connection.commit();

        } finally {

            if (!Objects.isNull(callStmt)) {
                callStmt.close();
            }
        }
        return canceledRows;
    }


    private List<OperacaoAgricola> resultSetToList(ResultSet resultSet) throws SQLException {

        List<OperacaoAgricola> operacaoAgricolas = new ArrayList<>();

        while (true) {

            if (!resultSet.next()) break;
            OperacaoAgricola operacaoAgricola = new OperacaoAgricola(
                    resultSet.getInt("operacaoId"),
                    resultSet.getDate("date")
            );
            operacaoAgricolas.add(operacaoAgricola);
        }
        return operacaoAgricolas;
    }

}