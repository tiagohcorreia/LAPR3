package ui.funcionalidades;

import controller.SementeiraRegisterController;
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

            int parcelaId = Utils.readIntegerFromConsole("Insira a ID da parcela");

            int variedadeId = Utils.readIntegerFromConsole("Insira a ID da variedade");

            float quantidade = Utils.readFloatFromConsole("Insira a quantidade");

            float area = Utils.readFloatFromConsole("Insira a area (m^2)");

            int metodoExecucaoId = Utils.readIntegerFromConsole("Insira o ID do método de execução");

            controller.sementeiraRegister(operacaoId, parcelaId, variedadeId, quantidade, area, metodoExecucaoId);

        } catch (SQLException e) {

            System.err.println("Não foi possível registar a sementeira!\n" + e.getMessage());

        } catch (Exception e) {

            System.err.println("ERRO! Não foi possível registar a sementeira\n" + e.getMessage());
        }
    }
}
