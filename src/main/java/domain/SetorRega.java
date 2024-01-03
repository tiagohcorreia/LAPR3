package domain;

import java.util.Date;
import java.util.Objects;

public class SetorRega implements DatabaseObject{
    private int id;
    private String name;
    private float area;
    private float maximumFlowRate;
    private Date beginDate;
    private Date endDate;
    private int dispensingMethodId;

    private final int DEFAULT_ID=-1;
    private final String DEFAULT_NAME="(no name)";
    private final float DEFAULT_AREA=-1;
    private final float DEFAULT_MAXIMUM_FLOW_RATE=-1;
    private final Date DEFAULT_BEGIN_DATE=new Date();
    private final Date DEFAULT_END_DATE=new Date();
    private final int DEFAULT_DISPENSING_METHOD_ID=-1;

    public SetorRega() {
        this.id = DEFAULT_ID;
        this.name=DEFAULT_NAME;
        this.area = DEFAULT_AREA;
        this.maximumFlowRate = DEFAULT_MAXIMUM_FLOW_RATE;
        this.beginDate = DEFAULT_BEGIN_DATE;
        this.endDate = DEFAULT_END_DATE;
        this.dispensingMethodId = DEFAULT_DISPENSING_METHOD_ID;
    }

    public SetorRega(int id, String name, float area, float maximumFlowRate, Date beginDate, Date endDate, int dispensingMethodId) {
        this.id = id;
        this.name = name;
        this.area = area;
        this.maximumFlowRate = maximumFlowRate;
        this.beginDate = beginDate;
        this.endDate = endDate;
        this.dispensingMethodId = dispensingMethodId;
    }

    public int getID() {
        return id;
    }

    public String getName() {
        return name;
    }

    public float getArea() {
        return area;
    }

    public float getMaximumFlowRate() {
        return maximumFlowRate;
    }

    public Date getBeginDate() {
        return beginDate;
    }

    public Date getEndDate() {
        return endDate;
    }

    public int getDispensingMethodId() {
        return dispensingMethodId;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setArea(float area) {
        this.area = area;
    }

    public void setMaximumFlowRate(float maximumFlowRate) {
        this.maximumFlowRate = maximumFlowRate;
    }

    public void setBeginDate(Date beginDate) {
        this.beginDate = beginDate;
    }

    public void setEndDate(Date endDate) {
        this.endDate = endDate;
    }

    public void setDispensingMethodId(int dispensingMethodId) {
        this.dispensingMethodId = dispensingMethodId;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        SetorRega that = (SetorRega) o;
        return getID() == that.getID() &&
                getName().equals(that.getName()) &&
                Float.compare(getArea(), that.getArea()) == 0 && Float.compare(getMaximumFlowRate(), that.getMaximumFlowRate()) == 0 && getDispensingMethodId() == that.getDispensingMethodId() && Objects.equals(getBeginDate(), that.getBeginDate()) && Objects.equals(getEndDate(), that.getEndDate());
    }

    @Override
    public int hashCode() {
        return Objects.hash(getID(), getName(),getArea(), getMaximumFlowRate(), getBeginDate(), getEndDate(), getDispensingMethodId());
    }

    @Override
    public String toString() {
        return "WateringSector{" +
                "id=" + id +
                ", name=" + name +
                ", area=" + area +
                ", maximumFlowRate=" + maximumFlowRate +
                ", beginDate=" + beginDate +
                ", endDate=" + endDate +
                ", dispensingMethodId=" + dispensingMethodId +
                '}';
    }
}
