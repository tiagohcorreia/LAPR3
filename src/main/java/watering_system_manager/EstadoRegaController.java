package watering_system_manager;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Scanner;

public class EstadoRegaController {
    private String filePath;  // Add a field to store the file path


    public List<EstadoRega> verificarEstadoAtual() {
        List<EstadoRega> estados = new ArrayList<>();

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

        return estados;
    }
}
