package ui.funcionalidades.us_bd33;

import controller.us_bd33.ObterCulturasMaiorConsumoAguaController;
import dataAccess.Repositories;
import ui.utils.Utils;

import java.sql.ResultSet;
import java.sql.SQLException;

public class ObterCulturasMaiorConsumoAguaUI implements Runnable{

    ObterCulturasMaiorConsumoAguaController ctrl=new ObterCulturasMaiorConsumoAguaController();

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
            System.out.printf("%-30s | %-30s\n", "CULTURA", "TOTAL DE REGA (minutos)");
            while (result.next()){
                String cultura=result.getString(1);
                int totalRega=result.getInt(2);
                System.out.printf("%-30s | %-30s\n", cultura, totalRega + " mn");
            }
            System.out.println();
        } catch (SQLException e){
            e.printStackTrace();
        }
    }
}
