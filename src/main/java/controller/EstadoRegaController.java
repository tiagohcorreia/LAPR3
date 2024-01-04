package controller;

import watering_system_manager.WateringSystemManager;
import watering_system_manager.watering_plan.WateringPlanEntry;

/**
 * The type Estado rega controller.
 */
public class EstadoRegaController {

    /**
     * Check watering in progress watering plan entry.
     *
     * @return the watering plan entry
     */
    public WateringPlanEntry checkWateringInProgress() {
        WateringSystemManager manager = new WateringSystemManager();
        return manager.checkWateringInProgress();
    }
}
