package ui.funcionalidades;

import watering_system_manager.WateringPlanGenerator;

import java.sql.SQLException;

public class SimularSistemaRegaUI implements Runnable {

    @Override
    public void run() {

        WateringPlanGenerator wateringPlanGenerator = new WateringPlanGenerator();
        wateringPlanGenerator.parse();
        wateringPlanGenerator.adjustRegaSchedule("plano_de_rega.csv");
        RegaRegisterUI regaRegisterUI = null;
        try {
            regaRegisterUI = new RegaRegisterUI();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        assert regaRegisterUI != null;
        regaRegisterUI.run();


    }
}

