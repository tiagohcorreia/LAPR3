package controller;

import Class.Rega;
import Class.estadoRega;

import java.io.*;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;


public class RegaController {
    private List<String[]> planoDeRega;

    public void Parse() {

        List<String> horasDeRega = new ArrayList<>();
        List<Rega.RegaInstruction> instructions = new ArrayList<>();
        Scanner scanner = new Scanner(System.in);
        System.out.print("Insira a localizacao do ficheiro: ");
        String file = scanner.nextLine();


        try (BufferedReader reader = new BufferedReader(new FileReader(file))) {
            String line;
            int lineNumber = 0;

            while ((line = reader.readLine()) != null) {
                if (lineNumber == 0) {
                    String[] horas = line.split(",");
                    horasDeRega.addAll(Arrays.asList(horas));
                } else {
                    String[] elements = line.split(",");

                    String setor = elements[0].trim();
                    int duracao = Integer.parseInt(elements[1].trim());
                    String regularidade = elements[2].trim();
                    instructions.add(new Rega.RegaInstruction(setor, duracao, regularidade));

                }
                lineNumber++;
            }
        } catch (IOException e) {
            e.printStackTrace();
        }

        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd");
        Calendar calendar = Calendar.getInstance();
        Date dataDeGeracao = calendar.getTime();

        planoDeRega = new ArrayList<>();

        for (Rega.RegaInstruction instruction : instructions) {
            List<Date> datasDeRega = Rega.calcularDiasDeRega(dataDeGeracao, instruction.getRegularidade(), 30);
            for (Date data : datasDeRega) {
                for (String hora : horasDeRega) {
                    calendar.setTime(data);
                    String[] horaParts = hora.split(":");
                    calendar.set(Calendar.HOUR_OF_DAY, Integer.parseInt(horaParts[0]));
                    calendar.set(Calendar.MINUTE, Integer.parseInt(horaParts[1]));

                    String inicio = hora;
                    String fim = Rega.calcularFimRega(calendar, instruction.getDuracao());
                    planoDeRega.add(new String[]{
                            dateFormat.format(data),
                            instruction.getSetor(),
                            String.valueOf(instruction.getDuracao()),
                            inicio,
                            fim
                    });
                }
            }
        }

        Comparator<String[]> dateComparator = (rega1, rega2) -> {
            try {
                Date date1 = dateFormat.parse(rega1[0]);
                Date date2 = dateFormat.parse(rega2[0]);
                return date1.compareTo(date2);
            } catch (ParseException e) {
                e.printStackTrace();
                return 0;
            }
        };

        Collections.sort(planoDeRega, dateComparator);

        try (BufferedWriter writer = new BufferedWriter(new FileWriter("plano_de_rega.csv"))) {
            writer.write("Dia,Sector,Duracao,Inicio,Fim\n");
            for (String[] rega : planoDeRega) {
                writer.write(String.join(",", rega) + "\n");
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public List<estadoRega> verificarEstadoAtual() {
        List<estadoRega> estados = new ArrayList<>();

        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm");
        Calendar data = Calendar.getInstance();
        Date dataAtual = data.getTime();

        for (String[] rega : planoDeRega) {
            try {
                Date inicioRega = dateFormat.parse(rega[0] + " " + rega[3]);
                Date fimRega = dateFormat.parse(rega[0] + " " + rega[4]);

                if (dataAtual.after(inicioRega) && dataAtual.before(fimRega)) {
                    String sector = rega[1];
                    long tempoRestante = (fimRega.getTime() - dataAtual.getTime()) / (1000 * 60);
                    estados.add(new estadoRega(true, sector, tempoRestante));
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        if (estados.isEmpty()) {
            estados.add(new estadoRega(false, null, 0));
        }

        return estados;
    }
}