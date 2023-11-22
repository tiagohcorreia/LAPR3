package dataAccess;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Objects;

import domain.Colheita;
import domain.OperacaoAgricola;
import domain.Sailor;
import oracle.jdbc.OracleTypes;

public class OperacaoAgricolaRepository {

    public OperacaoAgricolaRepository() {
    }

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