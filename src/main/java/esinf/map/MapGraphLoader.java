package esinf.map;

import java.io.BufferedReader;

import esinf.gps.GPS;
import esinf.model.Local;
import esinf.store.GraphStore;
import dataAccess.Repositories;

import java.io.FileReader;
import java.io.IOException;
import java.sql.SQLOutput;
import java.util.Objects;

/**
 * The type Map graph loader.
 */
public class MapGraphLoader {

    /**
     * Load graph boolean.
     *
     * @param locaisFile     the locais file
     * @param distanciasFile the distancias file
     * @return the boolean
     */
    public static boolean loadGraph(String locaisFile, String distanciasFile) {
        GraphStore graphStore = Repositories.getInstance().getGraphStore();

        try (BufferedReader br = new BufferedReader(new FileReader(locaisFile))) {
            String line;
            boolean isFirstLine = true;

            while ((line = br.readLine()) != null) {
                if (isFirstLine) {
                    isFirstLine = false;
                    continue;
                }

                String[] parts = line.split(",");
                String locId = parts[0];
                double lat = Double.parseDouble(parts[1]);
                double lng = Double.parseDouble(parts[2]);
                GPS gps = new GPS(lat, lng);
                Local local = new Local(locId, gps);
                graphStore.addVertex(local);
            }
        } catch (IOException e) {
            System.out.println("Operação falhou");
            e.printStackTrace();
        }

        try (BufferedReader br = new BufferedReader(new FileReader(distanciasFile))) {
            String line;
            boolean isFirstLine = true;
            while ((line = br.readLine()) != null) {
                if (isFirstLine) {
                    isFirstLine = false;
                    continue;
                }
                String[] parts = line.split(",");
                String locId1 = parts[0];
                String locId2 = parts[1];
                int distancia = Integer.parseInt(parts[2]);
                Local local1 = null;
                Local local2 = null;

                for (Local l : graphStore.getGraph().vertices()) {
                    if (l.getLocalId().equals(locId1)) local1 = l;
                    if (l.getLocalId().equals(locId2)) local2 = l;
                }
                if (local1 != null && local2 != null) {
                    graphStore.addEdge(local1, local2, distancia);
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
        return true;
    }
}

