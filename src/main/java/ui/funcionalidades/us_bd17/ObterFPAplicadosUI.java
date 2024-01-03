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
        Date tmpDate = Utils.readDateFromConsole("Introduza a data de fim do intervalo pretendido:");
        dataSuperior = tmpDate.toInstant().atZone(ZoneId.systemDefault()).toLocalDate();
    }

    private void imprimirResultado() {

        try {
            try{
                System.out.printf("%-30s | %-30s | %-30s\n", "FATOR DE PRODUÇÃO", "COMPOSTO QUÍMICO", "QUANTIDADE");
                while (resultado.next()) {
                    String fp = resultado.getString(1);
                    String compostoQuimico = resultado.getString(2);
                    double quantidade = resultado.getFloat(3);
                    //java.sql.Date date = resultado.getDate(4);

                    System.out.printf("%-30s | %-30s | %-30s\n", fp, compostoQuimico, String.format("%.2f Kg", quantidade));
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
