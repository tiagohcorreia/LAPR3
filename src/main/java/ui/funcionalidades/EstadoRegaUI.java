package ui.funcionalidades;

import controller.EstadoRegaController;
import watering_system_manager.watering_plan.WateringPlanEntry;

import java.time.LocalTime;
import java.time.temporal.ChronoUnit;

/**
 * The type Estado rega ui.
 */
public class EstadoRegaUI implements Runnable {

    /**
     * The Ctrl.
     */
    EstadoRegaController ctrl = new EstadoRegaController();

    @Override
    public void run() {

        WateringPlanEntry wateringRecord=ctrl.checkWateringInProgress();
        if (wateringRecord!=null){
            System.out.println("Rega ativa no setor: " + wateringRecord.getSector());
            System.out.println("Tempo restante (minutos): " + ChronoUnit.MINUTES.between(LocalTime.now(), wateringRecord.getEnd()));

            if (wateringRecord.isFertigation()){
                System.out.println("Fertirrega do mix: " + wateringRecord.getMix());
            }

            System.out.println();

        } else System.out.println("Não exitem regas em curso no momento\n");
    }

    /* List<EstadoRega> estados = estadoRegaController.verificarEstadoAtual();

        for (EstadoRega estado : estados) {
            if (estado.isActive()) {
                System.out.println("Rega ativa no setor: " + estado.getSector());
                System.out.println("Tempo restante (minutos): " + estado.getRemainingMinutes());
            } else {
                System.out.println("Nenhuma rega ativa de momento");
            }
        }*/
}
