package UI;

import CONT.RegaController;
import Class.estadoRega;

import java.util.List;

public class main {
    public static void main(String[] args) {
        RegaController regaController = new RegaController();
        regaController.Parse();

        List<estadoRega> estados = regaController.verificarEstadoAtual();

            for (estadoRega estado : estados) {
                if (estado.isActive()) {
                    System.out.println("Rega ativa no setor: " + estado.getSector());
                    System.out.println("Tempo restante (minutos): " + estado.getRemainingMinutes());
                } else {
                    System.out.println("Nenhuma rega ativa de momento");
                }
            }
        }
    }

