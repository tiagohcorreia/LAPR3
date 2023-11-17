package controller;

import dataAccess.Repositories;
import dataAccess.SailorRepository;

import java.sql.SQLException;
import java.util.Date;
import java.util.Objects;

public class SailorRegisterController {

    private SailorRepository sailorRepository;

    public SailorRegisterController() {
        getSailorRepository();
    }

    private SailorRepository getSailorRepository() {

        if (Objects.isNull(sailorRepository)) {

            Repositories repositories = Repositories.getInstance();
            sailorRepository = repositories.getSailorRepository();
        }
        return sailorRepository;
    }

    public void sailorRegister(int sailorId, String name, int rating, Date birthday) throws SQLException {
        sailorRepository.sailorRegister(sailorId, name, rating, birthday);
    }
}
