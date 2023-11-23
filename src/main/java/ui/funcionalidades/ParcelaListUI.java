package ui.funcionalidades;

import controller.ParcelasListController;
import domain.Parcela;

import java.sql.SQLException;
import java.util.List;

public class ParcelaListUI implements Runnable {

    private ParcelasListController parcelaController;

    @Override
    public void run() {

        try {

            System.out.println("Lista de Parcelas");

            List<Parcela> parcelas = parcelaController.getParcelas();

            System.out.printf("%8s %10s %8s %n", "ParcelaId", "Nome", "Area");

            for (Parcela parcela : parcelas) {
                System.out.printf("%8d %10s %8d %n", parcela.getId(), parcela.getNome(), parcela.getArea());
            }

        } catch (SQLException e) {

            System.out.println("Database not return the parcelas list!\n" + e.getMessage());
        }
    }
}

