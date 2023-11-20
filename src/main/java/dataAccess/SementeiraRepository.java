package dataAccess;

import domain.Sementeira;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

public class SementeiraRepository {

    public SementeiraRepository() {
    }

    public void sementeiraRegister(int operacaoId, int parcelaId, int variedadeId, float quantidade, float area, int metodoExecucaoId) throws SQLException {

        CallableStatement callableStatement = null;

        try {

            Connection connection = DatabaseConnection.getInstance().getConnection();
            callableStatement = connection.prepareCall("{ call registarSementeira(?, ?, ?, ?, ?, ?)}");

            callableStatement.setInt(1, operacaoId);
            callableStatement.setInt(2, parcelaId);
            callableStatement.setInt(3, variedadeId);
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
