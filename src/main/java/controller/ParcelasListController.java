package controller;

import dataAccess.parcelas.ParcelaRepository;
import dataAccess.Repositories;
import domain.Parcela;

import java.sql.SQLException;
import java.util.List;
import java.util.Objects;

/**
 * The type Parcelas list controller.
 */
public class ParcelasListController {

    private ParcelaRepository parcelaRepository;

    /**
     * Instantiates a new Parcelas list controller.
     */
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

    /**
     * Gets parcelas.
     *
     * @return the parcelas
     * @throws SQLException the sql exception
     */
    public List<Parcela> getParcelas() throws SQLException {
        return parcelaRepository.getParcelas();
    }

    /**
     * Show all parcelas.
     */
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
