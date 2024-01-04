package dataAccess.operacoes_colheita;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

import dataAccess.DatabaseConnection;
import domain.Colheita;
import oracle.jdbc.OracleTypes;

/**
 * The type Colheita repository.
 */
public class ColheitaRepository {

    /**
     * Gets colheitas.
     *
     * @return the colheitas
     */
    public List<Colheita> getColheitas() {

        CallableStatement callStmt = null;
        ResultSet resultSet = null;
        List<Colheita> colheitas = null;

        try {
            try {
                Connection connection = DatabaseConnection.getInstance().getConnection();
                callStmt = connection.prepareCall("{ ? = call fncColheitas() }");

                callStmt.registerOutParameter(1, OracleTypes.CURSOR);

                callStmt.execute();
                resultSet = (ResultSet) callStmt.getObject(1);

                colheitas = resultSetToList(resultSet);
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

        return colheitas;
    }

    /**
     * Registar colheita boolean.
     *
     * @param data             the data
     * @param parcelaId        the parcela id
     * @param produtoId        the produto id
     * @param quantidade       the quantidade
     * @param metodoExecucaoId the metodo execucao id
     * @return the boolean
     */
    public boolean registarColheita(LocalDate data, int parcelaId, int produtoId, double quantidade, int metodoExecucaoId) {

        CallableStatement callStmt = null;

        try {
            try {
                Connection connection = DatabaseConnection.getInstance().getConnection();
                callStmt = connection.prepareCall("{ ? = call registar_Colheita(?,?,?,?,?) }");

                callStmt.registerOutParameter(1, OracleTypes.NUMBER);
                callStmt.setDate(2, java.sql.Date.valueOf(data));
                callStmt.setInt(3, parcelaId);
                callStmt.setInt(4, produtoId);
                callStmt.setDouble(5, quantidade);
                callStmt.setInt(6, metodoExecucaoId);

                callStmt.execute();
                return callStmt.getInt(1) == 1;
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

    /**
     * Colheita delete int.
     *
     * @param operacaoId the operacao id
     * @return the int
     * @throws SQLException the sql exception
     */
    public int colheitaDelete(int operacaoId) throws SQLException {

        CallableStatement callStmt = null;
        int deletedRows = 0;
        try {
            Connection connection = DatabaseConnection.getInstance().getConnection();
            callStmt = connection.prepareCall("{ ? = call fncColheitaDelete(?) }");

            callStmt.registerOutParameter(1, OracleTypes.INTEGER);
            callStmt.setInt(2, operacaoId);

            callStmt.execute();
            deletedRows = callStmt.getInt(1);

            connection.commit();

        } finally {
            if (!Objects.isNull(callStmt)) {
                callStmt.close();
            }
        }
        return deletedRows;
    }

    private List<Colheita> resultSetToList(ResultSet resultSet) throws SQLException {

        List<Colheita> colheitas = new ArrayList<>();

        while (true) {

            if (!resultSet.next()) break;
            Colheita colheita = new Colheita(
                    resultSet.getInt("operacaoId"),
                    resultSet.getInt("parcelaId"),
                    resultSet.getInt("produtoId"),
                    resultSet.getInt("metodoExecucaoId"),
                    resultSet.getFloat("quantidade")
            );
            colheitas.add(colheita);
        }
        return colheitas;
    }

}