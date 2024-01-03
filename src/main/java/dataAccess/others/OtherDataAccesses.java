package dataAccess.others;

import dataAccess.DatabaseConnection;
import oracle.jdbc.OracleTypes;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.Objects;

/**
 * The type Other data accesses.
 */
public class OtherDataAccesses {

    /**
     * Obter fp por tipo result set.
     *
     * @param parcelaID  the parcela id
     * @param dataInicio the data inicio
     * @param dataFim    the data fim
     * @return the result set
     */
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

    /**
     * Obter aplicacoes fp por tipo result set.
     *
     * @param dataInicio the data inicio
     * @param dataFim    the data fim
     * @return the result set
     */
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

    /**
     * Produtos colhidos numa parcela result set.
     *
     * @param parcelaID    the parcela id
     * @param dataInferior the data inferior
     * @param dataSuperior the data superior
     * @return the result set
     */
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

    /**
     * Obter fatores producao aplicados result set.
     *
     * @param parcelaID    the parcela id
     * @param dataInferior the data inferior
     * @param dataSuperior the data superior
     * @return the result set
     */
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

    /**
     * Obter operacoes result set.
     *
     * @param parcelaID    the parcela id
     * @param dataInferior the data inferior
     * @param dataSuperior the data superior
     * @return the result set
     */
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

    /**
     * Obter aplicacoes fp result set.
     *
     * @param parcelaID    the parcela id
     * @param dataInferior the data inferior
     * @param dataSuperior the data superior
     * @param tipoFpId     the tipo fp id
     * @return the result set
     */
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

    /**
     * Obter totais mensais rega result set.
     *
     * @param dataInferior the data inferior
     * @param dataSuperior the data superior
     * @return the result set
     */
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
