package dataAccess;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.Objects;

import oracle.jdbc.OracleTypes;

public class PodaRepository {


    public static void podaRegister(int operacaoId, int parcelaId, int variedadeId, float quantidade, int metodoExecucaoId) throws SQLException {

        CallableStatement callStmt = null;
        try {
            Connection connection = DatabaseConnection.getInstance().getConnection();
            callStmt = connection.prepareCall("{ call REGISTARPODA(?,?,?,?,?) }");

            callStmt.setInt(1, operacaoId);
            callStmt.setInt(2, parcelaId);
            callStmt.setInt(3, variedadeId);
            callStmt.setFloat(4, quantidade);
            callStmt.setInt(5, metodoExecucaoId);

            callStmt.execute();
            connection.commit();
        } finally {
            if (!Objects.isNull(callStmt)) {
                callStmt.close();
            }
        }
    }
}

