package ui.user;

import ui.funcionalidades.*;
import ui.funcionalidades.us_bd11.RegisterSeedingUI;
import ui.funcionalidades.us_bd12.RegisterWeedingUI;
import ui.funcionalidades.us_bd13.RegisterHarvestUI;
import ui.funcionalidades.us_bd14.RegisterFpApplicationUI;
import ui.funcionalidades.us_bd15.RegisterPruningUI;
import ui.menu.MenuItem;
import ui.utils.Utils;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class GestorAgricolaUI implements Runnable {

    public GestorAgricolaUI() {

    }

    @Override
    public void run() {

        List<MenuItem> options = new ArrayList<MenuItem>();

        options.add(new MenuItem("Registar Sementeira", new RegisterSeedingUI()));
        options.add(new MenuItem("Registar Colheita", new RegisterHarvestUI()));
        options.add(new MenuItem("Registar Monda", new RegisterWeedingUI()));
        options.add(new MenuItem("Registar Aplicacao FP", new RegisterFpApplicationUI()));
        options.add(new MenuItem("Registar Poda", new RegisterPruningUI()));
        options.add(new MenuItem("Cancelar Operação Agrícola", new CancelarOperacaoUI()));

        try {

            options.add(new MenuItem("Gerar Plano de Rega", new RegaUI()));

        } catch (SQLException e) {

            e.printStackTrace();
        }
        options.add(new MenuItem("Verificar Estado da Rega", new EstadoRegaUI()));


        Utils.runMenu(options, "MENU GESTOR AGRÍCOLA");
        /*int option = 0;

        do {
            option = Utils.showAndSelectIndex(options, "\n\nMain Menu");

            if ((option >= 0) && (option < options.size())) {
                options.get(option).run();
            }

        } while (option != -1);*/
    }
}

