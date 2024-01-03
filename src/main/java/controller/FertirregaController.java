package controller;

import dataAccess.DatabaseConnection;
import dataAccess.fatores_producao.FatorProducaoRepository;
import dataAccess.Repositories;
import dataAccess.fertigation_mixes.ReceitasFertirregaRepository;

import java.sql.*;
import java.util.AbstractMap;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

public class FertirregaController {
    private DatabaseConnection database;
    private ReceitasFertirregaRepository receitasFertirregaRepository;
    private FatorProducaoRepository fatorProducaoRepository;

    {
        try {
            database = DatabaseConnection.getInstance();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    private Connection connection;

    public FertirregaController() {
        getFertirregaRepository();
        try {
            connection = DriverManager.getConnection(database.url(), database.user(), database.password());
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    private ReceitasFertirregaRepository getFertirregaRepository() {
        if (Objects.isNull(receitasFertirregaRepository)) {
            Repositories repositories = Repositories.getInstance();
            receitasFertirregaRepository = repositories.getReceitasFertirrega();
            fatorProducaoRepository = repositories.getFatorProducaoRepository();
        }
        return receitasFertirregaRepository;
    }


    public List<Integer> getFpIdsByMix(String mix) {
        List<Integer> fpIds = new ArrayList<>();

        try {
            String findIdQuery = "SELECT id FROM Receita_Fertirrega WHERE nome = ?";
            try (PreparedStatement findIdStatement = connection.prepareStatement(findIdQuery)) {
                findIdStatement.setString(1, mix);
                try (ResultSet resultSet = findIdStatement.executeQuery()) {
                    if (resultSet.next()) {
                        int receitaId = resultSet.getInt("id");

                        String findFpIdsQuery = "SELECT fp_id FROM Receita_FP WHERE receita_id = ?";
                        try (PreparedStatement findFpIdsStatement = connection.prepareStatement(findFpIdsQuery)) {
                            findFpIdsStatement.setInt(1, receitaId);
                            try (ResultSet fpIdsResultSet = findFpIdsStatement.executeQuery()) {
                                while (fpIdsResultSet.next()) {
                                    int fpId = fpIdsResultSet.getInt("fp_id");
                                    fpIds.add(fpId);
                                }
                            }
                        }
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return fpIds;
    }

    public int getProporcaoByFpId(int fpId) {
        int proporcao = 0;

        try {
            String query = "SELECT proporcao FROM Receita_FP WHERE fp_id = ?";
            try (PreparedStatement statement = connection.prepareStatement(query)) {
                statement.setInt(1, fpId);

                try (ResultSet resultSet = statement.executeQuery()) {
                    if (resultSet.next()) {
                        proporcao = resultSet.getInt("proporcao");
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return proporcao;
    }

    public void registerFpIds(int operacaoId,String mix,String setorNome) throws SQLException {
        List<Integer> fpIds = getFpIdsByMix(mix);
        float quantidade = 0;
        for (int fpId : fpIds) {
            quantidade = quantidade + (float) getProporcaoByFpId(fpId);

        }
        List<AbstractMap.SimpleEntry<Integer, Integer>> parcelaVariedadePairs = getParcelaAndVariedade(setorNome);
        fatorProducaoRepository.registerAplicacaoFP(operacaoId,quantidade);
        receitasFertirregaRepository.registerAplicacaoFPVariedade(operacaoId);
        receitasFertirregaRepository.registerParcelasVariedadesAplicadas(operacaoId,parcelaVariedadePairs);
        receitasFertirregaRepository.registerFpAplicados(operacaoId,fpIds);
    }

    public List<AbstractMap.SimpleEntry<Integer, Integer>> getParcelaAndVariedade(String setorNome) {
        List<AbstractMap.SimpleEntry<Integer, Integer>> parcelaVariedadePairs = new ArrayList<>();

        try {
            String findIdQuery = "SELECT id FROM Setor_Rega WHERE nome = ?";
            try (PreparedStatement findIdStatement = connection.prepareStatement(findIdQuery)) {
                findIdStatement.setString(1, setorNome);
                try (ResultSet resultSet = findIdStatement.executeQuery()) {
                    if (resultSet.next()) {
                        int setorId = resultSet.getInt("id");

                        String findDataQuery = "SELECT SP.plantacao_id, P.parcela_id, " +
                                "CASE WHEN PP.variedade_perm_id IS NOT NULL THEN PP.variedade_perm_id ELSE PT.variedade_temp_id END AS variedade_id " +
                                "FROM SetorRega_Plantacao SP " +
                                "JOIN Plantacao P ON SP.plantacao_id = P.id " +
                                "LEFT JOIN Plantacao_Permanente PP ON SP.plantacao_id = PP.plantacao_id " +
                                "LEFT JOIN Plantacao_Temporaria PT ON SP.plantacao_id = PT.plantacao_id " +
                                "WHERE SP.setor_id = ?";

                        try (PreparedStatement findDataStatement = connection.prepareStatement(findDataQuery)) {
                            findDataStatement.setInt(1, setorId);

                            try (ResultSet dataResultSet = findDataStatement.executeQuery()) {
                                while (dataResultSet.next()) {
                                    int parcelaId = dataResultSet.getInt("parcela_id");
                                    int variedadeId = dataResultSet.getInt("variedade_id");

                                    parcelaVariedadePairs.add(new AbstractMap.SimpleEntry<>(parcelaId, variedadeId));
                                }
                            }
                        }
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return parcelaVariedadePairs;
    }
}
