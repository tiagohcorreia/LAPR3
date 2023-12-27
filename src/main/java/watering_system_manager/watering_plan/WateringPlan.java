package watering_system_manager.watering_plan;

import java.util.ArrayList;

public class WateringPlan {
    private ArrayList<WateringPlanElement> plan=new ArrayList<>();

    public ArrayList<WateringPlanElement> getList() {
        return plan;
    }

    public boolean addElement(WateringPlanElement e){
        return plan.add(e);
    }
}
