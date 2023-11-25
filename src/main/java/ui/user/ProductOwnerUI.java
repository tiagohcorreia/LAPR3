package ui.user;

import ui.funcionalidades.*;
import ui.menu.MenuItem;
import ui.utils.Utils;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ProductOwnerUI implements Runnable {

    public ProductOwnerUI() {

    }

    @Override
    public void run() {

        List<MenuItem> options = new ArrayList<MenuItem>();

        options.add(new MenuItem("Registar Sementeira", new SementeiraRegisterUI()));
        options.add(new MenuItem("Registar Colheita", new ColheitaRegisterUI()));
        options.add(new MenuItem("Gerar Plano de Rega", new SimularSistemaRegaUI()));
        options.add(new MenuItem("Verificar Estado da Rega", new EstadoRegaUI()));
        try {
            options.add(new MenuItem("Consumo Plano de Rega Automatico", new RegaRegisterUI()));
        } catch (SQLException e) {
            e.printStackTrace();
        }


        int option = 0;

        do {
            option = Utils.showAndSelectIndex(options, "\n\nMain Menu");

            if ((option >= 0) && (option < options.size())) {
                options.get(option).run();
            }

        } while (option != -1);
    }

}
