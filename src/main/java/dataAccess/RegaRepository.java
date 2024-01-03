package dataAccess;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

import domain.RegaTable;
import oracle.jdbc.OracleTypes;

public class RegaRepository {


    public List<RegaTable> getRegas() {

        CallableStatement callStmt = null;
        ResultSet resultSet = null;
        List<RegaTable> regas = null;

        try {
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
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return regas;
    }

    public static void regaRegister(int operacaoId, String setor, int duracao, String hora) throws SQLException {

        CallableStatement callStmt = null;
        try {
            Connection connection = DatabaseConnection.getInstance().getConnection();
            callStmt = connection.prepareCall("{ call registarRega(?,?,?,?) }");

            callStmt.setInt(1, operacaoId);
            callStmt.setString(2, setor);
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

    public boolean registerWateringOperation(int setorId, LocalDate date, int duracao, String hora) {

        CallableStatement callStmt = null;

        try {
            try {
                Connection connection = DatabaseConnection.getInstance().getConnection();
                callStmt = connection.prepareCall("{ ? = call register_watering(?,?,?,?) }");

                callStmt.registerOutParameter(1, OracleTypes.NUMBER);
                callStmt.setInt(2, setorId);
                callStmt.setDate(3, java.sql.Date.valueOf(date));
                callStmt.setInt(4, duracao);
                callStmt.setString(5, hora);

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

    public boolean registerFertigationOperation(int setorId,
                                                       LocalDate date,
                                                       int duracao,
                                                       String hora,
                                                       int receitaId) {

        CallableStatement callStmt = null;

        try {
            try {
                Connection connection = DatabaseConnection.getInstance().getConnection();
                callStmt = connection.prepareCall("{ ? = call register_fertigation(?,?,?,?,?) }");

                callStmt.registerOutParameter(1, OracleTypes.NUMBER);
                callStmt.setInt(2, setorId);
                callStmt.setDate(3, java.sql.Date.valueOf(date));
                callStmt.setInt(4, duracao);
                callStmt.setString(5, hora);
                callStmt.setInt(6, receitaId);

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
                    resultSet.getString("setor"),
                    resultSet.getInt("duracao"),
                    resultSet.getString("hora")
            );
            regas.add(regaTable);
        }
        return regas;
    }

}