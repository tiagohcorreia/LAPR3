package watering_system_manager.watering_instructions;

import java.util.Objects;

/**
 * The type Watering instruction.
 */
public class WateringInstruction {
    private String regularidade;
    private String setor;
    private int duracao;

    private final String DEFAULT_REGULARITY="(no regularity)";
    private final String DEFAULT_SECTOR="(no sector)";
    private final int DEFAULT_DURATION=-1;

    /**
     * Instantiates a new Watering instruction.
     */
    public WateringInstruction() {
        this.setor = DEFAULT_SECTOR;
        this.duracao = DEFAULT_DURATION;
        this.regularidade = DEFAULT_REGULARITY;
    }

    /**
     * Instantiates a new Watering instruction.
     *
     * @param setor        the setor
     * @param duracao      the duracao
     * @param regularidade the regularidade
     */
    public WateringInstruction(String setor, int duracao, String regularidade) {
        this.setor = setor;
        this.duracao = duracao;
        this.regularidade = regularidade;
    }

    /**
     * Gets regularidade.
     *
     * @return the regularidade
     */
    public String getRegularidade() {
        return regularidade;
    }

    /**
     * Gets setor.
     *
     * @return the setor
     */
    public String getSetor() {
        return setor;
    }

    /**
     * Gets duracao.
     *
     * @return the duracao
     */
    public int getDuracao() {
        return duracao;
    }

    /**
     * Sets regularidade.
     *
     * @param regularidade the regularidade
     */
    public void setRegularidade(String regularidade) {
        this.regularidade = regularidade;
    }

    /**
     * Sets setor.
     *
     * @param setor the setor
     */
    public void setSetor(String setor) {
        this.setor = setor;
    }

    /**
     * Sets duracao.
     *
     * @param duracao the duracao
     */
    public void setDuracao(int duracao) {
        this.duracao = duracao;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        WateringInstruction that = (WateringInstruction) o;
        return getDuracao() == that.getDuracao() && Objects.equals(getRegularidade(), that.getRegularidade()) && Objects.equals(getSetor(), that.getSetor());
    }

    @Override
    public int hashCode() {
        return Objects.hash(getRegularidade(), getSetor(), getDuracao());
    }

    @Override
    public String toString() {
        return "WateringInstruction{" +
                "regularidade='" + regularidade + '\'' +
                ", setor=" + setor +
                ", duracao=" + duracao +
                '}';
    }
}
