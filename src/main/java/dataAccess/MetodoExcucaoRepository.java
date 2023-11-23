package dataAccess;

import domain.MetodoExecucao;
import oracle.jdbc.OracleTypes;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

public class MetodoExcucaoRepository {

    public MetodoExcucaoRepository() {
    }

    public List<MetodoExecucao> getMetodosExecucao() throws SQLException {

        CallableStatement callStmt = null;
        ResultSet resultSet = null;
        List<MetodoExecucao> metodosExecucao = null;

        try {

            Connection connection = DatabaseConnection.getInstance().getConnection();
            callStmt = connection.prepareCall("{ ? = call fncMetodoExecucao() }");

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
        return metodosExecucao;
    }

    private List<MetodoExecucao> resultSetToList(ResultSet resultSet) throws SQLException {

        List<MetodoExecucao> metodosExecucao = new ArrayList<>();

        while (true) {

            if (!resultSet.next()) break;

            MetodoExecucao metodoExecucao = new MetodoExecucao(
                    resultSet.getInt("MetodoExecucaoID"),
                    resultSet.getString("Nome")

            );
            metodosExecucao.add(metodoExecucao);
        }
        return metodosExecucao;
    }
}
