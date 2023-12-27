package watering_system_manager.watering_instructions;

import domain.WateringSector;

import java.util.Objects;

public class WateringInstruction {
    private String regularidade;
    private String setor;
    private int duracao;

    private final String DEFAULT_REGULARITY="(no regularity)";
    private final String DEFAULT_SECTOR="(no sector)";
    private final int DEFAULT_DURATION=-1;

    public WateringInstruction() {
        this.setor = DEFAULT_SECTOR;
        this.duracao = DEFAULT_DURATION;
        this.regularidade = DEFAULT_REGULARITY;
    }

    public WateringInstruction(String setor, int duracao, String regularidade) {
        this.setor = setor;
        this.duracao = duracao;
        this.regularidade = regularidade;
    }

    public String getRegularidade() {
        return regularidade;
    }

    public String getSetor() {
        return setor;
    }

    public int getDuracao() {
        return duracao;
    }

    public void setRegularidade(String regularidade) {
        this.regularidade = regularidade;
    }

    public void setSetor(String setor) {
        this.setor = setor;
    }

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
