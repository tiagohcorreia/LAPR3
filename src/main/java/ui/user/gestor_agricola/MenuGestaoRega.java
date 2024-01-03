package ui.user.gestor_agricola;

import ui.funcionalidades.EstadoRegaUI;
import ui.funcionalidades.RegaUI;
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

public class MenuGestaoRega implements Runnable{

    @Override
    public void run() {

        List<MenuItem> options = new ArrayList<MenuItem>();

        options.add(new MenuItem("Gerar Plano de Rega", new RegaUI()));
        options.add(new MenuItem("Verificar Estado da Rega", new EstadoRegaUI()));

        Utils.runMenu(options, "GERIR REGA");
    }
}
