package ui.funcionalidades.us_bd34;

import controller.us_bd33.ObterCulturasMaiorConsumoAguaController;
import controller.us_bd34.ObterCompostosNaoNesseAnoController;
import dataAccess.Repositories;
import ui.utils.Utils;

import java.sql.ResultSet;
import java.sql.SQLException;

public class ObterCompostosNaoNesseAnoUI implements Runnable{

    ObterCompostosNaoNesseAnoController ctrl=new ObterCompostosNaoNesseAnoController();

    @Override
    public void run() {
        int year= Utils.readYearFromConsole("Introduza o ano pretendido");
        if (year > 0){
            ResultSet result= ctrl.getQuery(year);
            if (result!=null){
                printResult(result);
            } else System.err.println("Não há dados que correspondam aos requisitos\n");
        }
    }

    private void printResult(ResultSet result){
        try {
            System.out.printf("%-30s\n", "COMPOSTOS QUÍMICOS");
            while (result.next()){
                String composto=result.getString(1);
                System.out.printf("%-30s\n", "- " + composto);
            }
            System.out.println();
        } catch (SQLException e){
            e.printStackTrace();
        }
    }
}
