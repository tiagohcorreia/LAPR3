package controller;

import dataAccess.DatabaseConnection;

import java.sql.SQLException;

public class ExitController {

    public ExitController() {
    }

    public void exit() throws SQLException {

        DatabaseConnection.getInstance().closeConnection();
    }
}
