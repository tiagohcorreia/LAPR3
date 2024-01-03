package dataAccess.produtos;

import dataAccess.DatabaseConnection;
import domain.Produto;
import oracle.jdbc.OracleTypes;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

public class ProdutoRepo {

    public List<Produto> getProdutos() {

        CallableStatement callStmt = null;
        ResultSet resultSet = null;
        List<Produto> produtos = null;

        try {
            try {

                Connection connection = DatabaseConnection.getInstance().getConnection();

                callStmt = connection.prepareCall("{ ? = call get_produtos() }");

                callStmt.registerOutParameter(1, OracleTypes.CURSOR);

                callStmt.execute();
                resultSet = (ResultSet) callStmt.getObject(1);

                produtos = resultSetToList(resultSet);

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

        return produtos;
    }

    public List<Produto> getProdutosInParcela(int parcelID) {

        CallableStatement callStmt = null;
        ResultSet resultSet = null;
        List<Produto> produtos = null;

        try {
            try {

                Connection connection = DatabaseConnection.getInstance().getConnection();

                callStmt = connection.prepareCall("{ ? = call get_produtos_in_parcela(?) }");
                callStmt.registerOutParameter(1, OracleTypes.CURSOR);
                callStmt.setInt(2, parcelID);
                callStmt.execute();
                resultSet = (ResultSet) callStmt.getObject(1);

                produtos = resultSetToList(resultSet);

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

        return produtos;
    }

    private List<Produto> resultSetToList(ResultSet resultSet) {

        List<Produto> produtos = new ArrayList<>();

        try {
            while (resultSet.next()) {

                Produto produto = new Produto(
                        resultSet.getInt("id"),
                        resultSet.getString("nome"),
                        -1);
                produtos.add(produto);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return produtos;
    }
}
