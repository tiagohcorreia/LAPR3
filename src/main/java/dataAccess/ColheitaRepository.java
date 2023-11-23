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
import domain.Sailor;
import oracle.jdbc.OracleTypes;

public class ColheitaRepository {

    public ColheitaRepository() {
    }

    public List<Colheita> getColheitas() throws SQLException {

        CallableStatement callStmt = null;
        ResultSet resultSet = null;
        List<Colheita> colheitas = null;

        try {
            Connection connection = DatabaseConnection.getInstance().getConnection();
            callStmt = connection.prepareCall("{ ? = call fncColheitas() }");

            callStmt.registerOutParameter(1, OracleTypes.CURSOR);

            callStmt.execute();
            resultSet = (ResultSet) callStmt.getObject(1);

            colheitas = resultSetToList(resultSet);
        } finally {
            if (!Objects.isNull(callStmt)) {
                callStmt.close();
            }
            if (!Objects.isNull(resultSet)) {
                resultSet.close();
            }
        }

        return colheitas;
    }

    public static void colheitaRegister(int operacaoId, int parcelaId, int produtoId, int metodoExecucaoId, float quantidade) throws SQLException {

        CallableStatement callStmt = null;
        try {
            Connection connection = DatabaseConnection.getInstance().getConnection();
            callStmt = connection.prepareCall("{ call registrarColheita(?,?,?,?,?) }");

            callStmt.setInt(1, operacaoId);
            callStmt.setInt(2, parcelaId);
            callStmt.setInt(3, produtoId);
            callStmt.setInt(4, metodoExecucaoId);
            callStmt.setFloat(5, quantidade);

            callStmt.execute();
            connection.commit();
        } finally {
            if (!Objects.isNull(callStmt)) {
                callStmt.close();
            }
        }
    }

    public int colheitaDelete(int operacaoId) throws SQLException {

        CallableStatement callStmt = null;
        int deletedRows = 0;
        try {
            Connection connection = DatabaseConnection.getInstance().getConnection();
            callStmt = connection.prepareCall("{ ? = call fncColheitaDelete(?) }");

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

    private List<Colheita> resultSetToList(ResultSet resultSet) throws SQLException {

        List<Colheita> colheitas = new ArrayList<>();

        while (true) {

            if (!resultSet.next()) break;
            Colheita colheita = new Colheita(
                    resultSet.getInt("operacaoId"),
                    resultSet.getInt("parcelaId"),
                    resultSet.getInt("produtoId"),
                    resultSet.getInt("metodoExecucaoId"),
                    resultSet.getFloat("quantidade")
            );
            colheitas.add(colheita);
        }
        return colheitas;
    }

}