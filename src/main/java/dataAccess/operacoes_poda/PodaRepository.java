package dataAccess.operacoes_poda;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.Objects;

import dataAccess.DatabaseConnection;
import oracle.jdbc.OracleTypes;

public class PodaRepository {


    public boolean podaRegister(LocalDate date,
                                int parcelaId,
                                int variedadeId,
                                float quantidade,
                                int metodoExecucaoId) {

        CallableStatement callStmt = null;

        try {
            try {
                Connection connection = DatabaseConnection.getInstance().getConnection();
                callStmt = connection.prepareCall("{ ? = call REGISTARPODA(?,?,?,?,?) }");

                callStmt.registerOutParameter(1, OracleTypes.NUMBER);
                callStmt.setInt(2, parcelaId);
                callStmt.setInt(3, variedadeId);
                callStmt.setDate(4, java.sql.Date.valueOf(date));
                callStmt.setFloat(5, quantidade);
                callStmt.setInt(6, metodoExecucaoId);

                callStmt.execute();
                int out = callStmt.getInt(1);
                return out == 1;

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
}

