package ui.user;

import ui.funcionalidades.*;
import ui.funcionalidades.us_bd11.RegistarSementeiraUI;
import ui.funcionalidades.us_bd12.RegistarMondaUI;
import ui.funcionalidades.us_bd13.RegisterColheitaUI;
import ui.funcionalidades.us_bd14.RegisterFpApplicationUI;
import ui.funcionalidades.us_bd15.RegistarPodaUI;
import ui.funcionalidades.us_bd32.RegisterWateringOperationUI;
import ui.menu.MenuItem;
import ui.utils.Utils;

import java.util.ArrayList;
import java.util.List;

public class GestorAgricolaUI implements Runnable {

    public GestorAgricolaUI() {

    }

    @Override
    public void run() {

        List<MenuItem> options = new ArrayList<MenuItem>();

        options.add(new MenuItem("Registar Sementeira", new RegistarSementeiraUI()));
        options.add(new MenuItem("Registar Colheita", new RegisterColheitaUI()));
        options.add(new MenuItem("Registar Monda", new RegistarMondaUI()));
        options.add(new MenuItem("Registar Aplicacao FP", new RegisterFpApplicationUI()));
        options.add(new MenuItem("Registar Poda", new RegistarPodaUI()));
        options.add(new MenuItem("Registar Rega (Fertirrega)", new RegisterWateringOperationUI()));
        options.add(new MenuItem("Cancelar Operação Agrícola", new CancelarOperacaoUI()));
        options.add(new MenuItem("Gerar Plano de Rega", new RegaUI()));
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

