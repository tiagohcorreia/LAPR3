package esinf.map;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;

public class MapGraphLoader {

    public static MapGraph<String, Integer> loadGraph(String locaisFile, String distanciasFile) throws IOException {
        MapGraph<String, Integer> graph = new MapGraph<>(true);


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
                graph.addVertex(locId);
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
                    int distancia = Integer.parseInt(parts[2]);
                    graph.addEdge(locId1, locId2, distancia);
            }
        }

        return graph;
    }
}

