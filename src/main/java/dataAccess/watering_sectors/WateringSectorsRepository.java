package dataAccess.watering_sectors;

import dataAccess.DatabaseConnection;
import domain.Parcela;
import domain.WateringSector;
import oracle.jdbc.OracleTypes;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

public class WateringSectorsRepository {

    public ArrayList<WateringSector> getSectors() {

        CallableStatement callStmt = null;
        ResultSet resultSet = null;
        ArrayList<WateringSector> sectors = null;

        try{
            try {

                Connection connection = DatabaseConnection.getInstance().getConnection();
                callStmt = connection.prepareCall("{ ? = call get_watering_sectors() }");
                callStmt.registerOutParameter(1, OracleTypes.CURSOR);
                callStmt.execute();
                resultSet = (ResultSet) callStmt.getObject(1);

                sectors = resultSetToList(resultSet);

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

        return sectors;
    }

    private ArrayList<WateringSector> resultSetToList(ResultSet resultSet) throws SQLException {

        ArrayList<WateringSector> sectors = new ArrayList<>();

        while (resultSet.next()) {

            WateringSector sector = new WateringSector(
                    resultSet.getInt("id"),
                    resultSet.getString("nome"),
                    resultSet.getFloat("area"),
                    resultSet.getFloat("caudal_maximo"),
                    resultSet.getDate("data_inicio"),
                    resultSet.getDate("data_fim"),
                    resultSet.getInt("metodo_dispensasao_id")
            );
            sectors.add(sector);
        }
        return sectors;
    }

    public boolean isThereSector(String sectorName) {
        CallableStatement callStmt = null;
        int out = -1;

        try {

            try {
                Connection connection = DatabaseConnection.getInstance().getConnection();
                callStmt = connection.prepareCall("{ ? = call is_there_sector(?) }");
                callStmt.registerOutParameter(1, OracleTypes.NUMBER);
                callStmt.setString(2, sectorName);
                callStmt.execute();
                out = callStmt.getInt(1);

            } finally {

                if (!Objects.isNull(callStmt)) {
                    callStmt.close();
                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return out == 1;
    }

}
