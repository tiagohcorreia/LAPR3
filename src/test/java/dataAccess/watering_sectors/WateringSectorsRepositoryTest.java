package dataAccess.watering_sectors;

import dataAccess.DatabaseConnection;
import dataAccess.Repositories;
import domain.WateringSector;
import org.junit.jupiter.api.Test;
import ui.Main;

import java.io.IOException;
import java.io.InputStream;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import static org.junit.jupiter.api.Assertions.*;

class WateringSectorsRepositoryTest {

    Repositories repo=Repositories.getInstance();

    @Test
    void getSectors() {
        ArrayList<WateringSector> sectors=repo.getWateringSectors().getSectors();
        for (WateringSector s: sectors){
            System.out.printf("%s\n\n", s);
        }
    }

    @Test
    void isThereSector() {
        boolean out1=repo.getWateringSectors().isThereSector("Setor 10");
        boolean out2=repo.getWateringSectors().isThereSector("setor 10");
        boolean out3=repo.getWateringSectors().isThereSector("SEtor 10");
        boolean out4=repo.getWateringSectors().isThereSector("SETOR 10");

        assertEquals(true, out1);
        assertEquals(true, out2);
        assertEquals(true, out3);
        assertEquals(true, out4);

        boolean out5=repo.getWateringSectors().isThereSector("Setor10");
        boolean out6=repo.getWateringSectors().isThereSector("Setor 90");

        assertEquals(false, out5);
        assertEquals(false, out6);
    }
}