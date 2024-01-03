package ui;

import controller.DatabaseConnectionTestController;
import dataAccess.DatabaseConnection;
import java.sql.SQLException;

/**
 * The type Database connection test ui.
 */
public class DatabaseConnectionTestUI implements Runnable {

    private DatabaseConnectionTestController controller;

    /**
     * Instantiates a new Database connection test ui.
     */
    public DatabaseConnectionTestUI() {
        controller = new DatabaseConnectionTestController();
    }

    public void run() {
        int result = 0;
        try {
            result = controller.DatabaseConnectionTest();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        if(result==DatabaseConnection.CONNECTION_SUCCESS)
            System.out.println("Connected to the database.\n");
        else
            System.out.println("Not connected to the database!\n");
    }
}
