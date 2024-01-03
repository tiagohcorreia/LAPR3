package controller;

import dataAccess.execution_methods.MetodoExecucaoRepository;
import dataAccess.Repositories;
import domain.MetodoExecucao;

import java.sql.SQLException;
import java.util.List;
import java.util.Objects;

public class MetodoExecucaoListController {

    private MetodoExecucaoRepository metodoExecucaoRepository;

    public MetodoExecucaoListController() {
        getMetodoExecucao();
    }

    private MetodoExecucaoRepository getMetodoExecucao() {

        if (Objects.isNull(metodoExecucaoRepository)) {

            Repositories repositories = Repositories.getInstance();
            metodoExecucaoRepository = repositories.getMetodoExcucaoRepository();
        }
        return metodoExecucaoRepository;
    }

    public List<MetodoExecucao> getMetodosExecucao() throws SQLException {
        return metodoExecucaoRepository.getMetodosExecucao();
    }

    public void showMetodosExecucao() {

        try {

            System.out.println("Lista de Métodos de Execução");

            List<MetodoExecucao> metodoExecucaos = getMetodosExecucao();

            System.out.printf("%8s %10s %n", "MetodoExecucaoID", "Nome");

            for (MetodoExecucao metodoExecucao : metodoExecucaos) {
                System.out.printf("%8d %10s %n", metodoExecucao.getId(), metodoExecucao.getNome());
            }

        } catch (SQLException e) {

            System.out.println("Database not return the metodos de execução list!\n" + e.getMessage());
        }
    }
}
