package controller;

import dataAccess.OperacaoAgricolaRepository;
import dataAccess.Repositories;
import domain.OperacaoAgricola;

import java.sql.SQLException;
import java.util.List;

/**
 * The type Cancelar operacao controller.
 */
public class CancelarOperacaoController {
    /**
     * The Controller 1.
     */
    OperacaoAgricolaRegisterController controller1 = new OperacaoAgricolaRegisterController();

    /**
     * Instantiates a new Cancelar operacao controller.
     */
    public CancelarOperacaoController() {

    }

    /**
     * Show operation list.
     *
     * @throws SQLException the sql exception
     */
    public void showOperationList() throws SQLException {

        this.controller1.printTableData("Operacao_Agricola");
    }
}
