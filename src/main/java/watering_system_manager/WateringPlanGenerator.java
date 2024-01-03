package watering_system_manager;

import dataAccess.Repositories;
import watering_system_manager.exceptions.*;
import watering_system_manager.watering_instructions.FertigationInstruction;
import watering_system_manager.watering_instructions.WateringInstruction;
import watering_system_manager.watering_plan.WateringPlan;
import watering_system_manager.watering_plan.WateringPlanEntry;
import watering_system_manager.watering_plan.WateringPlanEntryComparator;

import java.io.*;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.util.*;


public class WateringPlanGenerator {

    private BufferedReader fileReader;
    private int numberOfPlanDays;
    private LocalDate generationDay;
    private WateringPlan plan;
    //private List<String[]> adjustedPlanoDeRega;

    public WateringPlanGenerator(BufferedReader fileReader, int numberOfPlanDays) {
        this.fileReader = fileReader;
        this.numberOfPlanDays = numberOfPlanDays;
        generationDay = LocalDate.now();
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
            getWateringInstructions(wateringMoments, instructions);
        }

        Map<WateringInstruction, ArrayList<LocalDate>> instructionsAndWateringDays = new HashMap<>();
        Map<WateringInstruction, ArrayList<LocalDate>> instructionsAndFertigationDays = new HashMap<>();


        for (int i = 0; i < instructions.size(); i++) {
            WateringInstruction instruction = instructions.get(i);
            ArrayList<LocalDate> wateringDays = calculateWateringDays(instruction.getRegularidade());
            instructionsAndWateringDays.put(instruction, wateringDays);

            if (instruction instanceof FertigationInstruction) {

                try {
                    ArrayList<LocalDate> fertigationDays = calculateFertigationDays(((FertigationInstruction) instruction).getFertigationRecurrence(), wateringDays);
                    instructionsAndFertigationDays.put(instruction, fertigationDays);

                } catch (InvalidFertigationRecurrenceException e) {
                    System.err.printf("ERRO: Recorrência de fertirrega incompatível com a regularidade da rega na instrução número %d\n\n", i + 1);
                }
            }
        }

