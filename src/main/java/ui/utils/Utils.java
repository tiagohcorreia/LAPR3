package ui.utils;

import domain.DatabaseObject;
import ui.DatabaseConnectionTestUI;
import ui.ExitUI;
import ui.menu.MenuItem;

import java.io.*;
import java.security.InvalidParameterException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;
import java.time.format.DateTimeParseException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class Utils {

    /**
     * Read line from console string.
     *
     * @param prompt the prompt
     * @return the string
     */
    static public String readLineFromConsole(String prompt) {
        try {
            System.out.println(prompt);

            InputStreamReader converter = new InputStreamReader(System.in);
            BufferedReader in = new BufferedReader(converter);

            String line = in.readLine();
            System.out.println();
            return line;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    /**
     * Read integer from console int.
     *
     * @param prompt the prompt
     * @return the int
     */
    static public int readIntegerFromConsole(String prompt) {
        int value = -1;
        boolean valid = false;
        do {
            try {
                String input = readLineFromConsole(prompt);

                value = Integer.parseInt(input);
                valid = true;
            } catch (NumberFormatException ex) {
                System.out.println("ERRO: O valor introduzido não é um número inteiro\n");
            }
        } while (!valid);
        return value;
    }

    static public int readPositiveIntegerFromConsole(String prompt) {
        int value = -1;
        boolean valid = false;

        do {
            try {
                String input = readLineFromConsole(prompt);

                value = Integer.parseInt(input);
                if (value < 0) {
                    throw new InvalidParameterException();
                }

                valid = true;
            } catch (InvalidParameterException ex) {
                System.err.println("ERRO: O valor introduzido não é um inteiro positivo\n");
            } catch (NumberFormatException e){
                System.err.println("ERRO: O valor introduzido não é um inteiro positivo\n");
            }
        } while (!valid);

        return value;
    }

    /**
     * Read double from console double.
     *
     * @param prompt the prompt
     * @return the double
     */
    static public double readDoubleFromConsole(String prompt) {
        do {
            try {
                String input = readLineFromConsole(prompt);

                double value = Double.parseDouble(input);

                return value;
            } catch (NumberFormatException ex) {
                Logger.getLogger(Utils.class.getName()).log(Level.SEVERE, null, ex);
            }
        } while (true);
    }

    /**
     * Read long from console long.
     *
     * @param prompt the prompt
     * @return the long
     */
    static public long readLongFromConsole(String prompt) {
        do {
            try {
                String input = readLineFromConsole(prompt);

                long value = Long.parseLong(input);

                return value;
            } catch (NumberFormatException ex) {
                Logger.getLogger(Utils.class.getName()).log(Level.SEVERE, null, ex);
            }
        } while (true);
    }

    /**
     * Read date from console date.
     *
     * @param prompt the prompt
     * @return the date
     */
    static public Date readDateFromConsole(String prompt) {
        do {
            try {
                String strDate = readLineFromConsole(prompt + " (dd-mm-yyyy)");

                SimpleDateFormat df = new SimpleDateFormat("dd-MM-yyyy");
                Date date = df.parse(strDate);

                return date;
            } catch (ParseException ex) {
                System.err.println("ERRO: Formato de data inválido");
            }
        } while (true);
    }

    /**
     * Confirm boolean.
     *
     * @param message the message
     * @return the boolean
     */
    static public boolean confirm(String message) {
        String input;
        do {
            input = Utils.readLineFromConsole("\n" + message + "\n");
        } while (!input.equalsIgnoreCase("s") && !input.equalsIgnoreCase("n"));

        return input.equalsIgnoreCase("s");
    }

    /**
     * Show and select one object.
     *
     * @param list   the list
     * @param header the header
     * @return the object
     */
    static public Object showAndSelectOne(List list, String header) {
        showList(list, header);
        return selectsObject(list);
    }

    /**
     * Show and select index int.
     *
     * @param list   the list
     * @param header the header
     * @return the int
     */
    static public int showAndSelectIndex(List list, String header) {
        showList(list, header);
        return selectsIndex(list);
    }

    /**
     * Show list.
     *
     * @param list   the list
     * @param header the header
     */
    static public void showList(List list, String header) {
        System.out.println(header);

        int index = 0;
        for (Object o : list) {
            index++;

            System.out.println(index + ". " + o.toString());
        }
        System.out.println();
        System.out.println("0 - Cancel");
    }

    /**
     * Selects object object.
     *
     * @param list the list
     * @return the object
     */
    static public Object selectsObject(List list) {
        String input;
        Integer value;
        do {
            input = Utils.readLineFromConsole("Insira uma opcao: ");
            value = Integer.valueOf(input);
        } while (value < 0 || value > list.size());

        if (value == 0) {
            return null;
        } else {
            return list.get(value - 1);
        }
    }

    /**
     * Selects index int.
     *
     * @param list the list
     * @return the int
     */
    static public int selectsIndex(List list) {
        String input;
        Integer value;
        do {
            input = Utils.readLineFromConsole("Insira uma opcao: ");
            try {
                value = Integer.valueOf(input);
            } catch (NumberFormatException ex) {
                value = -1;
            }
        } while (value < 0 || value > list.size());

        return value - 1;
    }

    static public boolean sendEmail(String email, String content) {
        String filename = email.replace("@", "_at_");
        try {
            FileWriter file = new FileWriter(new File("APP_FILES/" + filename + "_email.txt"));
            file.write(content + "\n");
            file.close();
        } catch (IOException e) {
            System.out.println("Error creating email file");
            e.printStackTrace();
        }
        return true;
    }

    /**
     * Read float from console double.
     *
     * @param prompt the prompt
     * @return the float
     */
    public static float readFloatFromConsole(String prompt) {

        do {
            try {
                String input = readLineFromConsole(prompt);

                float value = Float.parseFloat(input);

                return value;

            } catch (NumberFormatException ex) {

                Logger.getLogger(Utils.class.getName()).log(Level.SEVERE, null, ex);
            }

        } while (true);
    }

    static public void enterToContinue() {
        readLineFromConsole("Press [Enter] to continue...");
    }

    static public <E> E showAndSelectOneGeneric(List<E> list, String header) {
        showListGeneric(list, header);
        return selectObjectGeneric(list);
    }

    static public <E> void showListGeneric(List<E> list, String header) {
        System.out.println(header);

        int index = 0;
        for (E o : list) {
            index++;

            System.out.println(index + ". " + o.toString());
        }
        System.out.println();
        System.out.println("0 - Cancel");
    }

    static public <E> E selectObjectGeneric(List<E> list) {
        String input;
        int value;

        do {
            input = Utils.readLineFromConsole("Insira uma opcao: ");
            value = Integer.parseInt(input);
        } while (value < 0 || value > list.size());

        if (value == 0) {
            return null;
        } else {
            return list.get(value - 1);
        }
    }

    public static void runMenu(List<MenuItem> options, String header) {
        String space = "----------------";
        int option = 0;

        do {
            option = Utils.showAndSelectIndex(options, String.format("%s  %s  %s", space, header, space));

            if ((option >= 0) && (option < options.size())) {
                options.get(option).run();
            }
        } while (option != -1);
    }

    public static boolean getBooleanAnswer(String header) {
        ArrayList<String> yes_or_no = new ArrayList<>();
        yes_or_no.add("Sim");
        yes_or_no.add("Não");

        int in = showAndSelectIndex(yes_or_no, header);
        return in == 0;
    }

    public static <E extends DatabaseObject> void printDatabaseObjects(List<E> list, String h1, String h2) {
        printTableHeader(h1, h2);
        for (E o : list) {
            printTableLine(String.valueOf(o.getID()), o.getName());
        }
    }

    private static void printTableHeader(String s1, String s2) {
        System.out.printf("%50s|\t%50s|\n", s1, s2);
        printTableSeparator(2);
    }

    private static void printTableLine(String s1, String s2) {
        System.out.printf("%50s|\t%50s|\n", s1, s2);
        printTableSeparator(2);
    }

    private static void printTableSeparator(int columnCount) {

        for (int i = 0; i < columnCount; i++) {
            System.out.printf("%50s|\t", "--------------------------------------------------");
        }
        System.out.println();
    }

    public static LocalDate getLocalDateFromConsole(String header, String dateFormat) {
        boolean validInput = false;
        LocalDate date = null;

        do {
            String input = readLineFromConsole(header);

            try {
                date = LocalDate.parse(input, DateTimeFormatter.ofPattern(dateFormat));
                validInput = true;

            } catch (DateTimeParseException e) {
                System.out.println("Data inválida\n");
            } catch (Exception e) {
                e.printStackTrace();
            }

        } while (!validInput);

        return date;
    }

    /**
     * prints the elements from the param list and asks the to select the id
     * it checks automatically if the select id is valid, and asks to select again if necessary
     * @param list list of options
     * @param h1 header of first column
     * @param h2 header of second column
     * @param prompt message to be displayed to the user, like "choose the wanted id"
     * @return the id selected
     * @param <E> the elements of the list must implement the interface DatabaseObject
     */
    public static <E extends DatabaseObject> int getTableIdFromConsole(List<E> list, String h1, String h2, String prompt) {
        printDatabaseObjects(list, h1, h2);
        boolean validInput = false;
        int input;

        do {
            input = readIntegerFromConsole(prompt);
            for (DatabaseObject o : list) {
                if (o.getID() == input) {
                    validInput = true;
                    break;
                }
            }
            if (!validInput) {
                System.out.println("ERRO: ID inválido\n");
            }
        } while (!validInput);

        return input;
    }

}
