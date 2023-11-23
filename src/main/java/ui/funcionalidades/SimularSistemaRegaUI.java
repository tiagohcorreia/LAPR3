package ui.funcionalidades;

import controller.RegaController;
import classes.EstadoRega;

import java.util.List;

public class SimularSistemaRegaUI implements Runnable {

    @Override
    public void run() {

        RegaController regaController = new RegaController();
        regaController.Parse();
        regaController.adjustRegaSchedule("plano_de_rega.csv");

    }
}

