package dataAccess.aplicacoes_fp;

import dataAccess.DatabaseConnection;
import oracle.jdbc.OracleTypes;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.Objects;

public class AplicacaoFPRepo {

    public boolean registarAplicacaoFPSolo(int parcelaID,
                                           double quantidade,
                                           String unidade,
                                           double area,
                                           int fpID,
                                           LocalDate data) {
        CallableStatement callStmt = null;

        try {
            try {
                Connection connection = DatabaseConnection.getInstance().getConnection();
                callStmt = connection.prepareCall("{ ? = call registrar_Aplicacao_FP_solo(?,?,?,?,?,?) }");

                callStmt.registerOutParameter(1, OracleTypes.NUMBER);
                callStmt.setInt(2, parcelaID);
                callStmt.setDouble(3, quantidade);
                callStmt.setString(4, unidade);
                callStmt.setDouble(5, area);
                callStmt.setInt(6, fpID);
                callStmt.setDate(7, java.sql.Date.valueOf(data));

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

    public boolean registarAplicacaoFPVariedade(int parcelaID,
                                                int variedadeID,
                                                int metodoAplicacaoID,
                                                double quantidade,
                                                String unidade,
                                                int fpID,
                                                LocalDate data) {
        CallableStatement callStmt = null;

        try {
            try {
                Connection connection = DatabaseConnection.getInstance().getConnection();
                callStmt = connection.prepareCall("{ ? = call registrar_Aplicacao_FP_variedade(?,?,?,?,?,?,?) }");

                callStmt.registerOutParameter(1, OracleTypes.NUMBER);
                callStmt.setInt(2, parcelaID);
                callStmt.setInt(3, variedadeID);
                callStmt.setInt(4, metodoAplicacaoID);
                callStmt.setDouble(5, quantidade);
                callStmt.setString(6, unidade);
                callStmt.setInt(7, fpID);
                callStmt.setDate(8, java.sql.Date.valueOf(data));

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
