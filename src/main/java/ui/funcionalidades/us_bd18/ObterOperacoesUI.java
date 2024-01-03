package ui.funcionalidades.us_bd18;

import controller.us_bd17.ObterFPAplicadosController;
import controller.us_bd18.ObterOperacoesController;
import domain.Parcela;
import ui.utils.Utils;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.ZoneId;
import java.util.Date;
import java.util.List;

public class ObterOperacoesUI implements Runnable {

    ObterOperacoesController ctrl = new ObterOperacoesController();
    private int parcelaID;
    private LocalDate dataInferior;
    private LocalDate dataSuperior;
    private ResultSet resultado;

    @Override
    public void run() {
        obterIDParcela();
        obterDataInferior();
        obterDataSuperior();
        resultado = ctrl.getQuery(parcelaID, dataInferior, dataSuperior);
        if (resultado != null) {
            imprimirResultado();
        } else System.err.println("Sem resultado\n");
    }

    private void obterIDParcela() {
        List<Parcela> parcelas = ctrl.obterParcelas();
        parcelaID = Utils.getTableIdFromConsole(parcelas, "ID", "PARCELA", "Introduza o id da parcela:");
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
                Date tmpDate = resultado.getDate(2);
                LocalDate data = tmpDate.toInstant().atZone(ZoneId.systemDefault()).toLocalDate();
                String tipoOperacao=resultado.getString(3);

                System.out.printf("-20%s | -20%s\n", "Tipo de operação: " + tipoOperacao, "Data: " + data);
            }

            System.out.println();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
