package ui.funcionalidades;

import controller.MetodoExecucaoListController;
import controller.ParcelasListController;
import controller.SementeiraRegisterController;
import controller.VariedadeListController;
import ui.utils.Utils;

import java.sql.SQLException;

public class SementeiraRegisterUI implements Runnable {
    private SementeiraRegisterController controller;
    private ParcelasListController controller2;
    private VariedadeListController controller3;
    private MetodoExecucaoListController controller4;

    public SementeiraRegisterUI() {

        controller = new SementeiraRegisterController();
        controller2 = new ParcelasListController();
        controller3 = new VariedadeListController();
        controller4 = new MetodoExecucaoListController();
    }

    @Override
    public void run() {

        try {

            System.out.println("Registar Sementeira");

            controller2.showAllParcelas();

            int parcelaId = Utils.readIntegerFromConsole("Insira a ID da parcela");

            controller3.showVariedades();

            int variedadeId = Utils.readIntegerFromConsole("Insira a ID da variedade");

            controller4.showMetodosExecucao();

            int metodoExecucaoId = Utils.readIntegerFromConsole("Insira o ID do método de execução");

            float quantidade = Utils.readFloatFromConsole("Insira a quantidade");

            float area = Utils.readFloatFromConsole("Insira a area (m^2)");

            System.out.println(" === Dados da Sementeira ===");
            System.out.println("ID Parcela: " + parcelaId);
            System.out.println("ID Variedade: " + variedadeId);
            System.out.println("ID Metodo de Execução: " + metodoExecucaoId);
            System.out.println("Quantidade: " + quantidade);
            System.out.println("Area: " + area);

            int optValidation = Utils.readIntegerFromConsole("1-CONFIRMAR\n0-CANCELAR");

            if (optValidation == 1) {

                controller.sementeiraRegister(parcelaId, variedadeId, quantidade, area, metodoExecucaoId);

            } else {

                System.out.println("Operação cancelada");
            }

        } catch (SQLException e) {

            System.err.println("Não foi possível registar a sementeira!\n" + e.getMessage());

        } catch (IllegalArgumentException iax) {

            System.err.println(iax.getMessage());

        } catch (Exception e) {

            System.err.println("ERRO! Não foi possível registar a sementeira\n" + e.getMessage());
        }
    }
}
