package esinf.usei04;

import esinf.Graph;
import esinf.model.Local;

import java.util.List;

public class ReturnData {

    private Graph graph;
    private List<Local> listaEgdes;
    private List<Double> listaPesos;
    private double pesoTotal;

    public ReturnData(Graph graph, List<Local> listaEgdes, List<Double> listaPesos, double pesoTotal) {
        this.graph = graph;
        this.listaEgdes = listaEgdes;
        this.listaPesos = listaPesos;
        this.pesoTotal = pesoTotal;
    }

    public ReturnData() {
    }

    public Graph getGraph() {
        return graph;
    }

    public List<Local> getListaEgdes() {
        return listaEgdes;
    }

    public List<Double> getListaPesos() {
        return listaPesos;
    }

    public double getPesoTotal() {
        return pesoTotal;
    }

    @Override
    public String toString() {

        final StringBuilder sb = new StringBuilder("RetrunData{");

        sb.append("graph=").append(graph);
        sb.append(", listaEgdes=").append(listaEgdes);
        sb.append(", listaPesos=").append(listaPesos);
        sb.append(", pesoTotal=").append(pesoTotal);
        sb.append('}');
        return sb.toString();
    }
}
