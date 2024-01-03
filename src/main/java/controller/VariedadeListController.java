package controller;

import dataAccess.Repositories;
import dataAccess.variedades.VariedadeRepository;
import domain.Variedade;

import java.sql.SQLException;
import java.util.List;
import java.util.Objects;

/**
 * The type Variedade list controller.
 */
public class VariedadeListController {

    private VariedadeRepository variedadeRepository;

    /**
     * Instantiates a new Variedade list controller.
     */
    public VariedadeListController() {
        getVariedadeRepository();
    }

    private VariedadeRepository getVariedadeRepository() {

        if (Objects.isNull(variedadeRepository)) {

            Repositories repositories = Repositories.getInstance();
            variedadeRepository = repositories.getVariedadeRepository();
        }
        return variedadeRepository;
    }

    /**
     * Gets variedades.
     *
     * @return the variedades
     * @throws SQLException the sql exception
     */
    public List<Variedade> getVariedades() throws SQLException {
        return variedadeRepository.getVarieties();
    }

    /**
     * Show variedades.
     */
    public void showVariedades() {

        try {

            System.out.println("Lista de Variedades");

            List<Variedade> variedades = getVariedades();

            System.out.printf("%8s %10s %8s %12s %n", "SailorId", "Name", "Rating", "Birthday");

            for (Variedade v : variedades) {
                System.out.printf("%8d %10s %8d %n", v.getId(), v.getNome(), v.getCulturaId());
            }

        } catch (SQLException e) {

            System.out.println("Database not return the variedades list!\n" + e.getMessage());
        }
    }
}


