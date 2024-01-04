package controller;

import dataAccess.DatabaseConnection;
import java.sql.SQLException;

/**
 * The type Database connection test controller.
 */
public class DatabaseConnectionTestController {

    /**
     * Instantiates a new Database connection test controller.
     */
    public DatabaseConnectionTestController() {
    }

    /**
     * Database connection test int.
     *
     * @return the int
     * @throws SQLException the sql exception
     */
    public int DatabaseConnectionTest() throws SQLException {
        int testResult = DatabaseConnection.getInstance().testConnection();
        return testResult;
    }
}
