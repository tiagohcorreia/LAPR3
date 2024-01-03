package ui.funcionalidades.us_bd17;

import controller.us_bd16.ObterProdutosColhidosController;
import controller.us_bd17.ObterFPAplicadosController;
import domain.Parcela;
import ui.utils.Utils;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.ZoneId;
import java.util.Date;
import java.util.List;

public class ObterFPAplicadosUI implements Runnable {

    ObterFPAplicadosController ctrl = new ObterFPAplicadosController();
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
                String fp = resultado.getString(1);
                String compostoQuimico = resultado.getString(2);
                double quantidade = resultado.getFloat(3);
                Date tmpDate = resultado.getDate(4);
                LocalDate data = tmpDate.toInstant().atZone(ZoneId.systemDefault()).toLocalDate();

                System.out.printf("-20%s | -20%s | -20%s | -20%s\n", "Fator de produção: " + fp, "Composto Químico: " + compostoQuimico, "Quantidade: " + quantidade, "Data: " + data);
            }

            System.out.println();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