        plan = generatePlan(wateringMoments, instructions, instructionsAndWateringDays, instructionsAndFertigationDays);
        plan.getList().sort(new WateringPlanEntryComparator());
        generateOutputFile();

    }

    public void getWateringInstructions(ArrayList<LocalTime> horasDeRega,
                                        ArrayList<WateringInstruction> instructions) {
        Repositories repo = Repositories.getInstance();
        String line;
        int lineNumber = 0;

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
                            if (!repo.getSetoresRega().isThereSector(sector)) {
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

                                if (repo.getReceitasFertirrega().isThereMix(mix)) {

                                    int fertigationRecurrence;
                                    try {
                                        fertigationRecurrence = Integer.parseInt(elements[4]);
                                        instructions.add(new FertigationInstruction(sector, duration, regularity, mix, fertigationRecurrence));

                                    } catch (NumberFormatException e) {
                                        System.out.printf("ERRO: Recorrência de fertirrega inválida na linha %d\n\n", lineNumber + 1);
                                        instructions.add(new WateringInstruction(sector, duration, regularity));
                                    }

                                } else {
                                    System.out.printf("ERRO: Mix inválido na linha %d\n\n", lineNumber + 1);
                                    instructions.add(new WateringInstruction(sector, duration, regularity));
                                }

                            } else {
                                instructions.add(new WateringInstruction(sector, duration, regularity));
                            }

                        } else {
                            throw new InvalidNumberOfColumnsException();
                        }
                    }

                } catch (InvalidNumberOfColumnsException e) {
                    System.out.printf("ERRO: Número inválido de colunas na linha %d\n\n", lineNumber + 1);

                } catch (InvalidRegularityException e) {
                    System.out.printf("ERRO: Regularidade inválida na linha %d\n\n", lineNumber + 1);

                } catch (InvalidDurationException e) {
                    System.out.printf("ERRO: Duração inválida na linha %d\n\n", lineNumber + 1);

                } catch (InvalidSectorException e) {
                    System.out.printf("ERRO: Setor inválido na linha %d\n\n", lineNumber + 1);
                }

                lineNumber++;
            }
        } catch (IOException e) {
            e.printStackTrace();// Terminate the program
        }
    }

    private ArrayList<LocalDate> calculateWateringDays(String regularidade) {
        ArrayList<LocalDate> datasDeRega = new ArrayList<>();
        LocalDate currentDay = LocalDate.of(generationDay.getYear(), generationDay.getMonth(), generationDay.getDayOfMonth());

        switch (regularidade) {
            case "T":
                for (int i = 0; i < numberOfPlanDays; i++) {
                    datasDeRega.add(currentDay);
                    currentDay = currentDay.plusDays(1);
                }
                break;
            case "I":
                for (int i = 0; i < numberOfPlanDays; i++) {

                    if (currentDay.getDayOfMonth() % 2 != 0) {
                        datasDeRega.add(currentDay);
                    }
                    currentDay = currentDay.plusDays(1);
                }
                break;
            case "P":
                for (int i = 0; i < numberOfPlanDays; i++) {
                    if (currentDay.getDayOfMonth() % 2 == 0) {
                        datasDeRega.add(currentDay);
                    }
                    currentDay = currentDay.plusDays(1);
                }
                break;
            case "3":
                for (int i = 0; i < numberOfPlanDays / 3; i++) {
                    datasDeRega.add(currentDay);
                    currentDay = currentDay.plusDays(3);
                }
                break;
        }
        return datasDeRega;
    }

    private ArrayList<LocalDate> calculateFertigationDays(int recurrence, ArrayList<LocalDate> wateringDays) throws InvalidFertigationRecurrenceException {
        ArrayList<LocalDate> fertigationDays = new ArrayList<>();
        LocalDate day = LocalDate.of(generationDay.getYear(), generationDay.getMonth(), generationDay.getDayOfMonth());

        while (day.isBefore(generationDay.plusDays(numberOfPlanDays))) {

            if (wateringDays.contains(day)) {
                fertigationDays.add(day);
            } else throw new InvalidFertigationRecurrenceException();

            day = day.plusDays(recurrence);
        }
        return fertigationDays;
    }

    private WateringPlan generatePlan(ArrayList<LocalTime> wateringMoments,
                                      ArrayList<WateringInstruction> instructions,
                                      Map<WateringInstruction, ArrayList<LocalDate>> instructionsAndWateringDays,
                                      Map<WateringInstruction, ArrayList<LocalDate>> instructionsAndFertigationDays) {

        WateringPlan plan = new WateringPlan();
        LocalDate day = LocalDate.of(generationDay.getYear(), generationDay.getMonth(), generationDay.getDayOfMonth());

        for (int i = 0; i < numberOfPlanDays; i++) {
            LocalTime lastWatering = wateringMoments.get(0);
            LocalTime lastWateringCopy = LocalTime.of(lastWatering.getHour(), lastWatering.getMinute());

            for (int j = 0; j < wateringMoments.size(); j++) {

                if (!wateringMoments.get(j).isBefore(lastWateringCopy)) {
                    lastWateringCopy = wateringMoments.get(j);

                    for (WateringInstruction instruct : instructions) {

                        if (instructionsAndWateringDays.get(instruct).contains(day)) {

                            String sector = instruct.getSetor();
                            int duration = instruct.getDuracao();
                            LocalTime wateringEnd = lastWateringCopy.plusMinutes(duration);

                            LocalDateTime wateringDateTime=LocalDateTime.of(day, lastWateringCopy);
                            if (LocalDateTime.now().isBefore(wateringDateTime)) {

                                if (instruct instanceof FertigationInstruction &&
                                        instructionsAndFertigationDays.get(instruct) != null &&
                                        instructionsAndFertigationDays.get(instruct).contains(day)) {

                                    plan.addElement(new WateringPlanEntry(day, sector, duration, lastWateringCopy, wateringEnd, ((FertigationInstruction) instruct).getMixName()));

                                } else {
                                    plan.addElement(new WateringPlanEntry(day, sector, duration, lastWateringCopy, wateringEnd));
                                }
                            }

                            lastWateringCopy = wateringEnd;
                        }

                    }

                } else try {
                    throw new OverlappingWateringCyclesException();

                } catch (OverlappingWateringCyclesException e) {
                    System.out.printf("ERRO: Sobreposição do ciclo das %s com o ciclo das %s\n\n", wateringMoments.get(j), wateringMoments.get(j - 1));
                }
            }

            day = day.plusDays(1);
        }
        return plan;
    }

    private void generateOutputFile() {
        try (BufferedWriter writer = new BufferedWriter(new FileWriter("plano_de_rega.csv"))) {
            writer.write("Dia(yyyy-mm-dd),Sector,Duracao(mn),Inicio,Fim\n");
            for (WateringPlanEntry e : plan.getList()) {
                if (e.isFertigation()) {
                    writer.write(String.format("%s,%s,%s,%s,%s,%s\n", e.getDate(), e.getSector(), e.getDuration(), e.getBegin(), e.getEnd(), e.getMix()));
                } else {
                    writer.write(String.format("%s,%s,%s,%s,%s\n", e.getDate(), e.getSector(), e.getDuration(), e.getBegin(), e.getEnd()));
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    /*public void adjustWateringSchedule(String filePath) {
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
    }*/
}