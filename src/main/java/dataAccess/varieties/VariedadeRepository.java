package dataAccess.varieties;

import dataAccess.DatabaseConnection;
import domain.Variedade;
import oracle.jdbc.OracleTypes;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

public class VariedadeRepository {

    public VariedadeRepository() {
    }

    public List<Variedade> getVarieties() {

        CallableStatement callStmt = null;
        ResultSet resultSet = null;
        List<Variedade> variedades = null;

        try{
            try {
                Connection connection = DatabaseConnection.getInstance().getConnection();
                callStmt = connection.prepareCall("{ ? = call fncVariedades() }");

                callStmt.registerOutParameter(1, OracleTypes.CURSOR);

                callStmt.execute();
                resultSet = (ResultSet) callStmt.getObject(1);

                variedades = resultSetToList(resultSet);

            } finally {

                if (!Objects.isNull(callStmt)) {
                    callStmt.close();
                }
                if (!Objects.isNull(resultSet)) {
                    resultSet.close();
                }
            }
        } catch (SQLException e){
            e.printStackTrace();
        }

        return variedades;
    }

    public List<Variedade> getVarietiesInParcel(int parcelId){

        CallableStatement callStmt = null;
        ResultSet resultSet = null;
        List<Variedade> variedades = null;

        try{
            try {
                Connection connection = DatabaseConnection.getInstance().getConnection();
                callStmt = connection.prepareCall("{ ? = call get_varieties_in_parcel(?) }");

                callStmt.registerOutParameter(1, OracleTypes.CURSOR);
                callStmt.setInt(2, parcelId);
                callStmt.execute();
                resultSet = (ResultSet) callStmt.getObject(1);

                variedades = resultSetToList(resultSet);

            } finally {

                if (!Objects.isNull(callStmt)) {
                    callStmt.close();
                }
                if (!Objects.isNull(resultSet)) {
                    resultSet.close();
                }
            }
        } catch (SQLException e){
            e.printStackTrace();
        }

        return variedades;
    }

    private List<Variedade> resultSetToList(ResultSet resultSet) throws SQLException {

        List<Variedade> variedades = new ArrayList<>();

        while (true) {

            if (!resultSet.next()) break;
            Variedade variedade = new Variedade(

                    resultSet.getInt("ID"),
                    resultSet.getString("Nome"),
                    resultSet.getInt("Cultura_ID")
            );
            variedades.add(variedade);
        }
        return variedades;
    }


}
