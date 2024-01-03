
package dataAccess.operacoes_monda;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

import dataAccess.DatabaseConnection;
import domain.Monda;
import oracle.jdbc.OracleTypes;

public class MondaRepository {

    public MondaRepository() {
    }

    public List<Monda> getMondas() throws SQLException {

        CallableStatement callStmt = null;
        ResultSet resultSet = null;
        List<Monda> mondas = null;

        try {
            Connection connection = DatabaseConnection.getInstance().getConnection();
            callStmt = connection.prepareCall("{ ? = call registerMonda() }");

            callStmt.registerOutParameter(1, OracleTypes.CURSOR);

            callStmt.execute();
            resultSet = (ResultSet) callStmt.getObject(1);

            mondas = resultSetToList(resultSet);
        } finally {
            if (!Objects.isNull(callStmt)) {
                callStmt.close();
            }
            if (!Objects.isNull(resultSet)) {
                resultSet.close();
            }
        }

        return mondas;
    }

    public boolean registarMonda(int parcelaId,
                                 int variedadeId,
                                 int metodoExecucaoId,
                                 double quantidade,
                                 LocalDate data) {

        CallableStatement callStmt = null;
        try {
            try {
                Connection connection = DatabaseConnection.getInstance().getConnection();
                callStmt = connection.prepareCall("{ ? = call registar_Monda(?,?,?,?,?) }");

                callStmt.registerOutParameter(1, OracleTypes.NUMBER);
                callStmt.setInt(2, parcelaId);
                callStmt.setInt(3, variedadeId);
                callStmt.setDouble(4, quantidade);
                callStmt.setInt(5, metodoExecucaoId);
                callStmt.setDate(6, java.sql.Date.valueOf(data));

                callStmt.execute();
                return callStmt.getInt(1) == 1;
            } finally {
                if (!Objects.isNull(callStmt)) {
                    callStmt.close();
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public int mondaDelete(int operacaoId) throws SQLException {

        CallableStatement callStmt = null;
        int deletedRows = 0;
        try {
            Connection connection = DatabaseConnection.getInstance().getConnection();
            callStmt = connection.prepareCall("{ ? = call mondaDelete(?) }");

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

    private List<Monda> resultSetToList(ResultSet resultSet) throws SQLException {

        List<Monda> mondas = new ArrayList<>();

        while (true) {

            if (!resultSet.next()) break;
            Monda monda = new Monda(
                    resultSet.getInt("operacaoId"),
                    resultSet.getInt("parcelaId"),
                    resultSet.getInt("variedadeId"),
                    resultSet.getInt("fatorProducaoId"),
                    resultSet.getInt("metodoExecucaoId"),
                    resultSet.getFloat("quantidade")
            );
            mondas.add(monda);
        }
        return mondas;
    }

}