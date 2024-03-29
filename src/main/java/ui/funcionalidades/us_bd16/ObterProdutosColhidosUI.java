package ui.funcionalidades.us_bd16;

import controller.us_bd16.ObterProdutosColhidosController;
import domain.Parcela;
import ui.utils.Utils;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.ZoneId;
import java.util.Date;
import java.util.List;

/**
 * The type Obter produtos colhidos ui.
 */
public class ObterProdutosColhidosUI implements Runnable{

    /**
     * The Ctrl.
     */
    ObterProdutosColhidosController ctrl=new ObterProdutosColhidosController();

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
        if (resultado!=null){
            imprimirResultado();
        } else System.err.println("Sem resultado\n");
    }

    private void obterIDParcela() {
        List<Parcela> parcelas = ctrl.obterParcelas();
        parcelaID = Utils.getTableIdFromConsole(parcelas, "ID", "PARCELA", "Introduza o id da parcela:");
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
                System.out.printf("%-30s | %-30s | %-30s\n", "VARIEDADE", "PRODUTO", "QUANTIDADE");
                while (resultado.next()){
                    String variedade= resultado.getString(1);
                    String produto= resultado.getString(2);
                    double quantidade= resultado.getFloat(3);

                    System.out.printf("%-30s | %-30s | %-30s\n", variedade, produto, quantidade + " Kg");
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
