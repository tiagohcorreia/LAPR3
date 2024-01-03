package ui.funcionalidades.us_bd19;

import controller.us_bd18.ObterOperacoesController;
import controller.us_bd19.ObterAplicacoesFPController;
import domain.Parcela;
import domain.TipoFP;
import ui.utils.Utils;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.ZoneId;
import java.util.Date;
import java.util.List;

public class ObterAplicacoesFpUI implements Runnable{

    ObterAplicacoesFPController ctrl = new ObterAplicacoesFPController();
    private int parcelaID;
    private LocalDate dataInferior;
    private LocalDate dataSuperior;
    private int tipoFpId;
    private ResultSet resultado;

    @Override
    public void run() {
        obterIDParcela();
        obterIdTipoFP();
        obterDataInferior();
        obterDataSuperior();
        resultado = ctrl.getQuery(parcelaID, dataInferior, dataSuperior, tipoFpId);
        if (resultado != null) {
            imprimirResultado();
        } else System.err.println("Sem resultado\n");
    }

    private void obterIDParcela() {
        List<Parcela> parcelas = ctrl.obterParcelas();
        parcelaID = Utils.getTableIdFromConsole(parcelas, "ID", "PARCELA", "Introduza o id da parcela:");
    }

    private void obterIdTipoFP(){
        List<TipoFP> tiposFP = ctrl.obterTiposFP();
        tipoFpId = Utils.getTableIdFromConsole(tiposFP, "ID", "TIPO DE FATOR", "Introduza o id do tipo de fator de produção:");
    }

    private void obterDataInferior() {
        Date tmpDate = Utils.readDateFromConsole("Introduza a data de início do intervalo pretendido:");
        dataInferior = tmpDate.toInstant().atZone(ZoneId.systemDefault()).toLocalDate();
    }

    private void obterDataSuperior() {
        Date tmpDate = Utils.readDateFromConsole("Introduza a data de início do intervalo pretendido:");
        dataSuperior = tmpDate.toInstant().atZone(ZoneId.systemDefault()).toLocalDate();
    }

    private void imprimirResultado() {

        try {
            while (resultado.next()) {
                Date tmpDate = resultado.getDate(1);
                LocalDate data = tmpDate.toInstant().atZone(ZoneId.systemDefault()).toLocalDate();
                String fp=resultado.getString(2);
                String variedade= resultado.getString(3);

                System.out.printf("-20%s | -20%s | -20%s\n", "Data: " + data, "Fator de produção: " + fp, "Variedade: " + variedade);
            }

            System.out.println();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
