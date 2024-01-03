package ui.funcionalidades.us_bd11;

import controller.us_bd11.RegistarSementeiraController;
import domain.MetodoExecucao;
import domain.Parcela;
import domain.Variedade;
import ui.utils.Utils;

import java.time.LocalDate;
import java.time.ZoneId;
import java.util.Date;
import java.util.List;

public class RegistarSementeiraUI implements Runnable {

    private RegistarSementeiraController ctrl = new RegistarSementeiraController();
    private int parcelaID;
    private int variedadeID;
    private int metodoExecucaoID;
    private double area;
    private double quantidade;
    private String unidade;
    private LocalDate data;

    public void run() {
        System.out.println("---------------- REGISTAR SEMENTEIRA ----------------\n");
        getParcelID();
        getVariedadeID();
        getMetodoExecucaoID();
        getArea();
        getQuantidade();
        getUnidade();
        getDataOperacao();

        if (getConfirmation()) {
            boolean out;
            out = ctrl.registarSementeira(data, parcelaID, variedadeID,quantidade, area, metodoExecucaoID);
            if (out) {
                System.out.println("Operação registada com sucesso\n");
            } else System.out.println("Não foi possível registar a operação\n");
        }

    }

    private void getParcelID() {
        List<Parcela> parcelas = ctrl.getParcelas();
        parcelaID = Utils.getTableIdFromConsole(parcelas, "ID", "PARCELA", "Introduza o id da parcela:");
    }

    private void getVariedadeID() {
        List<Variedade> variedades = ctrl.getVarietiesInParcel(parcelaID);
        variedadeID = Utils.getTableIdFromConsole(variedades, "ID", "VARIEDADE", "Introduza o id da variedade");
    }

    private void getMetodoExecucaoID() {
        List<MetodoExecucao> metodosExecucao = ctrl.getMetodosExecucao();
        metodoExecucaoID = Utils.getTableIdFromConsole(metodosExecucao, "ID", "MÉTODO DE EXECUÇÃO", "Introduza o id do método de execução");
    }

    private void getArea() {
        boolean valid = false;
        do {
            area = Utils.readDoubleFromConsole("Introduza a área da sementeira, em hectares:");
            if (area > 0) {
                valid = true;
            } else System.err.println("ERRO: Valor introduzido inválido\n");
        } while (!valid);
    }

    private void getQuantidade() {
        boolean valid = false;
        do {
            quantidade = Utils.readDoubleFromConsole("Introduza a quantidade semeada, em Kg:");
            if (quantidade > 0) {
                valid = true;
            } else System.err.println("ERRO: Valor introduzido inválido\n");
        } while (!valid);
    }

    private void getUnidade(){
        unidade=Utils.readLineFromConsole("Introduza a unidade:");
    }

    private void getDataOperacao() {
        Date tmpDate = Utils.readDateFromConsole("Introduza a data da operação:");
        data = tmpDate.toInstant().atZone(ZoneId.systemDefault()).toLocalDate();
    }

    private boolean getConfirmation() {
        System.out.println("----------------- DADOS DA OPERAÇÃO -----------------\n");

        System.out.printf("ID Parcela: %d\n", parcelaID);
        System.out.printf("ID Variedade: %d\n", variedadeID);
        System.out.printf("ID Método de execução: %d\n", metodoExecucaoID);
        System.out.printf("Área: %.2f\n", area);
        System.out.printf("Quantidade: %.2f%s\n", quantidade, unidade);
        System.out.printf("Data da operação: %s\n", data);

        System.out.println();

        return Utils.getBooleanAnswer("Deseja registrar a operação:");
    }
}
