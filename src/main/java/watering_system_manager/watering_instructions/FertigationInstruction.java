package watering_system_manager.watering_instructions;

import java.util.Objects;

/**
 * The type Fertigation instruction.
 */
public class FertigationInstruction extends WateringInstruction {

    private String mixName;
    private int fertigationRecurrence;

    private final String DEFAUTL_MIX_ID = "(no fertigation mix)";
    private final int DEFAULT_FERTIGATION_RECURRENCE = -1;

    /**
     * Instantiates a new Fertigation instruction.
     */
    public FertigationInstruction() {
        super();
        this.mixName = DEFAUTL_MIX_ID;
        this.fertigationRecurrence = DEFAULT_FERTIGATION_RECURRENCE;
    }

    /**
     * Instantiates a new Fertigation instruction.
     *
     * @param setor                 the setor
     * @param duracao               the duracao
     * @param regularidade          the regularidade
     * @param mixName               the mix name
     * @param fertigationRecurrence the fertigation recurrence
     */
    public FertigationInstruction(String setor, int duracao, String regularidade, String mixName, int fertigationRecurrence) {
        super(setor, duracao, regularidade);
        this.mixName = mixName;
        this.fertigationRecurrence = fertigationRecurrence;
    }

    /**
     * Gets mix name.
     *
     * @return the mix name
     */
    public String getMixName() {
        return mixName;
    }

    /**
     * Gets fertigation recurrence.
     *
     * @return the fertigation recurrence
     */
    public int getFertigationRecurrence() {
        return fertigationRecurrence;
    }

    /**
     * Sets mix name.
     *
     * @param mixName the mix name
     */
    public void setMixName(String mixName) {
        this.mixName = mixName;
    }

    /**
     * Sets fertigation recurrence.
     *
     * @param fertigationRecurrence the fertigation recurrence
     */
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
