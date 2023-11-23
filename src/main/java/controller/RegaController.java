package controller;

import classes.Rega;

import java.io.*;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;


public class RegaController {
    private List<String[]> planoDeRega;
    private List<String[]> adjustedPlanoDeRega;

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

                    if (elements.length == 3) {
                        String setor = elements[0].trim();

                        try {
                            int duracao = Integer.parseInt(elements[1].trim());


                            String regularidade = elements[2].trim();
                            if (Rega.isValidRegularidade(regularidade)) {
                                instructions.add(new Rega.RegaInstruction(setor, duracao, regularidade));
                            } else {
                                System.out.println("Erro: Valor de Regularidade errado na linha " + lineNumber);
                                System.exit(1);
                            }
                        } catch (NumberFormatException e) {
                            System.out.println("Erro: A segunda coluna tem que ser um valor do tipo numero na linha " + lineNumber);
                            System.exit(1);
                        }
                    } else {
                        System.out.println("Erro: Numero incorreto de colunas na linha " + lineNumber);
                        System.exit(1);
                    }
                }
                lineNumber++;
            }
        } catch (IOException e) {
            e.printStackTrace();
            System.exit(1); // Terminate the program
        }

        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
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

        SimpleDateFormat dateTimeFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm");

        Comparator<String[]> dateTimeComparator = (rega1, rega2) -> {
            try {
                Date date1 = dateTimeFormat.parse(rega1[0] + " " + rega1[3]); // Combine date and time for rega1
                Date date2 = dateTimeFormat.parse(rega2[0] + " " + rega2[3]); // Combine date and time for rega2
                return date1.compareTo(date2);
            } catch (ParseException e) {
                e.printStackTrace();
                return 0;
            }
        };

        Collections.sort(planoDeRega, dateTimeComparator);

        try (BufferedWriter writer = new BufferedWriter(new FileWriter("plano_de_rega.csv"))) {
            writer.write("Dia,Sector,Duracao,Inicio,Fim\n");
            for (String[] rega : planoDeRega) {
                writer.write(String.join(",", rega) + "\n");
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public void adjustRegaSchedule(String filePath) {
        try {
            adjustedPlanoDeRega = new ArrayList<>();
            SimpleDateFormat timeFormat = new SimpleDateFormat("HH:mm");
            String lastEndTime = "00:00";
            String auxData = null;

            BufferedReader reader = new BufferedReader(new FileReader(filePath));
            String line;

            while ((line = reader.readLine()) != null) {
                if (!line.startsWith("Dia")) {
                    String[] rega = line.split(",");
                    String data = rega[0];
                    String sector = rega[1];
                    int duration = Integer.parseInt(rega[2]);
                    String startTimeString = rega[3];
                    String endTimeString = rega[4];


                    if(!data.equals(auxData) && auxData != null){  lastEndTime = startTimeString;}

                    if (!startTimeString.equals("00:00") && timeFormat.parse(startTimeString).before(timeFormat.parse(lastEndTime))) {
                        startTimeString = lastEndTime;
                        Date lastEndTimeDate = timeFormat.parse(lastEndTime);
                        Calendar calendar = Calendar.getInstance();
                        calendar.setTime(lastEndTimeDate);
                        calendar.add(Calendar.MINUTE, duration);


                        endTimeString = timeFormat.format(calendar.getTime());
                    }

                    lastEndTime = endTimeString;

                    adjustedPlanoDeRega.add(new String[]{
                            rega[0], sector, rega[2], startTimeString, endTimeString
                    });

                    auxData = rega[0];
                }
            }

            reader.close();

            try (BufferedWriter writer = new BufferedWriter(new FileWriter(filePath))) {
                writer.write("Dia,Sector,Duracao,Inicio,Fim\n");
                for (String[] rega : adjustedPlanoDeRega) {
                    writer.write(String.join(",", rega) + "\n");
                }
                System.out.println("Plano de rega gerado com sucesso!\n");
            } catch (IOException e) {
                e.printStackTrace();
            }
        } catch (IOException | ParseException e) {
            e.printStackTrace();
        }
    }


}