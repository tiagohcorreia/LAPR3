package ui.funcionalidades.us_bd14;

import controller.us_bd14.FatorProducaoRegisterController;
import domain.FatorProducao;
import domain.MetodoAplicacao;
import domain.Parcela;
import domain.Variedade;
import ui.utils.Utils;

import java.time.LocalDate;
import java.time.ZoneId;
import java.util.Date;
import java.util.List;

/**
 * The type Register fp application ui.
 */
public class RegisterFpApplicationUI implements Runnable {

    private FatorProducaoRegisterController ctrl = new FatorProducaoRegisterController();
    private int parcelaID;
    private int variedadeID;
    private int metodoAplicacaoID;
    private double quantidade;
    private String unidade;
    private double area;
    private int fpID;
    private LocalDate data;
    /**
     * The Is aplicacao fp solo.
     */
    boolean isAplicacaoFPSolo;

    public void run() {
        System.out.println("---------------- REGISTAR APLICAÇÃO DE FATOR DE PRODUÇÃO ----------------\n");
        askIsAplicacaoFPSolo();

        if (isAplicacaoFPSolo) {
            getParcelID();

            if (getFatorProducaoID()) {
                getArea();
                getQuantidade();
                getUnidade();
                getDataOperacao();

                if (getConfirmation()) {
                    boolean out;
                    out = ctrl.registerAplicacaoFPSolo(parcelaID, quantidade, unidade, area, fpID, data);

                    if (out) {
                        System.out.println("Operação registada com sucesso\n");
                    } else System.out.println("Não foi possível registar a operação\n");
                }

            }

        } else {
            getParcelID();

            if (getVariedadeID()) {

                if (getFatorProducaoID()) {

                    if (getMetodoAplicacaoID()) {
                        getQuantidade();
                        getUnidade();
                        getDataOperacao();

                        if (getConfirmation()) {
                            boolean out;
                            out = ctrl.registerAplicacaoFPVariedade(parcelaID, variedadeID, metodoAplicacaoID, quantidade, unidade, fpID, data);

                            if (out) {
                                System.out.println("Operação registada com sucesso\n");
                            } else System.out.println("Não foi possível registar a operação\n");
                        }
                    }
                }
            } else System.err.println("Sem variedades na parcela\n");
        }
    }

    private void askIsAplicacaoFPSolo() {
        isAplicacaoFPSolo = Utils.getBooleanAnswer("É uma aplicação de fator de produção no solo apenas?");
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

    private boolean getFatorProducaoID() {
        List<FatorProducao> fatoresProducao = ctrl.getFatoresProducao();
        if (!fatoresProducao.isEmpty()) {
            fpID = Utils.getTableIdFromConsole(fatoresProducao, "ID", "FATOR DE PRODUÇÃO", "Introduza o id do fator de produção");
            return true;
        }
        return false;
    }

    private void getArea() {
        boolean valid = false;
        do {
            area = Utils.readDoubleFromConsole("Introduza a área, em hectares, da aplicação:");
            if (area > 0) {
                valid = true;
            } else System.err.println("ERRO: Valor introduzido inválido\n");
        } while (!valid);
    }

    private boolean getMetodoAplicacaoID() {
        List<MetodoAplicacao> metodosAplicacao = ctrl.getMetodosAplicacao();
        if (!metodosAplicacao.isEmpty()) {
            metodoAplicacaoID = Utils.getTableIdFromConsole(metodosAplicacao, "ID", "MÉTODO DE APLICAÇÃO", "Introduza o id do método de aplicação");
            return true;
        }
        return false;
    }

    private void getQuantidade() {
        boolean valid = false;
        do {
            quantidade = Utils.readDoubleFromConsole("Introduza a quantidade aplicada:");
            if (quantidade > 0) {
                valid = true;
            } else System.err.println("ERRO: Valor introduzido inválido\n");
        } while (!valid);
    }

    private void getUnidade() {
        unidade = Utils.readLineFromConsole("Introduza a unidade (por exemplo quilogramas, litros...):");
    }

    private void getDataOperacao() {
        Date tmpDate = Utils.readDateFromConsole("Introduza a data da operação:");
        data = tmpDate.toInstant().atZone(ZoneId.systemDefault()).toLocalDate();
    }

    private boolean getConfirmation() {
        System.out.println("----------------- DADOS DA OPERAÇÃO -----------------\n");

        if (isAplicacaoFPSolo) {
            System.out.printf("ID Parcela: %d\n", parcelaID);
            System.out.printf("ID Fator de produção: %d\n", fpID);
            System.out.printf("Área: %.2f\n", area);
            System.out.printf("Quantidade: %.2f%s\n", quantidade, unidade);
            System.out.printf("Data da operação: %s\n", data);
        } else {
            System.out.printf("ID Parcela: %d\n", parcelaID);
            System.out.printf("ID Variedade: %d\n", variedadeID);
            System.out.printf("ID Fator de produção: %d\n", fpID);
            System.out.printf("ID Método de aplicação: %d\n", metodoAplicacaoID);
            System.out.printf("Quantidade: %.2f%s\n", quantidade, unidade);
            System.out.printf("Data da operação: %s\n", data);
        }

        System.out.println();

        return Utils.getBooleanAnswer("Deseja registrar a operação:");
    }
}

