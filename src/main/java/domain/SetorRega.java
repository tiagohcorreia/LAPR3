package domain;

import java.util.Date;
import java.util.Objects;

/**
 * The type Setor rega.
 */
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

    /**
     * Instantiates a new Setor rega.
     */
    public SetorRega() {
        this.id = DEFAULT_ID;
        this.name=DEFAULT_NAME;
        this.area = DEFAULT_AREA;
        this.maximumFlowRate = DEFAULT_MAXIMUM_FLOW_RATE;
        this.beginDate = DEFAULT_BEGIN_DATE;
        this.endDate = DEFAULT_END_DATE;
        this.dispensingMethodId = DEFAULT_DISPENSING_METHOD_ID;
    }

    /**
     * Instantiates a new Setor rega.
     *
     * @param id                 the id
     * @param name               the name
     * @param area               the area
     * @param maximumFlowRate    the maximum flow rate
     * @param beginDate          the begin date
     * @param endDate            the end date
     * @param dispensingMethodId the dispensing method id
     */
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

    /**
     * Gets area.
     *
     * @return the area
     */
    public float getArea() {
        return area;
    }

    /**
     * Gets maximum flow rate.
     *
     * @return the maximum flow rate
     */
    public float getMaximumFlowRate() {
        return maximumFlowRate;
    }

    /**
     * Gets begin date.
     *
     * @return the begin date
     */
    public Date getBeginDate() {
        return beginDate;
    }

    /**
     * Gets end date.
     *
     * @return the end date
     */
    public Date getEndDate() {
        return endDate;
    }

    /**
     * Gets dispensing method id.
     *
     * @return the dispensing method id
     */
    public int getDispensingMethodId() {
        return dispensingMethodId;
    }

    /**
     * Sets id.
     *
     * @param id the id
     */
    public void setId(int id) {
        this.id = id;
    }

    /**
     * Sets name.
     *
     * @param name the name
     */
    public void setName(String name) {
        this.name = name;
    }

    /**
     * Sets area.
     *
     * @param area the area
     */
    public void setArea(float area) {
        this.area = area;
    }

    /**
     * Sets maximum flow rate.
     *
     * @param maximumFlowRate the maximum flow rate
     */
    public void setMaximumFlowRate(float maximumFlowRate) {
        this.maximumFlowRate = maximumFlowRate;
    }

    /**
     * Sets begin date.
     *
     * @param beginDate the begin date
     */
    public void setBeginDate(Date beginDate) {
        this.beginDate = beginDate;
    }

    /**
     * Sets end date.
     *
     * @param endDate the end date
     */
    public void setEndDate(Date endDate) {
        this.endDate = endDate;
    }

    /**
     * Sets dispensing method id.
     *
     * @param dispensingMethodId the dispensing method id
     */
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
