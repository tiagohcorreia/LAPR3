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

public class RegaRegisterController {

    private RegaRepository regaRepository;
    private List<RegaTable> regaTableList;

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

    public void regaRegister(int operacaoId, int setorId, int duracao, String hora) throws SQLException {
        RegaRepository.regaRegister(operacaoId, setorId, duracao, hora);
    }


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
                if (parts.length == 5) {
                    try {
                        int operacaoId = new OperacaoAgricolaRegisterController().getNextId();
                        Date data = new SimpleDateFormat("yyyy-MM-dd").parse(parts[0]);
                        int sectorId = Integer.parseInt(parts[1].trim());
                        int duration = Integer.parseInt(parts[2].trim());
                        String startTime = parts[3].trim();

                        regaTableList.add(new RegaTable(data,operacaoId, sectorId, duration, startTime));
                    } catch (ParseException | NumberFormatException e) {
                        e.printStackTrace();
                    }
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public List<RegaTable> getRegaTableList() {
        return regaTableList;
    }

    public RegaTable getRegaTable(int index) {
        if (index >= 0 && index < regaTableList.size()) {
            return regaTableList.get(index);
        }
        return null;
    }
}
