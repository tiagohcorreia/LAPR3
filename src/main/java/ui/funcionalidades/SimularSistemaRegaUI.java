package ui.funcionalidades;

import controller.RegaController;
import Class.Rega;
import Class.estadoRega;

import java.util.List;

public class SimularSistemaRegaUI implements Runnable {

    @Override
    public void run() {

        RegaController regaController = new RegaController();
        regaController.Parse();
        regaController.adjustRegaSchedule("plano_de_rega.csv");

        List<estadoRega> estados = regaController.verificarEstadoAtual();

        for (estadoRega estado : estados) {
            if (estado.isActive()) {
                System.out.println("Rega ativa no setor: " + estado.getSector());
                System.out.println("Tempo restante (minutos): " + estado.getRemainingMinutes());
            } else {
                System.out.println("Nenhuma rega ativa de momento");
            }
        }
    }
}

