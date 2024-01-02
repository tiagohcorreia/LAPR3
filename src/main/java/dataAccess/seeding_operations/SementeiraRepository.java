package dataAccess.seeding_operations;

import dataAccess.DatabaseConnection;
import domain.Sementeira;

import java.sql.*;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

public class SementeiraRepository {

    public void registerSeeding(LocalDate date, int parcelaId, int variedadeId, float quantidade, float area, int metodoExecucaoId) {

        CallableStatement callableStatement = null;
        try {
            try {

                Connection connection = DatabaseConnection.getInstance().getConnection();

                callableStatement = connection.prepareCall("{ call registar_Sementeira(?, ?, ?, ?, ?, ?)}");

                callableStatement.setInt(1, parcelaId);
                callableStatement.setInt(2, variedadeId);
                callableStatement.setDate(3, Date.valueOf(date));
                callableStatement.setFloat(4, quantidade);
                callableStatement.setFloat(5, area);
                callableStatement.setInt(6, metodoExecucaoId);

                callableStatement.execute();
                connection.commit();

            } finally {

                if (!Objects.isNull(callableStatement)) {

                    callableStatement.close();
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
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
