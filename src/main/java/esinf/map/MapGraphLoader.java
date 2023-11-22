package esinf.map;

import java.io.BufferedReader;

import esinf.gps.GPS;
import esinf.model.Distancia;
import esinf.model.Local;
import esinf.store.GraphStore;

import java.io.FileReader;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

public class MapGraphLoader {

    public static MapGraph<Local, Distancia> loadGraph(String locaisFile, String distanciasFile) throws IOException {
        MapGraph<Local, Distancia> graph = new MapGraph<>(false);
        Distancia distance;


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
                graph.addVertex(local);

            }
        }

        try (BufferedReader br = new BufferedReader(new FileReader(distanciasFile))) {
            String line;
            boolean isFirstLine = true;
            while ((line = br.readLine()) != null) {
                String[] parts = line.split(",");
                if (isFirstLine) {
                    isFirstLine = false;
                    continue;
                }
                String locId1 = parts[0];
                String locId2 = parts[1];
                Local local1=null;
                Local local2=null;

                for (Local l : graph.vertices()) {
                    if (l.getLocalId().equals(locId1)) local1 = l;
                }
                for (Local l : graph.vertices()) {
                    if (l.getLocalId().equals(locId2)) local2 = l;
                }
                int distancia = Integer.parseInt(parts[2]);
                if (local1!=null && local2!=null) {
                    distance = new Distancia(local1, local2, distancia);
                    graph.addEdge(local1,local2,distance);
                }

            }
        }
        GraphStore.setGraph(graph);

        return graph;
    }
}

