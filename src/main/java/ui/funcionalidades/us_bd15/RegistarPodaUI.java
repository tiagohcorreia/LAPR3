package ui.funcionalidades.us_bd15;

import controller.us_bd15.RegistarPodaController;
import domain.MetodoExecucao;
import domain.Parcela;
import domain.Variedade;
import ui.utils.Utils;

import java.time.LocalDate;
import java.time.ZoneId;
import java.util.Date;
import java.util.List;

/**
 * The type Registar poda ui.
 */
public class RegistarPodaUI implements Runnable {

    private RegistarPodaController ctrl = new RegistarPodaController();
    private int parcelaID;
    private int variedadeID;
    private int metodoExecucaoID;
    private double quantidade;
    private String unidade;
    private LocalDate data;

    public void run() {
        System.out.println("---------------- REGISTAR PODA ----------------\n");
        getParcelID();

        if (getVariedadeID()) {

            if (getMetodoExecucaoID()) {
                getQuantidade();
                getUnidade();
                getDataOperacao();

                if (getConfirmation()) {
                    boolean out;
                    out = ctrl.registarPoda(data, parcelaID, variedadeID, quantidade, metodoExecucaoID);
                    if (out) {
                        System.out.println("Operação registada com sucesso\n");
                    } else System.out.println("Não foi possível registar a operação\n");
                }
            }
        } else System.err.println("Sem variedades na parcela\n");

    }

    private void getParcelID() {
        List<Parcela> parcelas = ctrl.getParcelas();
        parcelaID = Utils.getTableIdFromConsole(parcelas, "ID", "PARCELA", "Introduza o id da parcela:");
    }

    private boolean getVariedadeID() {
        List<Variedade> variedades = ctrl.getVarietiesInParcel(parcelaID);
        if (!variedades.isEmpty()) {
            variedadeID = Utils.getTableIdFromConsole(variedades, "ID", "VARIEDADE", "Introduza o id da variedade");
            return true;
        }
        return false;
    }

    private boolean getMetodoExecucaoID() {
        List<MetodoExecucao> metodosExecucao = ctrl.getMetodosExecucao();
        if (!metodosExecucao.isEmpty()) {
            metodoExecucaoID = Utils.getTableIdFromConsole(metodosExecucao, "ID", "MÉTODO DE EXECUÇÃO", "Introduza o id do método de execução");
            return true;
        }
        return false;
    }

    private void getQuantidade() {
        boolean valid = false;
        do {
            quantidade = Utils.readDoubleFromConsole("Introduza a quantidade:");
            if (quantidade > 0) {
                valid = true;
            } else System.err.println("ERRO: Valor introduzido inválido\n");
        } while (!valid);
    }

    private void getUnidade() {
        unidade = Utils.readLineFromConsole("Introduza a unidade:");
    }

    private void getDataOperacao() {
        Date tmpDate = Utils.readDateFromConsole("Introduza a data da operação:");
        data = tmpDate.toInstant().atZone(ZoneId.systemDefault()).toLocalDate();
    }

    private boolean getConfirmation() {
        System.out.println("----------------- DADOS DA OPERAÇÃO -----------------\n");

        System.out.printf("ID Parcela: %d\n", parcelaID);
        System.out.printf("ID Produto: %d\n", variedadeID);
        System.out.printf("ID Método de execução: %d\n", metodoExecucaoID);
        System.out.printf("Quantidade: %.2f%s\n", quantidade, unidade);
        System.out.printf("Data da operação: %s\n", data);

        System.out.println();

        return Utils.getBooleanAnswer("Deseja registrar a operação:");
    }
}

