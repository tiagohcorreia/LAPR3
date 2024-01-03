package dataAccess.fatores_producao;

import dataAccess.DatabaseConnection;
import domain.FatorProducao;
import oracle.jdbc.OracleTypes;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

public class FatorProducaoRepository {

    public List<FatorProducao> getFatoresProducao() {

        CallableStatement callStmt = null;
        ResultSet resultSet = null;
        List<FatorProducao> fatoresProducao = null;

        try {
            try {

                Connection connection = DatabaseConnection.getInstance().getConnection();

                callStmt = connection.prepareCall("{ ? = call obter_fp() }");

                callStmt.registerOutParameter(1, OracleTypes.CURSOR);

                callStmt.execute();
                resultSet = (ResultSet) callStmt.getObject(1);

                fatoresProducao = resultSetToList(resultSet);

            } finally {

                if (!Objects.isNull(callStmt)) {
                    callStmt.close();
                }
                if (!Objects.isNull(resultSet)) {
                    resultSet.close();
                }
            }
        } catch (SQLException e){
            e.printStackTrace();
        }

        return fatoresProducao;
    }

    private List<FatorProducao> resultSetToList(ResultSet resultSet) throws SQLException {

        List<FatorProducao> fatorProducaoList = new ArrayList<>();

        try {
            while (true) {

                if (!resultSet.next()) break;

                FatorProducao fatorProducao = new FatorProducao(
                        resultSet.getInt("id"),
                        resultSet.getString("nome"),
                        resultSet.getInt("tipo_id"),
                        resultSet.getInt("formulacao_id")
                );
                fatorProducaoList.add(fatorProducao);
            }
        } catch (SQLException e){
            e.printStackTrace();
        }

        return fatorProducaoList;
    }

    public static void fatorProducaoRegister(int operacaoId, int parcelaId, int variedadeId,int fatorProducaoId, int metodoAplicacaoId, float quantidade,float area) throws SQLException {

        CallableStatement callStmt = null;
        try {
            Connection connection = DatabaseConnection.getInstance().getConnection();
            callStmt = connection.prepareCall("{ call registrarAplicacaoFatorProducao(?,?,?,?,?,?,?) }");

            callStmt.setInt(1, operacaoId);
            callStmt.setInt(2, parcelaId);
            callStmt.setInt(3, variedadeId);
            callStmt.setInt(4, fatorProducaoId);
            callStmt.setInt(5, metodoAplicacaoId);
            callStmt.setFloat(6, quantidade);
            callStmt.setFloat(7, area);

            callStmt.execute();
            connection.commit();
        } finally {
            if (!Objects.isNull(callStmt)) {
                callStmt.close();
            }
        }
    }

    public void registerAplicacaoFP(int operacaoId, float quantidade) throws SQLException {
        CallableStatement callStmt = null;

        try {
            Connection connection = DatabaseConnection.getInstance().getConnection();
            callStmt = connection.prepareCall("{ ? = call Registrar_Aplicacao_FPs(?, ?) }");

            // Register the OUT parameter for the function result
            callStmt.registerOutParameter(1, Types.INTEGER);

            // Set the parameters
            callStmt.setInt(2, operacaoId);
            callStmt.setFloat(3, quantidade);

            // Execute the function call
            callStmt.execute();

            // No need to retrieve the result as it's not used

            // Commit the transaction if needed
            connection.commit();
        } finally {
            if (!Objects.isNull(callStmt)) {
                callStmt.close();
            }
        }
    }
}
