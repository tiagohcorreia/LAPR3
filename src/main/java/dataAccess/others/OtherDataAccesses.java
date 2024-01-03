package dataAccess.others;

import dataAccess.DatabaseConnection;
import oracle.jdbc.OracleTypes;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.Objects;

public class OtherDataAccesses {

    public ResultSet obterFpPorTipo(int parcelaID,
                                    LocalDate dataInicio,
                                    LocalDate dataFim) {

        CallableStatement callStmt = null;
        ResultSet resultSet = null;

        try {
            try {

                Connection connection = DatabaseConnection.getInstance().getConnection();
                callStmt = connection.prepareCall("{ ? = call obter_quantidade_fp_por_tipo(?, ?, ?) }");

                callStmt.registerOutParameter(1, OracleTypes.CURSOR);
                callStmt.setInt(2, parcelaID);
                callStmt.setDate(3, java.sql.Date.valueOf(dataInicio));
                callStmt.setDate(4, java.sql.Date.valueOf(dataFim));

                callStmt.execute();
                resultSet = (ResultSet) callStmt.getObject(1);

            } finally {

            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return resultSet;
    }

    public ResultSet obterAplicacoesFpPorTipo(LocalDate dataInicio,
                                    LocalDate dataFim) {

        CallableStatement callStmt = null;
        ResultSet resultSet = null;

        try {
            try {

                Connection connection = DatabaseConnection.getInstance().getConnection();
                callStmt = connection.prepareCall("{ ? = call obter_aplicacoes_fp_por_tipo(?, ?) }");

                callStmt.registerOutParameter(1, OracleTypes.CURSOR);
                callStmt.setDate(2, java.sql.Date.valueOf(dataInicio));
                callStmt.setDate(3, java.sql.Date.valueOf(dataFim));

                callStmt.execute();
                resultSet = (ResultSet) callStmt.getObject(1);

            } finally {

            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return resultSet;
    }

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
                resultSet = (ResultSet) callStmt.getObject(1);

            } finally {

            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return resultSet;
    }

    public ResultSet obterFatoresProducaoAplicados(int parcelaID,
                                                   LocalDate dataInferior,
                                                   LocalDate dataSuperior) {

        CallableStatement callStmt = null;
        ResultSet resultSet = null;

        try {
            try {

                Connection connection = DatabaseConnection.getInstance().getConnection();
                callStmt = connection.prepareCall("{ ? = call obterParcelasFP(?, ?, ?) }");

                callStmt.registerOutParameter(1, OracleTypes.CURSOR);
                callStmt.setInt(2, parcelaID);
                callStmt.setDate(3, java.sql.Date.valueOf(dataInferior));
                callStmt.setDate(4, java.sql.Date.valueOf(dataSuperior));

                callStmt.execute();
                resultSet = (ResultSet) callStmt.getObject(1);

            } finally {

            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return resultSet;
    }

    public ResultSet obterOperacoes(int parcelaID,
                                    LocalDate dataInferior,
                                    LocalDate dataSuperior) {

        CallableStatement callStmt = null;
        ResultSet resultSet = null;

        try {
            try {

                Connection connection = DatabaseConnection.getInstance().getConnection();
                callStmt = connection.prepareCall("{ ? = call obterOperacoesPorParcela(?, ?, ?) }");

                callStmt.registerOutParameter(1, OracleTypes.CURSOR);
                callStmt.setInt(2, parcelaID);
                callStmt.setDate(3, java.sql.Date.valueOf(dataInferior));
                callStmt.setDate(4, java.sql.Date.valueOf(dataSuperior));

                callStmt.execute();
                resultSet = (ResultSet) callStmt.getObject(1);

            } finally {

            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return resultSet;
    }

    public ResultSet obterAplicacoesFP(int parcelaID,
                                       LocalDate dataInferior,
                                       LocalDate dataSuperior,
                                       int tipoFpId) {

        CallableStatement callStmt = null;
        ResultSet resultSet = null;

        try {
            try {

                Connection connection = DatabaseConnection.getInstance().getConnection();
                callStmt = connection.prepareCall("{ ? = call obterAplicacoesFpDentroDeIntervalo(?, ?, ?, ?) }");

                callStmt.registerOutParameter(1, OracleTypes.CURSOR);
                callStmt.setInt(2, parcelaID);
                callStmt.setDate(3, java.sql.Date.valueOf(dataInferior));
                callStmt.setDate(4, java.sql.Date.valueOf(dataSuperior));
                callStmt.setInt(5, tipoFpId);

                callStmt.execute();
                resultSet = (ResultSet) callStmt.getObject(1);

            } finally {

            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return resultSet;
    }

    public ResultSet obterTotaisMensaisRega(LocalDate dataInferior,
                                            LocalDate dataSuperior) {

        CallableStatement callStmt = null;
        ResultSet resultSet = null;

        try {
            try {

                Connection connection = DatabaseConnection.getInstance().getConnection();
                callStmt = connection.prepareCall("{ ? = call getMonthlyWateringTotal(?, ?) }");

                callStmt.registerOutParameter(1, OracleTypes.CURSOR);
                callStmt.setDate(2, java.sql.Date.valueOf(dataInferior));
                callStmt.setDate(3, java.sql.Date.valueOf(dataSuperior));

                callStmt.execute();
                resultSet = (ResultSet) callStmt.getObject(1);

            } finally {

            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return resultSet;
    }
}
