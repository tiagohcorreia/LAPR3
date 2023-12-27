package watering_system_manager.watering_instructions;

import java.util.Objects;

public class FertigationInstruction extends WateringInstruction {

    private String mixName;
    private int fertigationRecurrence;

    private final String DEFAUTL_MIX_ID = "(no fertigation mix)";
    private final int DEFAULT_FERTIGATION_RECURRENCE = -1;

    public FertigationInstruction() {
        super();
        this.mixName = DEFAUTL_MIX_ID;
        this.fertigationRecurrence = DEFAULT_FERTIGATION_RECURRENCE;
    }

    public FertigationInstruction(String setor, int duracao, String regularidade, String mixName, int fertigationRecurrence) {
        super(setor, duracao, regularidade);
        this.mixName = mixName;
        this.fertigationRecurrence = fertigationRecurrence;
    }

    public String getMixName() {
        return mixName;
    }

    public int getFertigationRecurrence() {
        return fertigationRecurrence;
    }

    public void setMixName(String mixName) {
        this.mixName = mixName;
    }

    public void setFertigationRecurrence(int fertigationRecurrence) {
        this.fertigationRecurrence = fertigationRecurrence;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        if (!super.equals(o)) return false;
        FertigationInstruction that = (FertigationInstruction) o;
        return super.equals(that) && getFertigationRecurrence() == that.getFertigationRecurrence() && Objects.equals(getMixName(), that.getMixName());
    }

    @Override
    public int hashCode() {
        return Objects.hash(super.hashCode(), getMixName(), getFertigationRecurrence());
    }

    @Override
    public String toString() {
        return "FertigationInstruction{" +
                "regularidade='" + super.getRegularidade() + '\'' +
                ", setor=" + super.getSetor() +
                ", duracao=" + super.getDuracao() +
                ", mix=" + mixName +
                ", fertigationRecurrence=" + fertigationRecurrence +
                '}';
    }
}
