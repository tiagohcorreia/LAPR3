package ui.funcionalidades.us_bd09;

import controller.us_bd06.ObterQuantidadeFpPorTipoController;
import controller.us_bd09.ObterQuantidadeAplicacoesFpPorTipoController;
import domain.Parcela;
import ui.utils.Utils;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.ZoneId;
import java.util.Date;
import java.util.List;

/**
 * The type Obter quantidade aplicacoes fp por tipo ui.
 */
public class ObterQuantidadeAplicacoesFpPorTipoUI implements Runnable{

    /**
     * The Ctrl.
     */
    ObterQuantidadeAplicacoesFpPorTipoController ctrl=new ObterQuantidadeAplicacoesFpPorTipoController();
    private LocalDate dataInferior;
    private LocalDate dataSuperior;
    private ResultSet resultado;

    @Override
    public void run() {
        obterDataInferior();
        obterDataSuperior();
        resultado = ctrl.getQuery(dataInferior, dataSuperior);
        if (resultado!=null){
            imprimirResultado();
        } else System.err.println("Sem resultado\n");
    }

    private void obterDataInferior(){
        Date tmpDate=Utils.readDateFromConsole("Introduza a data de início do intervalo pretendido:");
        dataInferior=tmpDate.toInstant().atZone(ZoneId.systemDefault()).toLocalDate();
    }

    private void obterDataSuperior(){
        Date tmpDate=Utils.readDateFromConsole("Introduza a data de fim do intervalo pretendido:");
        dataSuperior=tmpDate.toInstant().atZone(ZoneId.systemDefault()).toLocalDate();
    }

    private void imprimirResultado(){

        try{
            try{
                System.out.printf("%-30s | %-30s\n", "TIPO DE FATOR", "QUANTIDADE");
                while (resultado.next()){
                    String tipoFP= resultado.getString(1);
                    int quantidade= resultado.getInt(2);

                    System.out.printf("%-30s | %-30s\n", tipoFP, quantidade);
                }
            } finally {
                resultado.close();
            }

            System.out.println();
        }catch (SQLException e){
            e.printStackTrace();
        }
    }
}
