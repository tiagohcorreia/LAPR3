package dataAccess.others;

import dataAccess.DatabaseConnection;
import domain.FatorProducao;
import oracle.jdbc.OracleTypes;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.List;
import java.util.Objects;

public class OtherDataAccesses {

    public ResultSet produtosColhidosNumaParcela(int parcelaID,
                                                 LocalDate dataInferior,
                                                 LocalDate dataSuperior) {

        CallableStatement callStmt = null;
        ResultSet resultSet = null;

        try {
            try {

                Connection connection = DatabaseConnection.getInstance().getConnection();
                callStmt = connection.prepareCall("{ ? = call obterProdutosEmParcelaDeIntervalo(?, ?, ?) }");

                callStmt.registerOutParameter(1, OracleTypes.CURSOR);
                callStmt.setDate(2, java.sql.Date.valueOf(dataInferior));
                callStmt.setDate(3, java.sql.Date.valueOf(dataSuperior));
                callStmt.setInt(4, parcelaID);

                callStmt.execute();
                resultSet = callStmt.getResultSet();

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
        return resultSet;
    }
}
