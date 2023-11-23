package ui.funcionalidades;

import controller.MetodoExecucaoListController;
import controller.ParcelasListController;
import controller.SementeiraRegisterController;
import controller.VariedadeListController;
import ui.utils.Utils;

import java.sql.SQLException;

public class SementeiraRegisterUI implements Runnable {

    private SementeiraRegisterController controller;

    public SementeiraRegisterUI() {

        controller = new SementeiraRegisterController();
    }

    @Override
    public void run() {

        try {

            System.out.println("Registar Sementeira");

            int operacaoId = Utils.readIntegerFromConsole("Insira a ID da operação");

            ParcelasListController controller2 = new ParcelasListController();
            controller2.showAllParcelas();

            int parcelaId = Utils.readIntegerFromConsole("Insira a ID da parcela");

            VariedadeListController controller3 = new VariedadeListController();
            controller3.showVariedades();

            int variedadeId = Utils.readIntegerFromConsole("Insira a ID da variedade");

            MetodoExecucaoListController controller4 = new MetodoExecucaoListController();
            controller4.showMetodosExecucao();

            int metodoExecucaoId = Utils.readIntegerFromConsole("Insira o ID do método de execução");

            float quantidade = Utils.readFloatFromConsole("Insira a quantidade");

            float area = Utils.readFloatFromConsole("Insira a area (m^2)");

            controller.sementeiraRegister(operacaoId, parcelaId, variedadeId, quantidade, area, metodoExecucaoId);

        } catch (SQLException e) {

            System.err.println("Não foi possível registar a sementeira!\n" + e.getMessage());

        } catch (Exception e) {

            System.err.println("ERRO! Não foi possível registar a sementeira\n" + e.getMessage());
        }
    }
}
