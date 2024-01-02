package esinf.us_ei11;

import dataAccess.Repositories;
import esinf.model.Hub;
import esinf.model.Local;
import esinf.model.Schedule;
import esinf.store.GraphStore;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.time.LocalTime;

public class LoadHubsFromFile {
    public static boolean loadHubsFormFile() {

        GraphStore graphStore = Repositories.getInstance().getGraphStore();

        try {

            BufferedReader bufferedReader = new BufferedReader(new FileReader("hubs.txt"));

            String line;
            boolean isFirstLine = true;

            while ((line = bufferedReader.readLine()) != null) {

                if (isFirstLine) {

                    isFirstLine = false;
                    continue;
                }

                String[] parts = line.split(",");
                String locId = parts[0];

                LocalTime openingHours = LocalTime.parse(parts[1]);
                LocalTime closingHours = LocalTime.parse(parts[2]);

                Schedule schedule = new Schedule(openingHours, closingHours);
                Hub hub = new Hub(locId, schedule);

                if (graphStore.getGraph().validVertex(hub)) {

                    if (graphStore.isHubInGraph(hub)) {

                        graphStore.addVertex(hub);

                    } else {

                        System.err.println("Hub especificado no ficheiro não existe");
                        return false;
                    }
                }
            }

        } catch (IOException ioException) {

            System.err.println("Ficheiro não encontrado");
            return false;

        } catch (Exception e) {

            System.err.println(e.getMessage());
            return false;
        }

        return true;
    }
}
