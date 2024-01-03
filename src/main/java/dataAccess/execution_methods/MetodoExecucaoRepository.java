package dataAccess.execution_methods;

import dataAccess.DatabaseConnection;
import domain.MetodoExecucao;
import oracle.jdbc.OracleType;
import oracle.jdbc.OracleTypes;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

public class MetodoExecucaoRepository {

    public MetodoExecucaoRepository() {
    }

    public List<MetodoExecucao> getMetodosExecucao() {

        CallableStatement callStmt = null;
        ResultSet resultSet = null;
        List<MetodoExecucao> metodosExecucao = null;

        try {
            try {

                Connection connection = DatabaseConnection.getInstance().getConnection();
                callStmt = connection.prepareCall("{ ? = call fncMetodosExecucao() }");

                callStmt.registerOutParameter(1, OracleTypes.CURSOR);

                callStmt.execute();
                resultSet = (ResultSet) callStmt.getObject(1);

                metodosExecucao = resultSetToList(resultSet);

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

        return metodosExecucao;
    }

    private List<MetodoExecucao> resultSetToList(ResultSet resultSet) throws SQLException {

        List<MetodoExecucao> metodosExecucao = new ArrayList<>();

        while (true) {

            if (!resultSet.next()) break;

            MetodoExecucao metodoExecucao = new MetodoExecucao(
                    resultSet.getInt("ID"),
                    resultSet.getString("Nome")

            );
            metodosExecucao.add(metodoExecucao);
        }
        return metodosExecucao;
    }

    public boolean isThereExecutionMethod(int methodId) {
        CallableStatement callStmt = null;
        boolean isThereMethod = false;

        try {
            try {

                Connection connection = DatabaseConnection.getInstance().getConnection();
                callStmt = connection.prepareCall("{ ? = call is_there_execution_method(?) }");

                callStmt.registerOutParameter(1, OracleType.NUMBER);
                callStmt.setInt(2, methodId);

                callStmt.execute();
                int result = callStmt.getInt(1);
                if (result == 1) {
                    isThereMethod = true;
                }

            } finally {

                if (!Objects.isNull(callStmt)) {
                    callStmt.close();
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return isThereMethod;
    }
}
