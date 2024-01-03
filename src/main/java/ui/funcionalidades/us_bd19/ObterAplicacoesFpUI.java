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
        Date tmpDate = Utils.readDateFromConsole("Introduza a data de fim do intervalo pretendido:");
        dataSuperior = tmpDate.toInstant().atZone(ZoneId.systemDefault()).toLocalDate();
    }

    private void imprimirResultado() {

        try {
            try{
                System.out.printf("%-30s | %-30s | %-30s\n", "DATA", "FATOR DE PRODUÇÃO", "VARIEDADE");
                while (resultado.next()) {
                    java.sql.Date data = resultado.getDate(1);
                    String fp=resultado.getString(2);
                    String variedade= resultado.getString(3);

                    System.out.printf("%-30s | %-30s | %-30s\n", data, fp, variedade);
                }

                System.out.println();
            } finally {
                resultado.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
