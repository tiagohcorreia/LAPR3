package ui.funcionalidades.us_bd30;

import controller.CancelarOperacaoController;
import controller.OperacaoAgricolaRegisterController;
import dataAccess.OperacaoAgricolaRepository;
import dataAccess.Repositories;
import ui.utils.Utils;

import java.sql.SQLException;

/**
 * The type Cancelar operacao ui.
 */
public class CancelarOperacaoUI implements Runnable {
    private OperacaoAgricolaRepository repository = Repositories.getInstance().getOperacaoAgricolaRepository();
    private CancelarOperacaoController controller = new CancelarOperacaoController();

    @Override
    public void run() {

        try {

            controller.showOperationList();

            int SelectedId = Utils.readIntegerFromConsole("Escolha o Id da operação que deseja anular \n");

            int optValidation = Utils.readIntegerFromConsole("1-CONFIRMAR\0-CANCELAR");

            if (optValidation == 1) {

                this.repository.operacaoAgricolaCancel(SelectedId);
                System.out.println("Operação Agrícola Cancelada com sucesso.");

            } else {

                System.out.println("Cencelamento da Operação Agrícola abortada");
            }


        } catch (SQLException e) {

            System.err.println("Não foi possível cancelar a operação agrícola!\n" + e.getMessage());

        } catch (Exception e) {

            System.err.println("Ocorreu algum erro!");
            e.printStackTrace();
        }

    }
}
