package watering_system_manager;

import watering_system_manager.watering_plan.WateringPlanEntry;

import java.io.*;
import java.time.DateTimeException;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.time.format.DateTimeFormatterBuilder;
import java.util.Date;
import java.util.Scanner;

public class WateringSystemManager {

    public WateringPlanEntry checkWateringInProgress() {
        Scanner fileReader = null;
        LocalDateTime currentDateTime = LocalDateTime.now();
        WateringPlanEntry out = null;

        try {
            fileReader = new Scanner(new File("plano_de_rega.csv"));

        } catch (FileNotFoundException e) {
            System.out.printf("ERRO: Não foi encontrado o plano de rega\n\n");
        }

        if (fileReader != null) {
            fileReader.nextLine(); //clean first line

            while (fileReader.hasNext()) {
                String[] line = fileReader.nextLine().split(";");
                LocalDate date = LocalDate.parse(line[0], DateTimeFormatter.ofPattern("yyyy-MM-dd"));
                String sector = line[1];

                int duration=-1;
                try {
                    duration = Integer.parseInt(line[2]);
                } catch (NumberFormatException e) {
                    e.printStackTrace();
                }

                LocalTime begin = LocalTime.parse(line[3], DateTimeFormatter.ISO_LOCAL_TIME);
                LocalTime end = LocalTime.parse(line[4], DateTimeFormatter.ISO_LOCAL_TIME);

                if (date.isEqual(currentDateTime.toLocalDate()) &&
                        currentDateTime.toLocalTime().isAfter(begin) &&
                        currentDateTime.toLocalTime().isBefore(end)) {

                    if (line.length == 6) {
                        String mix = line[5];
                        out = new WateringPlanEntry(date, sector, duration, begin, end, mix);
                    } else out = new WateringPlanEntry(date, sector, duration, begin, end);

                    break;
                }
            }
        }

        return out;
    }

    /*List<EstadoRega> estados = new ArrayList<>();

        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm");

        Scanner scanner = new Scanner(System.in);
        System.out.print("Insira o dia e hora a verificar (yyyy-MM-dd HH:mm): ");
        String userInput = scanner.nextLine();

        try (BufferedReader reader = new BufferedReader(new FileReader("plano_de_rega.csv"))) {
            String line;

            Date specifiedDate = dateFormat.parse(userInput);

            while ((line = reader.readLine()) != null) {
                if (!line.startsWith("Dia")) {
                    String[] rega = line.split(",");
                    Date inicioRega = dateFormat.parse(rega[0] + " " + rega[3]);
                    Date fimRega = dateFormat.parse(rega[0] + " " + rega[4]);

                    if (specifiedDate.after(inicioRega) && specifiedDate.before(fimRega)) {
                        String setor = rega[1];
                        long tempoRestante = (fimRega.getTime() - specifiedDate.getTime()) / (1000 * 60);
                        estados.add(new EstadoRega(true, setor, tempoRestante));
                    }
                }
            }

            if (estados.isEmpty()) {
                estados.add(new EstadoRega(false, null, 0));
            }

        } catch (IOException | ParseException e) {
            e.printStackTrace();
        }

        return estados;*/
}
