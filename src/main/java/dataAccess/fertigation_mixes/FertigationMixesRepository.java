package dataAccess.fertigation_mixes;

import dataAccess.DatabaseConnection;
import oracle.jdbc.OracleTypes;
import domain.FertigationMix;
import org.apache.commons.lang3.tuple.Pair;

import java.sql.*;
import java.util.AbstractMap;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

public class FertigationMixesRepository {




    public ArrayList<FertigationMix> getFertigationMixes() {

        CallableStatement callStmt = null;
        ResultSet resultSet = null;
        ArrayList<FertigationMix> mixes = null;



        try{
            try {

                Connection connection = DatabaseConnection.getInstance().getConnection();
                callStmt = connection.prepareCall("{ ? = call get_fertigation_mixes() }");
                callStmt.registerOutParameter(1, OracleTypes.CURSOR);
                callStmt.execute();
                resultSet = (ResultSet) callStmt.getObject(1);

                mixes = resultSetToList(resultSet);

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

        return mixes;
    }

    private ArrayList<FertigationMix> resultSetToList(ResultSet resultSet) throws SQLException {

        ArrayList<FertigationMix> mixes = new ArrayList<>();

        while (resultSet.next()) {

            FertigationMix mix = new FertigationMix(
                    resultSet.getInt("id"),
                    resultSet.getString("nome")
            );
            mixes.add(mix);
        }
        return mixes;
    }

    public boolean isThereMix(String mixName) {
        CallableStatement callStmt = null;
        int out = -1;

        try {

            try {
                Connection connection = DatabaseConnection.getInstance().getConnection();
                callStmt = connection.prepareCall("{ ? = call is_there_mix(?) }");
                callStmt.registerOutParameter(1, OracleTypes.NUMBER);
                callStmt.setString(2, mixName);
                callStmt.execute();
                out = callStmt.getInt(1);

            } finally {

                if (!Objects.isNull(callStmt)) {
                    callStmt.close();
                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return out == 1;
    }

    public void registerFpAplicados(int operacaoId, List<Integer> fpIds) throws SQLException {
        CallableStatement callStmt = null;

        try {
            Connection connection = DatabaseConnection.getInstance().getConnection();


            callStmt = connection.prepareCall("{ ? = call LOC.REGISTRARFPAPLICADOS(?, ?) }");

            callStmt.registerOutParameter(1, Types.INTEGER);

            for (int fpId : fpIds) {

                callStmt.setInt(2, operacaoId);
                callStmt.setInt(3, fpId);


                callStmt.execute();

                int result = callStmt.getInt(1);

                connection.commit();
            }
        } finally {

            if (!Objects.isNull(callStmt)) {
                callStmt.close();
            }
        }
    }

    public void registerAplicacaoFPVariedade(int operacaoId) throws SQLException {
        CallableStatement callStmt = null;
        int metodoAplicacaoId = 4;

        try {
            Connection connection = DatabaseConnection.getInstance().getConnection();
            callStmt = connection.prepareCall("{ ? = call REGISTRAR_APLICACAO_FP_VARIEDADE(?, ?) }");

            callStmt.registerOutParameter(1, Types.INTEGER);
            callStmt.setInt(2, operacaoId);
            callStmt.setInt(3, metodoAplicacaoId);

            callStmt.execute();

            int result = callStmt.getInt(1);

            if (result == 1) {

                connection.commit();
            } else {

                connection.rollback();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            if (callStmt != null) {
                callStmt.close();
            }
        }
    }

    public void registerParcelasVariedadesAplicadas(int operacaoId, List<AbstractMap.SimpleEntry<Integer, Integer>> parcelaVariedadePairs) throws SQLException {
        CallableStatement callStmt = null;

        try {
            Connection connection = DatabaseConnection.getInstance().getConnection();

            callStmt = connection.prepareCall("{ ? = call LOC.registrarPVAplicadas(?, ?, ?) }");

            callStmt.registerOutParameter(1, Types.INTEGER);

            for (AbstractMap.SimpleEntry<Integer, Integer> pair : parcelaVariedadePairs) {
                int parcelaId = pair.getKey();
                int variedadeId = pair.getValue();


                if (isEntryExists(connection, operacaoId, parcelaId, variedadeId)) {
                    continue;
                }


                callStmt.setInt(2, operacaoId);
                callStmt.setInt(3, parcelaId);
                callStmt.setInt(4, variedadeId);

                callStmt.execute();

                int result = callStmt.getInt(1);

                if (result == 1) {

                    connection.commit();
                } else {
                    connection.rollback();
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            if (callStmt != null) {
                callStmt.close();
            }
        }
    }


    private boolean isEntryExists(Connection connection, int operacaoId, int parcelaId, int variedadeId) throws SQLException {
        String checkQuery = "SELECT COUNT(*) FROM LOC.Parcelas_Variedades_Aplicadas WHERE Operacao_id = ? AND Parcela_id = ? AND Variedade_id = ?";
        try (PreparedStatement checkStmt = connection.prepareStatement(checkQuery)) {
            checkStmt.setInt(1, operacaoId);
            checkStmt.setInt(2, parcelaId);
            checkStmt.setInt(3, variedadeId);

            try (ResultSet resultSet = checkStmt.executeQuery()) {
                if (resultSet.next()) {
                    int count = resultSet.getInt(1);
                    return count > 0;
                }
            }
        }
        return false;
    }
}

