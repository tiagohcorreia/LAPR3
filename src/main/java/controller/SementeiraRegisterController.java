package controller;

import dataAccess.Repositories;
import dataAccess.seeding_operations.SementeiraRepository;

import java.sql.Date;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.Objects;

public class SementeiraRegisterController {

    private SementeiraRepository sementeiraRepository;

    public SementeiraRegisterController() {
        getSementeiraRepository();
    }

    private SementeiraRepository getSementeiraRepository() {

        if (Objects.isNull(sementeiraRepository)) {

            Repositories repositories = Repositories.getInstance();
            sementeiraRepository = repositories.getSementeiraRepository();
        }
        return sementeiraRepository;
    }

    public void sementeiraRegister(LocalDate date, int parcelaId, int variedadeId, float quantidade, float area, int metodoExecucaoId) throws SQLException {

        sementeiraRepository.registerSeeding(date,parcelaId, variedadeId, quantidade, area, metodoExecucaoId);
    }
}
