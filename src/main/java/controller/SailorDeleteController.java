package controller;

import dataAccess.Repositories;
import dataAccess.SailorRepository;

import java.sql.SQLException;
import java.util.Objects;

public class SailorDeleteController {

    private SailorRepository sailorRepository;

    public SailorDeleteController() {
        getSailorRepository();
    }

    private SailorRepository getSailorRepository() {

        if (Objects.isNull(sailorRepository)) {

            Repositories repositories = Repositories.getInstance();
            sailorRepository = repositories.getSailorRepository();
        }
        return sailorRepository;
    }

    public int sailorDelete(int sailorId) throws SQLException {
        return sailorRepository.sailorDelete(sailorId);
    }
}
