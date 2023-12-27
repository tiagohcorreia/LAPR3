package ui;

import dataAccess.DatabaseConnection;
import esinf.map.MapGraphLoader;
import ui.menu.MainMenuUI;

import java.io.IOException;
import java.io.InputStream;
import java.net.InetAddress;
import java.net.UnknownHostException;
import java.util.Properties;

public class Main {

    final static String LOCALS_FILE_PATH_1 ="docs\\esinf_data\\locais_small.csv";
    final static String DISTANCES_FILE_PATH_1="docs\\esinf_data\\distancias_small.csv";

    final static String LOCALS_FILE_PATH_2 ="src/test/java/esinf/us_ei06/test_files/locals/us-ei06-locals-1.txt";
    final static String DISTANCES_FILE_PATH_2 ="src/test/java/esinf/us_ei06/test_files/distances/us-ei06-distances-1.txt";

    final static String LOCALS_FILE_PATH_3 ="src/test/java/esinf/us_ei06/test_files/locals/us-ei06-locals-3.txt";
    final static String DISTANCES_FILE_PATH_3 ="src/test/java/esinf/us_ei06/test_files/distances/us-ei06-distances-3.txt";

    public static void main(String[] args) {

        MapGraphLoader.loadGraph(LOCALS_FILE_PATH_3, DISTANCES_FILE_PATH_3);

        try {
            loadProperties();

            String ipAddress = System.getProperty("database.inet");
            InetAddress inet = InetAddress.getByName(ipAddress);

            MainMenuUI menu = new MainMenuUI();
            menu.run();
            DatabaseConnection.getInstance().closeConnection();
        } catch (UnknownHostException e) {
            System.out.println("\nDatabase Server not reachable!");
        } catch (Exception e) {
            System.out.println("App properties not loaded!");
            e.printStackTrace();
        }
    }

    private static void loadProperties() throws IOException {
        Properties properties = new Properties(System.getProperties());

        InputStream inputStream = new Main().getClass().getClassLoader().getResourceAsStream("application.properties");
        properties.load(inputStream);
        inputStream.close();

        System.setProperties(properties);
    }

}

