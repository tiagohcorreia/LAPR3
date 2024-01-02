package dataAccess.seeding_operations;

import dataAccess.DatabaseConnection;
import domain.Sementeira;
import oracle.jdbc.OracleTypes;

import java.sql.*;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

public class SeedingOperationsRepository {

    public boolean registerSeeding(LocalDate date, int parcelaId, int variedadeId, float quantidade, float area, int metodoExecucaoId) {

        CallableStatement callableStatement = null;
        try {
            try {

                Connection connection = DatabaseConnection.getInstance().getConnection();

                callableStatement = connection.prepareCall("{ ? = call registar_Sementeira(?, ?, ?, ?, ?, ?)}");
                callableStatement.registerOutParameter(1, OracleTypes.NUMBER);
                callableStatement.setInt(2, parcelaId);
                callableStatement.setInt(3, variedadeId);
                callableStatement.setDate(4, java.sql.Date.valueOf(date));
                callableStatement.setFloat(5, quantidade);
                callableStatement.setFloat(6, area);
                callableStatement.setInt(7, metodoExecucaoId);

                callableStatement.execute();
                int out = callableStatement.getInt(1);
                return out == 1;

            } finally {

                if (!Objects.isNull(callableStatement)) {
                    callableStatement.close();
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    private List<Sementeira> resultSetToList(ResultSet resultSet) throws SQLException {

        List<Sementeira> sementeiras = new ArrayList<>();

        while (true) {

            if (!resultSet.next()) break;

            Sementeira sementeira = new Sementeira(
                    resultSet.getInt("operacaoId"),
                    resultSet.getInt("parcelaId"),
                    resultSet.getInt("veriedadeId"),
                    resultSet.getFloat("quantidade"),
                    resultSet.getFloat("area"),
                    resultSet.getInt("metodoExecucaoId")
            );
            sementeiras.add(sementeira);
        }
        return sementeiras;
    }
}
