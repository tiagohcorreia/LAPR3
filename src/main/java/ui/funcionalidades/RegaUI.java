package ui.funcionalidades;

import ui.funcionalidades.us_lp10.SimularSistemaRegaUI;

import java.sql.SQLException;

public class RegaUI implements Runnable {

    SimularSistemaRegaUI simularSistemaRegaUI = new SimularSistemaRegaUI();

    RegaRegisterUI regaRegisterUI = new RegaRegisterUI();

    public void run() {

        simularSistemaRegaUI.run();


        regaRegisterUI.run();
    }
}
