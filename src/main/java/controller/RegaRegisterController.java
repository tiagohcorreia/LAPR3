package controller;

import domain.RegaTable;
import dataAccess.RegaRepository;
import dataAccess.Repositories;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.sql.*;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Objects;

/**
 * The type Rega register controller.
 */
public class RegaRegisterController {

    private RegaRepository regaRepository;
    private List<RegaTable> regaTableList;

    /**
     * Instantiates a new Rega register controller.
     */
    public RegaRegisterController() {
        this.regaTableList = new ArrayList<>();
        getRegaRepository();
    }

    private RegaRepository getRegaRepository() {
        if (Objects.isNull(regaRepository)) {
            Repositories repositories = Repositories.getInstance();
            regaRepository = repositories.getRegaRepository();
        }
        return regaRepository;
    }

    /**
     * Rega register.
     *
     * @param operacaoId the operacao id
     * @param setor      the setor
     * @param duracao    the duracao
     * @param hora       the hora
     * @throws SQLException the sql exception
     */
    public void regaRegister(int operacaoId, String setor, int duracao, String hora) throws SQLException {
        RegaRepository.regaRegister(operacaoId, setor, duracao, hora);
    }


    /**
     * Read csv.
     *
     * @param filePath the file path
     */
    public void readCSV(String filePath) {
        try (BufferedReader br = new BufferedReader(new FileReader(filePath))) {
            String line;
            boolean isHeader = true;

            while ((line = br.readLine()) != null) {
                if (isHeader) {
                    isHeader = false;
                    continue;
                }

                String[] parts = line.split(",");
                if (parts.length >= 5) {
                    try {
                        int operacaoId = new OperacaoAgricolaRegisterController().getNextId();
                        Date data = new SimpleDateFormat("yyyy-MM-dd").parse(parts[0]);
                        String sectorId = (parts[1].trim());
                        int duration = Integer.parseInt(parts[2].trim());
                        String startTime = parts[3].trim();
                        if(!(parts.length==6)){
                        regaTableList.add(new RegaTable(data,operacaoId, sectorId, duration, startTime));
                        }
                        else{
                            String mix = parts[5].trim();
                            regaTableList.add(new RegaTable(data,operacaoId, sectorId,duration,startTime,mix));
                        }
                    }catch (ParseException | NumberFormatException e) {
                        e.printStackTrace();
                    }

                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    /**
     * Gets rega table list.
     *
     * @return the rega table list
     */
    public List<RegaTable> getRegaTableList() {
        return regaTableList;
    }

    /**
     * Gets rega table.
     *
     * @param index the index
     * @return the rega table
     */
    public RegaTable getRegaTable(int index) {
        if (index >= 0 && index < regaTableList.size()) {
            return regaTableList.get(index);
        }
        return null;
    }
}
