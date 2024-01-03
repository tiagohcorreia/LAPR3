package domain;

import java.util.Objects;

/**
 * The type Fertigation mix element.
 */
public class FertigationMixElement {

    private FatorProducao productionFactor;
    private float quantity;
    private Unit unit;

    private final FatorProducao DEFAULT_PRODUCTION_FACTOR=new FatorProducao();
    private final float DEFAULT_QUANTITY=-1;
    private final Unit DEFAULT_UNIT=new Unit();

    /**
     * Instantiates a new Fertigation mix element.
     */
    public FertigationMixElement(){
        this.productionFactor=DEFAULT_PRODUCTION_FACTOR;
        this.quantity=DEFAULT_QUANTITY;
        this.unit=DEFAULT_UNIT;
    }

    /**
     * Instantiates a new Fertigation mix element.
     *
     * @param productionFactor the production factor
     * @param quantity         the quantity
     * @param unit             the unit
     */
    public FertigationMixElement(FatorProducao productionFactor, float quantity, Unit unit) {
        this.productionFactor = productionFactor;
        this.quantity = quantity;
        this.unit = unit;
    }

    /**
     * Gets production factor.
     *
     * @return the production factor
     */
    public FatorProducao getProductionFactor() {
        return productionFactor;
    }

    /**
     * Gets quantity.
     *
     * @return the quantity
     */
    public float getQuantity() {
        return quantity;
    }

    /**
     * Gets unit.
     *
     * @return the unit
     */
    public Unit getUnit() {
        return unit;
    }

    /**
     * Sets production factor.
     *
     * @param productionFactor the production factor
     */
    public void setProductionFactor(FatorProducao productionFactor) {
        this.productionFactor = productionFactor;
    }

    /**
     * Sets quantity.
     *
     * @param quantity the quantity
     */
    public void setQuantity(float quantity) {
        this.quantity = quantity;
    }

    /**
     * Sets unit.
     *
     * @param unit the unit
     */
    public void setUnit(Unit unit) {
        this.unit = unit;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        FertigationMixElement that = (FertigationMixElement) o;
        return Float.compare(getQuantity(), that.getQuantity()) == 0 && Objects.equals(getProductionFactor(), that.getProductionFactor()) && Objects.equals(getUnit(), that.getUnit());
    }

    @Override
    public int hashCode() {
        return Objects.hash(getProductionFactor(), getQuantity(), getUnit());
    }

    @Override
    public String toString() {
        return "FertigationMixElement{" +
                "productionFactor=" + productionFactor +
                ", quantity=" + quantity +
                ", unit=" + unit +
                '}';
    }
}
