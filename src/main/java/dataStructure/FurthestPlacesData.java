package dataStructure;

import esinf.model.Local;

import java.util.LinkedList;
import java.util.List;
import java.util.Objects;

public class FurthestPlacesData {
    private final Local DEFAULT_LOCAL = null;
    private final double DEFAULT_DISTANCE = 0;
    private Local local1;
    private Local local2;
    private double autonomiaDoVeiculoUsado;
    private LinkedList<Local> shortPath;
    private double distanciaEntreLocais;
    private List<Local> locaisDePassagem;
    private List<Local> locaisDeCarregamento;
    private List<Distancia> distancia;
    private int numeroDeParagensDoVeiculo;



    private int numeroDeCarregamento;

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof FurthestPlacesData that)) return false;
        return Double.compare(that.DEFAULT_DISTANCE, DEFAULT_DISTANCE) == 0 && Double.compare(that.getDistanciaEntreLocais(), getDistanciaEntreLocais()) == 0 && Double.compare(that.getAutonomiaDoVeiculoUsado(), getAutonomiaDoVeiculoUsado()) == 0 && getNumeroDeParagensDoVeiculo() == that.getNumeroDeParagensDoVeiculo() && getNumeroDeCarregamento() == that.getNumeroDeCarregamento() && Double.compare(that.getDistanciaTotalDoPercurso(), getDistanciaTotalDoPercurso()) == 0 && DEFAULT_LOCAL.equals(that.DEFAULT_LOCAL) && getLocal1().equals(that.getLocal1()) && getLocal2().equals(that.getLocal2()) && getShortPath().equals(that.getShortPath()) && getLocaisDePassagem().equals(that.getLocaisDePassagem()) && getLocaisDeCarregamento().equals(that.getLocaisDeCarregamento()) && getDistancia().equals(that.getDistancia());
    }

    @Override
    public int hashCode() {
        return Objects.hash(DEFAULT_LOCAL, DEFAULT_DISTANCE, getLocal1(), getLocal2(), getDistanciaEntreLocais(), getAutonomiaDoVeiculoUsado(), getShortPath(), getLocaisDePassagem(), getLocaisDeCarregamento(), getDistancia(), getNumeroDeParagensDoVeiculo(), getNumeroDeCarregamento(), getDistanciaTotalDoPercurso());
    }

    private double distanciaTotalDoPercurso;

    public FurthestPlacesData() {
        this.local1 = DEFAULT_LOCAL;
        this.local2 = DEFAULT_LOCAL;
        this.distanciaEntreLocais = DEFAULT_DISTANCE;
    }

    public FurthestPlacesData(Local local1, Local local2, double distanciaEntreLocais) {
        this.local1 = local1;
        this.local2 = local2;
        this.distanciaEntreLocais = distanciaEntreLocais;
    }

    public Local getLocal1() {
        return local1;
    }

    public void setLocal1(Local local1) {
        this.local1 = local1;
    }

    public Local getLocal2() {
        return local2;
    }

    public void setLocal2(Local local2) {
        this.local2 = local2;
    }

    public double getDistanciaEntreLocais() {
        return distanciaEntreLocais;
    }

    public void setDistanciaEntreLocais(double distanciaEntreLocais) {
        this.distanciaEntreLocais = distanciaEntreLocais;
    }

    public double getAutonomiaDoVeiculoUsado() {
        return autonomiaDoVeiculoUsado;
    }

    public void setAutonomiaDoVeiculoUsado(double autonomiaDoVeiculoUsado) {
        this.autonomiaDoVeiculoUsado = autonomiaDoVeiculoUsado;
    }

    public LinkedList<Local> getShortPath() {
        return shortPath;
    }

    public void setShortPath(LinkedList<Local> shortPath) {
        this.shortPath = shortPath;
    }

    public List<Local> getLocaisDePassagem() {
        return locaisDePassagem;
    }

    public void setLocaisDePassagem(List<Local> locaisDePassagem) {
        this.locaisDePassagem = locaisDePassagem;
    }

    public List<Local> getLocaisDeCarregamento() {
        return locaisDeCarregamento;
    }

    public void setLocaisDeCarregamento(List<Local> locaisDeCarregamento) {
        this.locaisDeCarregamento = locaisDeCarregamento;
    }

    public List<Distancia> getDistancia() {
        return distancia;
    }

    public void setDistancia(List<Distancia> distancia) {
        this.distancia = distancia;
    }

    public int getNumeroDeParagensDoVeiculo() {
        return numeroDeParagensDoVeiculo;
    }

    public void setNumeroDeParagensDoVeiculo(int numeroDeParagensDoVeiculo) {
        this.numeroDeParagensDoVeiculo = numeroDeParagensDoVeiculo;
    }

    public int getNumeroDeCarregamento() {
        return numeroDeCarregamento;
    }

    public void setNumeroDeCarregamento(int numeroDeCarregamento) {
        this.numeroDeCarregamento = numeroDeCarregamento;
    }

    public double getDistanciaTotalDoPercurso() {
        return distanciaTotalDoPercurso;
    }

    public void setDistanciaTotalDoPercurso(double distanciaTotalDoPercurso) {
        this.distanciaTotalDoPercurso = distanciaTotalDoPercurso;
    }
    @Override
    public String toString() {
        return "FurthestPlacesData{" +
                ", local1=" + local1 +
                ", local2=" + local2 +
                ", distanciaEntreLocais=" + distanciaEntreLocais +
                ", autonomiaDoVeiculoUsado=" + autonomiaDoVeiculoUsado +
                ", shortPath=" + shortPath +
                ", locaisDePassagem=" + locaisDePassagem +
                ", locaisDeCarregamento=" + locaisDeCarregamento +
                ", distancia=" + distancia +
                ", numeroDeParagensDoVeiculo=" + numeroDeParagensDoVeiculo +
                ", numeroDeCarregamento=" + numeroDeCarregamento +
                ", distanciaTotalDoPercurso=" + distanciaTotalDoPercurso +
                '}';
    }
}
