package dataAccess.metodos_aplicacao;

import dataAccess.DatabaseConnection;
import domain.MetodoAplicacao;
import oracle.jdbc.OracleTypes;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Objects;

public class MetodosAplicacaoRepo {

    public ArrayList<MetodoAplicacao> getMetodosAplicacao(){
        CallableStatement callStmt = null;
        ResultSet resultSet = null;
        ArrayList<MetodoAplicacao> metodosAplicacao = null;

        try {
            try {

                Connection connection = DatabaseConnection.getInstance().getConnection();
                callStmt = connection.prepareCall("{ ? = call get_metodos_aplicacao() }");

                callStmt.registerOutParameter(1, OracleTypes.CURSOR);

                callStmt.execute();
                resultSet = (ResultSet) callStmt.getObject(1);

                metodosAplicacao = resultSetToList(resultSet);

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

        return metodosAplicacao;
    }

    private ArrayList<MetodoAplicacao> resultSetToList(ResultSet resultSet) {

        ArrayList<MetodoAplicacao> metodosAplicacao = new ArrayList<>();

        try{

            while (resultSet.next()) {

                MetodoAplicacao metodoAplicacao = new MetodoAplicacao(
                        resultSet.getInt("id"),
                        resultSet.getString("tipo")
                );
                metodosAplicacao.add(metodoAplicacao);
            }
        } catch (SQLException e){
            e.printStackTrace();
        }

        return metodosAplicacao;
    }
}
