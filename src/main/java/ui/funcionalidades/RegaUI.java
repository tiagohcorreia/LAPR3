package ui.funcionalidades;

import java.sql.SQLException;

public class RegaUI implements Runnable {

    SimularSistemaRegaUI simularSistemaRegaUI = new SimularSistemaRegaUI();

    RegaRegisterUI regaRegisterUI = new RegaRegisterUI();

    public RegaUI() throws SQLException {
    }

    public void run() {

        simularSistemaRegaUI.run();


        regaRegisterUI.run();
    }
}
