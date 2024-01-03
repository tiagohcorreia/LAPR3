package ui.funcionalidades.us_bd15;

import controller.OperacaoAgricolaRegisterController;
import controller.us_bd15.PodaRegisterController;
import domain.MetodoExecucao;
import domain.Parcela;
import domain.Variedade;
import ui.utils.Utils;

import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.Date;
import java.util.List;
import java.util.Scanner;

public class RegisterPruningUI implements Runnable {

    private PodaRegisterController ctrl=new PodaRegisterController();

    public void run() {
        try {
            String space="----------------------------";
            System.out.printf("%s REGISTAR SEMENTEIRA %s\n\n", space, space);

            System.out.print("OperacaoId: ");

            int operacaoId = ctrl.getNextId();

            System.out.printf("Usando id %d\n", operacaoId);

            LocalDate date=Utils.getLocalDateFromConsole("Introduza a data prevista da operação (DD-MM-AAAA)", "dd-MM-yyyy");

            List<Parcela> parcelas=ctrl.getParcelas();
            int parcelaId = Utils.getTableIdFromConsole(parcelas, "ID", "PARCELA", "Introduza o id da parcela");;

            List<Variedade> variedades=ctrl.getVarietiesInParcel(parcelaId);
            int variedadeId = Utils.getTableIdFromConsole(variedades, "ID", "VARIEDADE", "Introduza o id da variedade");

            List<MetodoExecucao> metodosExecucao=ctrl.getExecutionMethods();
            int metodoExecucaoId = Utils.getTableIdFromConsole(metodosExecucao, "ID", "MÉTODOS DE EXECUÇÃO", "Introduza o id do método de execução");

            float quantidade = Utils.readFloatFromConsole("Insira a quantidade:");
            float area = Utils.readFloatFromConsole("Insira a area (m^2):");

            System.out.println("----------------- Dados da Sementeira -----------------\n");

            System.out.println("ID Operacao: " + operacaoId);
            System.out.println("ID Parcela: " + parcelaId);
            System.out.println("ID Variedade: " + variedadeId);
            System.out.println("ID Metodo de Execução: " + metodoExecucaoId);
            System.out.println("Quantidade: " + quantidade);
            System.out.println("Area: " + area);
            System.out.println();

            int optValidation = Utils.readIntegerFromConsole("1 - CONFIRMAR\n0 - CANCELAR");

            if (optValidation == 1) {

                boolean out=ctrl.registerPruning(date, parcelaId, variedadeId, quantidade, metodoExecucaoId);
                if (out){
                    System.out.println("\nSementeira registada.");
                } else System.out.println("Não foi possível registar a operação\n");

            } else {

                System.out.println("Operação cancelada");
            }

        } catch (IllegalArgumentException iax) {

            System.err.println(iax.getMessage());

        } catch (Exception e) {

            System.err.println("ERRO! Não foi possível registar a sementeira\n" + e.getMessage());
        }
    }
}

