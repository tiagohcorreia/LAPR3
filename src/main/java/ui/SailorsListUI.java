package ui;

import controller.SailorsListController;
import domain.Sailor;
import java.sql.SQLException;
import java.util.List;

public class SailorsListUI implements Runnable {

    private SailorsListController controller;

    public SailorsListUI() {
        controller = new SailorsListController();
    }

    public void run() {
        try {
            System.out.println("List of Sailors");
            List<Sailor> sailors= controller.getSailors();
            System.out.printf("%8s %10s %8s %12s %n","SailorId","Name","Rating","Birthday");
            for (Sailor s: sailors) {
                System.out.printf("%8d %10s %8d %12s %n", s.getSailorId(), s.getName(), s.getRating(), s.getBirthday());
            }
        } catch (SQLException e) {
            System.out.println("Database not return the sailors list!\n" + e.getMessage());
        }
    }
}
