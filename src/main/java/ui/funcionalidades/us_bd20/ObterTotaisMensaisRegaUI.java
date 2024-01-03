package ui.funcionalidades.us_bd20;

import controller.us_bd19.ObterAplicacoesFPController;
import controller.us_bd20.ObterTotaisMensaisRegaController;
import domain.Parcela;
import domain.TipoFP;
import ui.utils.Utils;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.Month;
import java.time.ZoneId;
import java.util.Date;
import java.util.List;

/**
 * The type Obter totais mensais rega ui.
 */
public class ObterTotaisMensaisRegaUI implements Runnable{

    /**
     * The Ctrl.
     */
    ObterTotaisMensaisRegaController ctrl = new ObterTotaisMensaisRegaController();
    private int parcelaID;
    private LocalDate dataInferior;
    private LocalDate dataSuperior;
    private ResultSet resultado;

    @Override
    public void run() {
        //obterIDParcela();
        obterDataInferior();
        obterDataSuperior();
        resultado = ctrl.getQuery(dataInferior, dataSuperior);
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
                System.out.printf("%-30s | %-30s | %-30s\n", "PARCELA", "MÊS", "TOTAL DE REGA");
                while (resultado.next()) {
                    String parcela= resultado.getString(1);
                    int mes=resultado.getInt(2);
                    int totalRega= resultado.getInt(3);

                    System.out.printf("%-30s | %-30s | %-30s\n", parcela, Month.of(mes), totalRega + " mn");
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
