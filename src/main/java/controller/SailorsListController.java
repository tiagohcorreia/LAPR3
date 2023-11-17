package controller;

import dataAccess.Repositories;
import dataAccess.SailorRepository;
import domain.Sailor;

import java.sql.SQLException;
import java.util.List;
import java.util.Objects;

public class SailorsListController {

    private SailorRepository sailorRepository;

    public SailorsListController() {
        getSailorRepository();
    }

    private SailorRepository getSailorRepository() {

        if (Objects.isNull(sailorRepository)) {

            Repositories repositories = Repositories.getInstance();
            sailorRepository = repositories.getSailorRepository();
        }
        return sailorRepository;
    }

    public List<Sailor> getSailors() throws SQLException {
        return sailorRepository.getSailors();
    }

}
