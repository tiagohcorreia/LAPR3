package controller;

import dataAccess.Repositories;
import dataAccess.seeding_operations.SeedingOperationsRepository;

import java.sql.Date;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.Objects;

public class SementeiraRegisterController {

    private SeedingOperationsRepository SeedingOperationsRepository;

    public SementeiraRegisterController() {
        getSeedingOperationsRepository();
    }

    private SeedingOperationsRepository getSeedingOperationsRepository() {

        if (Objects.isNull(SeedingOperationsRepository)) {

            Repositories repositories = Repositories.getInstance();
            SeedingOperationsRepository = repositories.getSeedingOperationsRepository();
        }
        return SeedingOperationsRepository;
    }

    public void sementeiraRegister(LocalDate date, int parcelaId, int variedadeId, float quantidade, float area, int metodoExecucaoId) throws SQLException {

        SeedingOperationsRepository.registerSeeding(date,parcelaId, variedadeId, quantidade, area, metodoExecucaoId);
    }
}
