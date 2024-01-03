package controller;

import dataAccess.metodos_execucao.MetodoExecucaoRepository;
import dataAccess.Repositories;
import domain.MetodoExecucao;

import java.sql.SQLException;
import java.util.List;
import java.util.Objects;

/**
 * The type Metodo execucao list controller.
 */
public class MetodoExecucaoListController {

    private MetodoExecucaoRepository metodoExecucaoRepository;

    /**
     * Instantiates a new Metodo execucao list controller.
     */
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

    /**
     * Gets metodos execucao.
     *
     * @return the metodos execucao
     * @throws SQLException the sql exception
     */
    public List<MetodoExecucao> getMetodosExecucao() throws SQLException {
        return metodoExecucaoRepository.getMetodosExecucao();
    }

    /**
     * Show metodos execucao.
     */
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
