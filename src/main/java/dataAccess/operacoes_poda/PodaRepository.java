package dataAccess.operacoes_poda;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.Objects;

import dataAccess.DatabaseConnection;
import oracle.jdbc.OracleTypes;

/**
 * The type Poda repository.
 */
public class PodaRepository {


    /**
     * Registar poda boolean.
     *
     * @param date             the date
     * @param parcelaId        the parcela id
     * @param variedadeId      the variedade id
     * @param quantidade       the quantidade
     * @param metodoExecucaoId the metodo execucao id
     * @return the boolean
     */
    public boolean registarPoda(LocalDate date,
                                int parcelaId,
                                int variedadeId,
                                double quantidade,
                                int metodoExecucaoId) {

        CallableStatement callStmt = null;

        try {
            try {
                Connection connection = DatabaseConnection.getInstance().getConnection();
                callStmt = connection.prepareCall("{ ? = call registar_Poda(?,?,?,?,?) }");

                callStmt.registerOutParameter(1, OracleTypes.NUMBER);
                callStmt.setInt(2, parcelaId);
                callStmt.setInt(3, variedadeId);
                callStmt.setDate(4, java.sql.Date.valueOf(date));
                callStmt.setDouble(5, quantidade);
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

