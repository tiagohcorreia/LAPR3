package watering_system_manager.watering_plan;

import java.util.ArrayList;

public class WateringPlan {
    private ArrayList<WateringPlanEntry> plan=new ArrayList<>();

    public ArrayList<WateringPlanEntry> getList() {
        return plan;
    }

    public boolean addElement(WateringPlanEntry e){
        return plan.add(e);
    }
}
