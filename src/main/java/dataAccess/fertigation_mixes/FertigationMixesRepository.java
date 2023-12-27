package dataAccess.fertigation_mixes;

import dataAccess.DatabaseConnection;
import domain.WateringSector;
import oracle.jdbc.OracleTypes;
import watering_system_manager.domain.FertigationMix;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Objects;

public class FertigationMixesRepository {

    public ArrayList<FertigationMix> getFertigationMixes() throws SQLException {

        CallableStatement callStmt = null;
        ResultSet resultSet = null;
        ArrayList<FertigationMix> mixes = null;

        try {

            Connection connection = DatabaseConnection.getInstance().getConnection();
            callStmt = connection.prepareCall("{ ? = call get_fertigation_mixes() }");
            callStmt.registerOutParameter(1, OracleTypes.CURSOR);
            callStmt.execute();
            resultSet = (ResultSet) callStmt.getObject(1);

            mixes = resultSetToList(resultSet);

        } finally {

            if (!Objects.isNull(callStmt)) {
                callStmt.close();
            }
            if (!Objects.isNull(resultSet)) {
                resultSet.close();
            }
        }

        return mixes;
    }

    private ArrayList<FertigationMix> resultSetToList(ResultSet resultSet) throws SQLException {

        ArrayList<FertigationMix> mixes = new ArrayList<>();

        while (resultSet.next()) {

            FertigationMix mix = new FertigationMix(
                    resultSet.getInt("id"),
                    resultSet.getString("nome")
            );
            mixes.add(mix);
        }
        return mixes;
    }

    public boolean isThereMix(String mixName) throws SQLException{
        for (FertigationMix m: getFertigationMixes()){
            if (mixName.equalsIgnoreCase(m.getName())){
                return true;
            }
        }
        return false;
    }
}
