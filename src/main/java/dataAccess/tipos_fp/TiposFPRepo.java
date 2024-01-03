package dataAccess.tipos_fp;

import dataAccess.DatabaseConnection;
import domain.SetorRega;
import domain.TipoFP;
import oracle.jdbc.OracleTypes;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Objects;

public class TiposFPRepo {

    public ArrayList<TipoFP> obterTiposFP() {

        CallableStatement callStmt = null;
        ResultSet resultSet = null;
        ArrayList<TipoFP> sectors = null;

        try {
            try {

                Connection connection = DatabaseConnection.getInstance().getConnection();
                callStmt = connection.prepareCall("{ ? = call obter_tipos_fp() }");
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
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return sectors;
    }

    private ArrayList<TipoFP> resultSetToList(ResultSet resultSet) {

        ArrayList<TipoFP> tiposFP = new ArrayList<>();
        try {
            while (resultSet.next()) {

                TipoFP tipoFP = new TipoFP(
                        resultSet.getInt("id"),
                        resultSet.getString("tipo")
                );
                tiposFP.add(tipoFP);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return tiposFP;
    }
}
