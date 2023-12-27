package watering_system_manager;

import dataAccess.Repositories;
import watering_system_manager.exceptions.*;
import watering_system_manager.watering_instructions.WateringInstruction;

import java.io.*;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;


public class WateringPlanGenerator {

    private List<String[]> planoDeRega;
    private List<String[]> adjustedPlanoDeRega;

    public void parse() {
        BufferedReader reader = getInstructionsFileReader();
        ArrayList<WateringInstruction> instructions = new ArrayList<>();
        ArrayList<String> horasDeRega = new ArrayList<>();


        if (reader != null) {
            getWateringInstructions(reader, horasDeRega, instructions);
        }

        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        Calendar calendar = Calendar.getInstance();
        Date dataDeGeracao = calendar.getTime();

        planoDeRega = new ArrayList<>();

        for (WateringInstruction instruction : instructions) {
            List<Date> datasDeRega = calcularDiasDeRega(dataDeGeracao, instruction.getRegularidade(), 30);
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

    /**
     * initializes and returns a BufferedReader instance with the file specified during the execution of the method
     * @return the BufferedReader instance initialized with the specified file, or returns null if the user abort the operation
     */
    public BufferedReader getInstructionsFileReader() {
        Scanner scanner = new Scanner(System.in);
        boolean validIn = false;
        BufferedReader reader = null;
        String input;

        do {
            System.out.println("Insira a localizacao do ficheiro ou 0 para cancelar: ");
            input = scanner.nextLine();

            try {
                if (Integer.parseInt(input) != 0) {
                    reader = new BufferedReader(new FileReader(input));
                }
                validIn = true;
            } catch (FileNotFoundException e) {
                System.out.println("O ficheiro indicado é inválido\n");
            }
        } while (!validIn);

        return reader;
    }

    public boolean getWateringInstructions(BufferedReader fileReader,
                                           ArrayList<String> horasDeRega,
                                           ArrayList<WateringInstruction> instructions) {
        boolean success = false;
        Repositories repo=Repositories.getInstance();
        String line;
        int lineNumber = 0;

        try {

            while ((line = fileReader.readLine()) != null) {

                try {
                    if (lineNumber == 0) {
                        String[] horas = line.split(",");
                        horasDeRega.addAll(Arrays.asList(horas));

                    } else {
                        String[] elements = line.split(",");

                        if (elements.length == 3 || elements.length == 5) {
                            String sector = elements[0];
                            if (!repo.getWateringSectors().isThereSector(sector)){
                                throw new InvalidSectorException();
                            }

                            int duration;
                            try {
                                duration = Integer.parseInt(elements[1].trim());
                            } catch (NumberFormatException e) {
                                throw new InvalidDurationException();
                            }

                            String regularity = elements[2].trim();
                            if (!Rega.isValidRegularidade(regularity)) {
                                throw new InvalidRegularityException();
                            }

                            if (elements.length==5){
                                String mix=elements[3];
                                if (!repo.getFertigationMixes().isThereMix(mix)){
                                    throw new InvalidMixException();
                                }

                            } else {
                                instructions.add(new WateringInstruction(sector, duration, regularity));
                            }

                        } else {
                            throw new InvalidNumberOfColumnsException();
                        }
                    }

                    lineNumber++;

                } catch (InvalidNumberOfColumnsException e) {
                    System.out.printf("ERRO: Número inválido de colunas na linha %d\n\n", lineNumber);

                } catch (InvalidRegularityException e) {
                    System.out.printf("ERRO: Regularidade inválida na linha %d\n\n", lineNumber);

                } catch (InvalidDurationException e){
                    System.out.printf("ERRO: Duração inválida na linha %d\n\n", lineNumber);

                } catch (InvalidSectorException e){
                    System.out.printf("ERRO: Setor inválido na linha %d\n\n", lineNumber);

                } catch (InvalidMixException e){
                    System.out.printf("ERRO: Mix inválido na linha %d\n\n", lineNumber);

                } catch (SQLException e){
                    System.out.println("ERRO: Erro ao conectar à base de dados\n");
                }
            }

            success = true;

        } catch (IOException e) {
            e.printStackTrace();// Terminate the program
        }

        return success;
    }

    private List<Date> calcularDiasDeRega(Date dataInicial, String regularidade, int numeroDeDias) {
        List<Date> datasDeRega = new ArrayList<>();
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(dataInicial);

        if (regularidade.equals("T")) {
            for (int i = 0; i < numeroDeDias; i++) {
                datasDeRega.add(calendar.getTime());
                calendar.add(Calendar.DAY_OF_MONTH, 1);
            }
        } else if (regularidade.equals("I")) {
            for (int i = 0; i < numeroDeDias; i++) {

                if (calendar.get(Calendar.DAY_OF_MONTH) % 2 != 0) {
                    datasDeRega.add(calendar.getTime());
                }
                calendar.add(Calendar.DAY_OF_MONTH, 1);
            }
        } else if (regularidade.equals("P")) {
            for (int i = 0; i < numeroDeDias; i++) {
                if (calendar.get(Calendar.DAY_OF_MONTH) % 2 == 0) {
                    datasDeRega.add(calendar.getTime());
                }
                calendar.add(Calendar.DAY_OF_MONTH, 1);
            }
        } else if (regularidade.equals("3")) {
            for (int i = 0; i < numeroDeDias / 3; i++) {
                datasDeRega.add(calendar.getTime());
                calendar.add(Calendar.DAY_OF_MONTH, 3);
            }
        }
        return datasDeRega;
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


                    if (!data.equals(auxData) && auxData != null) {
                        lastEndTime = startTimeString;
                    }

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

    public boolean checkValidFertigationRecurrence(String regularity, int recurrence){
        if (regularity.equalsIgnoreCase("T")){
            return true;
        }
        if (regularity.equalsIgnoreCase("P") && Calendar.getInstance(). isEven(recurrence)){
            return true;
        }
    }

    public boolean isEven(int num){
        return num % 2 == 0;
    }
}