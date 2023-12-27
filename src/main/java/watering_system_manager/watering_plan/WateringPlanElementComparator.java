package watering_system_manager.watering_plan;

import watering_system_manager.watering_plan.WateringPlanElement;

import java.text.ParseException;
import java.util.Comparator;
import java.util.Date;

public class WateringPlanElementComparator implements Comparator<WateringPlanElement> {

    @Override
    public int compare(WateringPlanElement o1, WateringPlanElement o2) {
        int out;
        out = o1.getDate().compareTo(o2.getDate());

        if (out == 0) {
            out = o1.getBegin().compareTo(o2.getBegin());
        }
        return out;
    }
}
