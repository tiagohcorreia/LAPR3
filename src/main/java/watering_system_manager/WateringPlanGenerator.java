package watering_system_manager;

import dataAccess.Repositories;
import watering_system_manager.exceptions.*;
import watering_system_manager.watering_instructions.FertigationInstruction;
import watering_system_manager.watering_instructions.WateringInstruction;
import watering_system_manager.watering_plan.WateringPlan;
import watering_system_manager.watering_plan.WateringPlanEntry;
import watering_system_manager.watering_plan.WateringPlanEntryComparator;

import java.io.*;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalTime;
import java.time.ZoneId;
import java.util.*;


public class WateringPlanGenerator {

    private BufferedReader fileReader;
    private int numberOfPlanDays;
    private WateringPlan plan;
    private List<String[]> adjustedPlanoDeRega;

    public WateringPlanGenerator(BufferedReader fileReader, int numberOfPlanDays) {
        this.fileReader = fileReader;
        this.numberOfPlanDays = numberOfPlanDays;
    }

    public void generatePlan() {
        if (plan == null) {
            parse();
        }
    }

    public void parse() {
        ArrayList<WateringInstruction> instructions = new ArrayList<>();
        ArrayList<LocalTime> wateringMoments = new ArrayList<>();

        if (fileReader != null) {
            getWateringInstructions(fileReader, wateringMoments, instructions);
        }

        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        Calendar calendar = Calendar.getInstance();
        Date generationDate = calendar.getTime();

        Map<WateringInstruction, ArrayList<Date>> instructionsAndWateringDays = new HashMap<>();

        for (WateringInstruction instruction : instructions) {
            ArrayList<Date> wateringDays = calculateWateringDays(generationDate, instruction.getRegularidade(), numberOfPlanDays);
            instructionsAndWateringDays.put(instruction, wateringDays);
        }
            /*
            for (Date date : wateringDays) {

                ArrayList<LocalTime> wateringMomentsCopy=new ArrayList<>(wateringMoments);

                for (LocalTime m : wateringMomentsCopy) {
                    calendar.setTime(date);
                    calendar.set(Calendar.HOUR_OF_DAY, m.getHour());
                    calendar.set(Calendar.MINUTE, m.getMinute());

                    LocalTime begin = m;
                    LocalTime end = calculateWateringEnd(calendar, instruction.getDuracao());
                    plan.addElement(new WateringPlanEntry(date, instruction.getSetor(), instruction.getDuracao(), begin, end));
                }
            }*/

        plan = generatePlan(generationDate, wateringMoments, instructionsAndWateringDays);
        plan.getList().sort(new WateringPlanEntryComparator());

        try (BufferedWriter writer = new BufferedWriter(new FileWriter("plano_de_rega.csv"))) {
            writer.write("Dia,Sector,Duracao,Inicio,Fim\n");
            for (WateringPlanEntry e : plan.getList()) {
                LocalDate localDate = e.getDate().toInstant().atZone(ZoneId.systemDefault()).toLocalDate();
                writer.write(String.format("%s,%s,%s,%s,%s\n", localDate, e.getSector(), e.getDuration(), e.getBegin(), e.getEnd()));
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    /**
     * initializes and returns a BufferedReader instance with the file specified during the execution of the method
     *
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
            } catch (NumberFormatException e) {

            }
        } while (!validIn);

        return reader;
    }

    public void getWateringInstructions(BufferedReader fileReader,
                                        ArrayList<LocalTime> horasDeRega,
                                        ArrayList<WateringInstruction> instructions) {
        Repositories repo = Repositories.getInstance();
        String line;
        int lineNumber = 1;

        try {

            while ((line = fileReader.readLine()) != null) {

                try {
                    if (lineNumber == 0) {

                        try {
                            String[] hours = line.split(",");

                            for (String h : hours) {
                                String[] parts = h.split(":");
                                int hour = Integer.parseInt(parts[0]);
                                int minute = Integer.parseInt(parts[1]);
                                horasDeRega.add(LocalTime.of(hour, minute));
                            }

                            horasDeRega.sort(LocalTime::compareTo);

                        } catch (NumberFormatException e) {
                            System.out.println("ERRO: Momentos de rega inválidos\n");
                        }

                    } else {
                        String[] elements = line.split(",");

                        if (elements.length == 3 || elements.length == 5) {
                            String sector = elements[0];
                            if (!repo.getWateringSectors().isThereSector(sector)) {
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

                            if (elements.length == 5) {
                                String mix = elements[3];
                                if (!repo.getFertigationMixes().isThereMix(mix)) {
                                    throw new InvalidMixException();
                                }

                                int fertigationRecurrence;
                                try {
                                    fertigationRecurrence = Integer.parseInt(elements[4]);
                                } catch (NumberFormatException e) {
                                    throw new InvalidFertigationRecurrenceException();
                                }

                                instructions.add(new FertigationInstruction(sector, duration, regularity, mix, fertigationRecurrence));

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

                } catch (InvalidDurationException e) {
                    System.out.printf("ERRO: Duração inválida na linha %d\n\n", lineNumber);

                } catch (InvalidSectorException e) {
                    System.out.printf("ERRO: Setor inválido na linha %d\n\n", lineNumber);

                } catch (InvalidMixException e) {
                    System.out.printf("ERRO: Mix inválido na linha %d\n\n", lineNumber);

                } catch (InvalidFertigationRecurrenceException e) {
                    System.out.printf("ERRO: Recorrência de fertirrega inválida na linha %d\n\n", lineNumber);

                }
            }
        } catch (IOException e) {
            e.printStackTrace();// Terminate the program
        }
    }

    private ArrayList<Date> calculateWateringDays(Date dataInicial, String regularidade, int numeroDeDias) {
        ArrayList<Date> datasDeRega = new ArrayList<>();
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

    private LocalTime calculateWateringEnd(Calendar wateringBegin, int duracao) {
        Calendar wateringEnd = (Calendar) wateringBegin.clone();
        wateringEnd.add(Calendar.MINUTE, duracao);

        SimpleDateFormat dateFormat = new SimpleDateFormat("HH:mm");
        String[] time = dateFormat.format(wateringEnd.getTime()).split(":");
        int hour = Integer.parseInt(time[0]);
        int minute = Integer.parseInt(time[1]);

        return LocalTime.of(hour, minute);
    }

    private WateringPlan generatePlan(Date generationDay, ArrayList<LocalTime> wateringMoments, Map<WateringInstruction, ArrayList<Date>> instructionsAndWateringDays) {
        WateringPlan plan = new WateringPlan();
        Calendar currentDate = Calendar.getInstance();
        currentDate.setTime(generationDay);

        for (int i = 0; i < numberOfPlanDays; i++) {
            LocalTime lastWatering = wateringMoments.get(0);
            LocalTime lastWateringCopy = LocalTime.of(lastWatering.getHour(), lastWatering.getMinute());

            for (int j = 0; j < wateringMoments.size(); j++) {

                if (wateringMoments.get(j).compareTo(lastWateringCopy) >= 0) {
                    lastWateringCopy = wateringMoments.get(j);

                    for (WateringInstruction instruction : instructionsAndWateringDays.keySet()) {

                        if (instructionsAndWateringDays.get(instruction).contains(currentDate.getTime())) {

                            String sector = instruction.getSetor();
                            int duration = instruction.getDuracao();
                            LocalTime wateringEnd = lastWateringCopy.plusMinutes(duration);

                            plan.addElement(new WateringPlanEntry(currentDate.getTime(), sector, duration, lastWateringCopy, wateringEnd));
                            lastWateringCopy = wateringEnd;
                        }
                    }
                } else try {
                    throw new OverlappingWateringCyclesException();

                } catch (OverlappingWateringCyclesException e) {
                    System.out.printf("ERRO: Sobreposição do ciclo das %s com o ciclo das %s\n\n", wateringMoments.get(j), wateringMoments.get(j - 1));
                }
            }

            currentDate.add(Calendar.DAY_OF_MONTH, 1);
        }
        return plan;
    }

    public void adjustWateringSchedule(String filePath) {
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

    public boolean isEven(int num) {
        return num % 2 == 0;
    }
}