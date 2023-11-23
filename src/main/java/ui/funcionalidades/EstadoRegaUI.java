package ui.funcionalidades;

import classes.EstadoRega;
import controller.RegaController;
import controller.EstadoRegaController;

import java.util.List;

public class EstadoRegaUI implements Runnable {

    @Override
    public void run() {

        RegaController regaController = new RegaController();

        EstadoRegaController estadoRegaController = new EstadoRegaController();

        List<EstadoRega> estados = estadoRegaController.verificarEstadoAtual();

        for (EstadoRega estado : estados) {
            if (estado.isActive()) {
                System.out.println("Rega ativa no setor: " + estado.getSector());
                System.out.println("Tempo restante (minutos): " + estado.getRemainingMinutes());
            } else {
                System.out.println("Nenhuma rega ativa de momento");
            }
        }
    }
}
