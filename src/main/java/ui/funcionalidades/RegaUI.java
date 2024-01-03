package ui.funcionalidades;

import ui.funcionalidades.us_lp10.SimularSistemaRegaUI;

import java.sql.SQLException;

/**
 * The type Rega ui.
 */
public class RegaUI implements Runnable {

    /**
     * The Simular sistema rega ui.
     */
    SimularSistemaRegaUI simularSistemaRegaUI = new SimularSistemaRegaUI();

    /**
     * The Rega register ui.
     */
    RegaRegisterUI regaRegisterUI = new RegaRegisterUI();

    public void run() {

        simularSistemaRegaUI.run();


        regaRegisterUI.run();
    }
}
