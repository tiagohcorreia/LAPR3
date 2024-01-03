package controller;

import dataAccess.fatores_producao.FatorProducaoRepository;
import dataAccess.Repositories;
import domain.FatorProducao;

import java.sql.SQLException;
import java.util.List;
import java.util.Objects;

public class FatorProducaoListController {

    private FatorProducaoRepository fatorProducaoRepository;

    public FatorProducaoListController() {
        getFatorProducaoRepository();
    }

    private FatorProducaoRepository getFatorProducaoRepository() {

        if (Objects.isNull(fatorProducaoRepository)) {

            Repositories repositories = Repositories.getInstance();
            fatorProducaoRepository = repositories.getFatorProducaoRepository();
        }
        return fatorProducaoRepository;
    }

    public List<FatorProducao> getFatoresProducao() throws SQLException {
        return fatorProducaoRepository.getFatoresProducao();
    }

    public void showAllFatoresProducao() {

        try {

            System.out.println("Lista de Fatores Produção");

            List<FatorProducao> fatorProducaoList = getFatoresProducao();

            System.out.printf("%8s %10s %8s %n", "ParcelaId", "Nome", "Area");

            for (FatorProducao fatorProducao : fatorProducaoList) {
                System.out.printf("%8d %10s %8d %n", fatorProducao.getID(), fatorProducao.getName(), fatorProducao.getTipoId(), fatorProducao.getFormulacaoId());
            }

        } catch (SQLException e) {

            System.out.println("Database not return the fatores produção list!\n" + e.getMessage());
        }
    }
}
