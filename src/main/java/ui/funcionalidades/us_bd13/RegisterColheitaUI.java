package ui.funcionalidades.us_bd13;

import controller.us_bd13.ColheitaRegisterController;
import domain.*;
import ui.utils.Utils;

import java.time.LocalDate;
import java.time.ZoneId;
import java.util.Date;
import java.util.List;

public class RegisterColheitaUI implements Runnable {

    private ColheitaRegisterController ctrl = new ColheitaRegisterController();
    private int parcelaID;
    private int produtoID;
    private int metodoExecucaoID;
    private double quantidade;
    private LocalDate data;

    public void run() {
        System.out.println("---------------- REGISTAR COLHEITA ----------------\n");
        getParcelID();

        if (getProdutoID()) {

            if (getMetodoExecucaoID()) {

                getQuantidade();
                getDataOperacao();

                if (getConfirmation()) {
                    boolean out;
                    out = ctrl.registerColheita(data, parcelaID, produtoID, quantidade, metodoExecucaoID);
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

    private boolean getProdutoID() {
        List<Produto> produtos = ctrl.getProdutosInParcela(parcelaID);
        if (!produtos.isEmpty()) {
            produtoID = Utils.getTableIdFromConsole(produtos, "ID", "PRODUTO", "Introduza o id da produto");
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
            quantidade = Utils.readDoubleFromConsole("Introduza a quantidade colhida, em Kg:");
            if (quantidade > 0) {
                valid = true;
            } else System.err.println("ERRO: Valor introduzido inválido\n");
        } while (!valid);
    }

    private void getDataOperacao() {
        Date tmpDate = Utils.readDateFromConsole("Introduza a data da operação:");
        data = tmpDate.toInstant().atZone(ZoneId.systemDefault()).toLocalDate();
    }

    private boolean getConfirmation() {
        System.out.println("----------------- DADOS DA OPERAÇÃO -----------------\n");

        System.out.printf("ID Parcela: %d\n", parcelaID);
        System.out.printf("ID Produto: %d\n", produtoID);
        System.out.printf("ID Método de execução: %d\n", metodoExecucaoID);
        System.out.printf("Quantidade: %.2fkg\n", quantidade);
        System.out.printf("Data da operação: %s\n", data);

        System.out.println();

        return Utils.getBooleanAnswer("Deseja registrar a operação:");
    }
}

