package ui.user.gestor_agricola;

import ui.funcionalidades.us_bd06.ObterQuantidadeFpPorTipoUI;
import ui.funcionalidades.us_bd11.RegistarSementeiraUI;
import ui.funcionalidades.us_bd12.RegistarMondaUI;
import ui.funcionalidades.us_bd13.RegisterColheitaUI;
import ui.funcionalidades.us_bd14.RegisterFpApplicationUI;
import ui.funcionalidades.us_bd15.RegistarPodaUI;
import ui.funcionalidades.us_bd16.ObterProdutosColhidosUI;
import ui.funcionalidades.us_bd17.ObterFPAplicadosUI;
import ui.funcionalidades.us_bd18.ObterOperacoesUI;
import ui.funcionalidades.us_bd19.ObterAplicacoesFpUI;
import ui.funcionalidades.us_bd20.ObterTotaisMensaisRegaUI;
import ui.funcionalidades.us_bd32.RegisterWateringOperationUI;
import ui.menu.MenuItem;
import ui.utils.Utils;

import java.util.ArrayList;
import java.util.List;

public class MenuConsultarDados implements Runnable{

    @Override
    public void run() {
        List<MenuItem> options = new ArrayList<MenuItem>();

        options.add(new MenuItem("Consultar Quantidade de Fatores Aplicados", new ObterQuantidadeFpPorTipoUI()));
        options.add(new MenuItem("Consultar Produtos Colhidos", new ObterProdutosColhidosUI()));
        options.add(new MenuItem("Consultar Fatores Aplicados", new ObterFPAplicadosUI()));
        options.add(new MenuItem("Consultar Operações", new ObterOperacoesUI()));
        options.add(new MenuItem("Consultar Aplicações de Fatores de Produção", new ObterAplicacoesFpUI()));
        options.add(new MenuItem("Consultar Totais Mensais de Rega", new ObterTotaisMensaisRegaUI()));

        Utils.runMenu(options, "CONSULTAR DADOS");
    }
}
