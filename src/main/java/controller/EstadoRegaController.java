package controller;

import watering_system_manager.WateringSystemManager;
import watering_system_manager.watering_plan.WateringPlanEntry;

public class EstadoRegaController {

    public WateringPlanEntry checkWateringInProgress() {
        WateringSystemManager manager = new WateringSystemManager();
        return manager.checkWateringInProgress();
    }
}
