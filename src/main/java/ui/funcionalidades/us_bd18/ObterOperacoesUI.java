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

/**
 * The type Obter operacoes ui.
 */
public class ObterOperacoesUI implements Runnable {

    /**
     * The Ctrl.
     */
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
        Date tmpDate = Utils.readDateFromConsole("Introduza a data de fim do intervalo pretendido:");
        dataSuperior = tmpDate.toInstant().atZone(ZoneId.systemDefault()).toLocalDate();
    }

    private void imprimirResultado() {

        try {
            try{
                System.out.printf("%-30s | %-30s\n", "TIPO DE OPERAÇÃO", "DATA");
                while (resultado.next()) {
                    java.sql.Date data = resultado.getDate(2);
                    String tipoOperacao=resultado.getString(3);

                    System.out.printf("%-30s | %-30s\n", tipoOperacao, data);
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
