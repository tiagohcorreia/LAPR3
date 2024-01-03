package watering_system_manager.watering_plan;

import java.util.ArrayList;

/**
 * The type Watering plan.
 */
public class WateringPlan {
    private ArrayList<WateringPlanEntry> plan=new ArrayList<>();

    /**
     * Gets list.
     *
     * @return the list
     */
    public ArrayList<WateringPlanEntry> getList() {
        return plan;
    }

    /**
     * Add element boolean.
     *
     * @param e the e
     * @return the boolean
     */
    public boolean addElement(WateringPlanEntry e){
        return plan.add(e);
    }
}
