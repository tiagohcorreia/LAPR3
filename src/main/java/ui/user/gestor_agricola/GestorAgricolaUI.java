package ui.user.gestor_agricola;

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

/**
 * The type Gestor agricola ui.
 */
public class GestorAgricolaUI implements Runnable {

    @Override
    public void run() {

        List<MenuItem> options = new ArrayList<MenuItem>();

        options.add(new MenuItem("Registar Operações", new MenuRegistarOperacoes()));
        options.add(new MenuItem("Consultar Dados", new MenuConsultarDados()));
        options.add(new MenuItem("Gerir Rega", new MenuGestaoRega()));

        Utils.runMenu(options, "MENU GESTOR AGRÍCOLA");
    }
}

