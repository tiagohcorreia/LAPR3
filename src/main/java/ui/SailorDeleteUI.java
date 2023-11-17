package ui;

import controller.SailorDeleteController;

import java.sql.SQLException;
import java.util.Scanner;

public class SailorDeleteUI implements Runnable {

    private SailorDeleteController controller;

    public SailorDeleteUI() {
        controller = new SailorDeleteController();
    }

    public void run() {

        try {

            System.out.println("Delete a Sailor");

            Scanner scanner = new Scanner(System.in);
            System.out.print("SailorId: ");
            int sailorId = scanner.nextInt();

            int deletedRows = controller.sailorDelete(sailorId);

            if (deletedRows > 0)

                System.out.println("\nSailor deleted.");
            else
                System.out.println("\nSailor not exists!");

        } catch (SQLException e) {

            System.out.println("\nSailor not deleted!\n" + e.getMessage());
        }

    }
}
