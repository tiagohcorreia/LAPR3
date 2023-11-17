package ui;

import controller.SailorRegisterController;

import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Scanner;

public class SailorRegisterUI implements Runnable {

    private SailorRegisterController controller;

    public SailorRegisterUI() {
        controller = new SailorRegisterController();
    }

    public void run() {

        try {
            System.out.println("Register a new Sailor");

            Scanner scanner = new Scanner(System.in);
            System.out.print("SailorId: ");
            int sailorId = scanner.nextInt();

            System.out.print("Name: ");
            String name = scanner.next();

            System.out.print("Rating: ");
            int rating = scanner.nextInt();

            System.out.print("Birthdate (dd-mm-yyyy): ");
            String strBirthday = scanner.next();
            SimpleDateFormat formatter = new SimpleDateFormat("dd-MM-yyyy");
            Date birthday = formatter.parse(strBirthday);
            controller.sailorRegister(sailorId, name, rating, birthday);
            System.out.println("\nSailor registered.");

        } catch (ParseException | SQLException e) {
            System.out.println("\nSailor not registered!\n" + e.getMessage());
        }
    }
}
