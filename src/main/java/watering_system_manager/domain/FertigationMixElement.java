package watering_system_manager.domain;

import domain.FatorProducao;

import java.util.Objects;

public class FertigationMixElement {

    private FatorProducao productionFactor;
    private float quantity;
    private Unit unit;

    private final FatorProducao DEFAULT_PRODUCTION_FACTOR=new FatorProducao();
    private final float DEFAULT_QUANTITY=-1;
    private final Unit DEFAULT_UNIT=new Unit();

    public FertigationMixElement(){
        this.productionFactor=DEFAULT_PRODUCTION_FACTOR;
        this.quantity=DEFAULT_QUANTITY;
        this.unit=DEFAULT_UNIT;
    }

    public FertigationMixElement(FatorProducao productionFactor, float quantity, Unit unit) {
        this.productionFactor = productionFactor;
        this.quantity = quantity;
        this.unit = unit;
    }

    public FatorProducao getProductionFactor() {
        return productionFactor;
    }

    public float getQuantity() {
        return quantity;
    }

    public Unit getUnit() {
        return unit;
    }

    public void setProductionFactor(FatorProducao productionFactor) {
        this.productionFactor = productionFactor;
    }

    public void setQuantity(float quantity) {
        this.quantity = quantity;
    }

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
