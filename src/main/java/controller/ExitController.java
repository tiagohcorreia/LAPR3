package controller;

import dataAccess.DatabaseConnection;

import java.sql.SQLException;

/**
 * The type Exit controller.
 */
public class ExitController {

    /**
     * Instantiates a new Exit controller.
     */
    public ExitController() {
    }

    /**
     * Exit.
     *
     * @throws SQLException the sql exception
     */
    public void exit() throws SQLException {

        DatabaseConnection.getInstance().closeConnection();
    }
}
