package ui.user.gestor_agricola;

import ui.funcionalidades.us_bd06.ObterQuantidadeFpPorTipoUI;
import ui.funcionalidades.us_bd09.ObterQuantidadeAplicacoesFpPorTipoUI;
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

/**
 * The type Menu consultar dados.
 */
public class MenuConsultarDados implements Runnable{

    @Override
    public void run() {
        List<MenuItem> options = new ArrayList<MenuItem>();
        options.add(new MenuItem("Consultar produtos colhidos numa parcela", new ObterProdutosColhidosUI()));
        options.add(new MenuItem("Consultar fatores aplicados numa parcela, por tipo", new ObterQuantidadeFpPorTipoUI()));
        options.add(new MenuItem("Consultar quantidade de aplicações de fatores na instalação, por tipo de fator", new ObterQuantidadeAplicacoesFpPorTipoUI()));
        options.add(new MenuItem("Consultar fatores aplicados numa parcela e componentes", new ObterFPAplicadosUI()));
        options.add(new MenuItem("Consultar operações", new ObterOperacoesUI()));
        options.add(new MenuItem("Consultar aplicações de fatores de produção, por tipo de fator", new ObterAplicacoesFpUI()));
        options.add(new MenuItem("Consultar totais mensais de rega", new ObterTotaisMensaisRegaUI()));

        Utils.runMenu(options, "CONSULTAR DADOS");
    }
}
