package dataAccess;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

import domain.Colheita;
import domain.RegaTable;
import oracle.jdbc.OracleTypes;

public class RegaRepository {

    public RegaRepository() {
    }

    public List<RegaTable> getRegas() throws SQLException {

        CallableStatement callStmt = null;
        ResultSet resultSet = null;
        List<RegaTable> regas = null;

        try {
            Connection connection = DatabaseConnection.getInstance().getConnection();
            callStmt = connection.prepareCall("{ ? = call registarRega() }");

            callStmt.registerOutParameter(1, OracleTypes.CURSOR);

            callStmt.execute();
            resultSet = (ResultSet) callStmt.getObject(1);

            regas = resultSetToList(resultSet);
        } finally {
            if (!Objects.isNull(callStmt)) {
                callStmt.close();
            }
            if (!Objects.isNull(resultSet)) {
                resultSet.close();
            }
        }

        return regas;
    }

    public static void regaRegister(int operacaoId, int setorId, int duracao,String hora) throws SQLException {

        CallableStatement callStmt = null;
        try {
            Connection connection = DatabaseConnection.getInstance().getConnection();
            callStmt = connection.prepareCall("{ call registarRega(?,?,?,?) }");

            callStmt.setInt(1, operacaoId);
            callStmt.setInt(2, setorId);
            callStmt.setInt(3, duracao);
            callStmt.setString(4, hora);

            callStmt.execute();
            connection.commit();
        } finally {
            if (!Objects.isNull(callStmt)) {
                callStmt.close();
            }
        }
    }

    public int regaDelete(int operacaoId) throws SQLException {

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

    private List<RegaTable> resultSetToList(ResultSet resultSet) throws SQLException {

        List<RegaTable> regas = new ArrayList<>();

        while (true) {

            if (!resultSet.next()) break;
            RegaTable regaTable = new RegaTable(
                    resultSet.getDate("data"),
                    resultSet.getInt("operacaoId"),
                    resultSet.getInt("setorId"),
                    resultSet.getInt("duracao"),
                    resultSet.getString("hora")
            );
            regas.add(regaTable);
        }
        return regas;
    }

}