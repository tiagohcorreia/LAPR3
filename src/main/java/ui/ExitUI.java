package ui;

import controller.ExitController;

import java.sql.SQLException;

/**
 * The type Exit ui.
 */
public class ExitUI implements Runnable {

    private ExitController controller;

    /**
     * Instantiates a new Exit ui.
     */
    public ExitUI() {
        controller = new ExitController();
    }

    public void run() {

        try {

            controller.exit();
            System.out.println("Successful termination.");
            System.exit(0);

        } catch (SQLException e) {

            System.out.println("Unsuccessful termination!");
            System.exit(-1);
        }
    }

}
