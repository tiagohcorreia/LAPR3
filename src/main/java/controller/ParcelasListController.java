package controller;

import dataAccess.parcelas.ParcelaRepository;
import dataAccess.Repositories;
import domain.Parcela;

import java.sql.SQLException;
import java.util.List;
import java.util.Objects;

public class ParcelasListController {

    private ParcelaRepository parcelaRepository;

    public ParcelasListController() {
        getParcelasRepository();
    }

    private ParcelaRepository getParcelasRepository() {

        if (Objects.isNull(parcelaRepository)) {

            Repositories repositories = Repositories.getInstance();
            parcelaRepository = repositories.getParcelaRepository();
        }
        return parcelaRepository;
    }

    public List<Parcela> getParcelas() throws SQLException {
        return parcelaRepository.getParcelas();
    }

    public void showAllParcelas() {

        try {

            System.out.println("Lista de Parcelas");

            List<Parcela> parcelas = getParcelas();

            System.out.printf("%8s %10s %8s %n", "ParcelaId", "Nome", "Area");

            for (Parcela parcela : parcelas) {
                System.out.printf("%8d %10s %8d %n", parcela.getId(), parcela.getNome(), parcela.getArea());
            }

        } catch (SQLException e) {

            System.out.println("Database not return the parcelas list!\n" + e.getMessage());
        }
    }
}
