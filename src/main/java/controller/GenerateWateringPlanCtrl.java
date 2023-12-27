package controller;

import watering_system_manager.WateringPlanGenerator;

import java.io.BufferedReader;

public class GenerateWateringPlanCtrl {

    public void generateWateringPlan(BufferedReader fileReader, int numberOfPlanDays){
        WateringPlanGenerator generator=new WateringPlanGenerator(fileReader, numberOfPlanDays);
        generator.generatePlan();
    }
}
