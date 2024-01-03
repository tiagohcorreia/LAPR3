package ui.funcionalidades.us_bd20;

import controller.us_bd19.ObterAplicacoesFPController;
import controller.us_bd20.ObterTotaisMensaisRegaController;
import domain.Parcela;
import domain.TipoFP;
import ui.utils.Utils;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.ZoneId;
import java.util.Date;
import java.util.List;

public class ObterTotaisMensaisRegaUI implements Runnable{

    ObterTotaisMensaisRegaController ctrl = new ObterTotaisMensaisRegaController();
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
                String mes=resultado.getString(1);
                int totalRega= resultado.getInt(2);

                System.out.printf("-20%s | -20%s\n", "Mês: " + mes, "Total de rega desse mês: " + totalRega);
            }

            System.out.println();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
