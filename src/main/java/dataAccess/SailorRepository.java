package dataAccess;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Objects;

import domain.Sailor;
import oracle.jdbc.OracleTypes;

public class SailorRepository {

    public SailorRepository() {
    }

    public List<Sailor> getSailors() throws SQLException {

        CallableStatement callStmt = null;
        ResultSet resultSet = null;
        List<Sailor> sailors = null;

        try {
            Connection connection = DatabaseConnection.getInstance().getConnection();
            callStmt = connection.prepareCall("{ ? = call fncSailors() }");

            callStmt.registerOutParameter(1, OracleTypes.CURSOR);

            callStmt.execute();
            resultSet = (ResultSet) callStmt.getObject(1);

            sailors = resultSetToList(resultSet);
        } finally {
            if (!Objects.isNull(callStmt)) {
                callStmt.close();
            }
            if (!Objects.isNull(resultSet)) {
                resultSet.close();
            }
        }

        return sailors;
    }

    public void sailorRegister(int sailorId, String name, int rating, Date birthday) throws SQLException {

        CallableStatement callStmt = null;
        try {
            Connection connection = DatabaseConnection.getInstance().getConnection();
            callStmt = connection.prepareCall("{ call prcSailorRegister(?,?,?,?) }");

            callStmt.setInt(1, sailorId);
            callStmt.setString(2, name);
            callStmt.setInt(3, rating);
            java.sql.Date sqlDate = new java.sql.Date(birthday.getTime());
            callStmt.setDate(4, sqlDate);

            callStmt.execute();
            connection.commit();
        } finally {
            if (!Objects.isNull(callStmt)) {
                callStmt.close();
            }
        }
    }

    public int sailorDelete(int sailorId) throws SQLException {

        CallableStatement callStmt = null;
        int deletedRows = 0;
        try {
            Connection connection = DatabaseConnection.getInstance().getConnection();
            callStmt = connection.prepareCall("{ ? = call fncSailorDelete(?) }");

            callStmt.registerOutParameter(1, OracleTypes.INTEGER);
            callStmt.setInt(2, sailorId);

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

    private List<Sailor> resultSetToList(ResultSet resultSet) throws SQLException {

        List<Sailor> sailors = new ArrayList<>();

        while (true) {

            if (!resultSet.next()) break;
            Sailor sailor = new Sailor(
                    resultSet.getInt("sailorId"),
                    resultSet.getString("name"),
                    resultSet.getInt("rating"),
                    resultSet.getDate("birthday")
            );
            sailors.add(sailor);
        }
        return sailors;
    }

}