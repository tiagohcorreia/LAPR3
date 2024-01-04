package controller;

import watering_system_manager.WateringPlanGenerator;

import java.io.BufferedReader;

/**
 * The type Generate watering plan ctrl.
 */
public class GenerateWateringPlanCtrl {

    /**
     * Generate watering plan.
     *
     * @param fileReader       the file reader
     * @param numberOfPlanDays the number of plan days
     */
    public void generateWateringPlan(BufferedReader fileReader, int numberOfPlanDays){
        WateringPlanGenerator generator=new WateringPlanGenerator(fileReader, numberOfPlanDays);
        generator.generatePlan();
    }
}
