package ui;

import dataAccess.DatabaseConnection;
import esinf.map.MapGraph;
import esinf.map.MapGraphLoader;
import esinf.model.Local;
import esinf.store.GraphStore;
import ui.menu.MainMenuUI;

import java.io.IOException;
import java.io.InputStream;
import java.net.InetAddress;
import java.net.UnknownHostException;
import java.util.Properties;

import static esinf.map.MapGraphLoader.loadGraph;

public class Main {

    final static String LOCALS_FILE_PATH="docs\\esinf_data\\locais_small.csv";
    final static String DISTANCES_FILE_PATH="docs\\esinf_data\\distancias_small.csv";

    public static void main(String[] args) {

        MapGraphLoader.loadGraph(LOCALS_FILE_PATH, DISTANCES_FILE_PATH);

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

