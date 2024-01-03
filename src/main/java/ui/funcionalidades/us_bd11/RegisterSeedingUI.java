package ui.funcionalidades.us_bd11;

import controller.*;
import controller.us_bd11.RegisterSeedingController;
import domain.MetodoExecucao;
import domain.Parcela;
import domain.Variedade;
import ui.utils.Utils;

import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.ZoneId;
import java.util.Date;
import java.util.List;
import java.util.Scanner;

public class RegisterSeedingUI implements Runnable {

    private RegisterSeedingController ctrl=new RegisterSeedingController();

    @Override
    public void run() {

        try {

            System.out.println("Registar Sementeira");

            Scanner scanner = new Scanner(System.in);
            System.out.print("OperacaoId: ");

            int operacaoId = ctrl.getNextId();

            System.out.printf("Usando id %d\n", operacaoId);

            LocalDate date=Utils.getLocalDateFromConsole("Introduza a data prevista da operação (DD-MM-AAAA)", "dd-MM-yyyy");

            List<Parcela> parcelas=ctrl.getParcelas();
            Utils.printDatabaseObjects(parcelas, "ID", "PARCELA");

            int parcelaId = Utils.readIntegerFromConsole("Insira o ID da parcela");

            List<Variedade> variedades=ctrl.getVarietiesInParcel(parcelaId);
            Utils.printDatabaseObjects(variedades, "ID", "VARIEDADE");

            int variedadeId = Utils.readIntegerFromConsole("Insira a ID da variedade");

            List<MetodoExecucao> metodoExecucao=ctrl.getExecutionMethods();
            Utils.printDatabaseObjects(metodoExecucao, "ID", "MÉTODOS DE EXECUÇÃO");

            int metodoExecucaoId = -1;
            String metodoExecucaoInput;

            do {

                System.out.print("Metodo Execucao Id (Insira E para sair): \n");
                metodoExecucaoInput = scanner.next().trim();

                if (metodoExecucaoInput.equalsIgnoreCase("E")) {
                    // Go back to the main menu or exit the program
                    return;
                }

                try {

                    metodoExecucaoId = Integer.parseInt(metodoExecucaoInput);
                    if (!ctrl.isThereExecutionMethod(metodoExecucaoId)) {
                        System.out.println("Erro: ProdutoId nao registado na base de dados. Insira um Id existente.");
                    }

                } catch (NumberFormatException e) {

                    System.out.println("Erro: Insira um numero valido para metodoExecucaoId ou E para sair.");
                }

            } while (!ctrl.isThereExecutionMethod(metodoExecucaoId));

            float quantidade = Utils.readFloatFromConsole("Insira a quantidade");

            float area = Utils.readFloatFromConsole("Insira a area (m^2)");

            System.out.println(" === Dados da Sementeira ===");
            System.out.println("ID Operacao: " + operacaoId);
            System.out.println("ID Parcela: " + parcelaId);
            System.out.println("ID Variedade: " + variedadeId);
            System.out.println("ID Metodo de Execução: " + metodoExecucaoId);
            System.out.println("Quantidade: " + quantidade);
            System.out.println("Area: " + area);

            int optValidation = Utils.readIntegerFromConsole("1-CONFIRMAR\n0-CANCELAR");

            if (optValidation == 1) {

                boolean out=ctrl.registerSeeding(date, parcelaId, variedadeId, quantidade, area, metodoExecucaoId);
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
