package esinf.dataStructure;

import esinf.model.Hub;
import esinf.model.Local;

import java.util.List;

public class PathWithMostHubsData {
    private final int DEFAULT_VALUE = 0;
    private final Local DEFAULT_LOCAL = null;
    private final Local DEFAULT_DISTANCE = null;

    private final List<Local> DEFAULT_SHORTPATH = null;
    private final double DEFAULT_VALUE2 = 0;
    private final List<Distance> DEFAULT_DISTANCE2 = null;


    private Local origin;  //local de partida
    private List<Hub> hubs; //locais(hubs) de passagem em Hubs
    List<Record> arrivingHourInEachHub;
    private double pathTotalDistance; // distancia do percurso inteiro
    private int numberOfTimesTheVehicleWasCharged;

    private double vehicleAutonomy; //autonomia do veiculo
    private double vehicleSpeed; //velocidade do veiculo
    private double distanceFromOriginToDestination;// todos os locals
    private List<Local> vehicleChargeStops; //onde o veiculo carregou
    private List<Distance> distanceBetweenLocals;//distancia entre todos os pares
    private int vehiclesStops; //nmr de lugares onde o veiculo parou


}
