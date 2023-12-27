package watering_system_manager.watering_plan;

import java.util.Comparator;

public class WateringPlanEntryComparator implements Comparator<WateringPlanEntry> {

    @Override
    public int compare(WateringPlanEntry o1, WateringPlanEntry o2) {
        int out;
        out = o1.getDate().compareTo(o2.getDate());

        if (out == 0) {
            out = o1.getBegin().compareTo(o2.getBegin());
        }
        return out;
    }
}
