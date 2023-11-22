package ui;

import dataAccess.DatabaseConnection;
import esinf.Edge;
import esinf.map.MapGraph;
import esinf.model.Distancia;
import esinf.model.Local;
import esinf.store.GraphStore;
import ui.funcionalidades.SimularSistemaRegaUI;
import ui.menu.MainMenuUI;

import java.io.IOException;
import java.io.InputStream;
import java.net.InetAddress;
import java.net.UnknownHostException;
import java.util.Properties;

import static esinf.map.MapGraphLoader.loadGraph;

public class Main {

    public static void main(String[] args) {

        try {
            MapGraph<Local, Distancia> graph = loadGraph("docs/esinf_data/locais_big.csv", "docs/esinf_data/distancias_big.csv");
            GraphStore.setGraph(graph);

            // Now you can access the graph using GraphStorage.getGraph() whenever needed
        } catch (IOException e) {
            e.printStackTrace();
        }

        try {

            MainMenuUI mainMenuUI = new MainMenuUI();
            mainMenuUI.run();

        } catch (Exception e) {

            e.printStackTrace();
        }
      /*  try {
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
    } */


    }

}

