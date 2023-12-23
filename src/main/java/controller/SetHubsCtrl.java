package controller;

import esinf.IntegerBinaryOperator;
import esinf.IntegerComparator;
import esinf.dataStructure.VertexMetrics;
import esinf.model.Local;
import esinf.store.GraphStore;
import esinf.us_ei02.IdealVerticesCalculator;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class SetHubsCtrl {

    private GraphStore graphStore=new GraphStore();

    public int getNumberOfSimpleLocals(){
        return graphStore.getSimpleLocals().size();
    }

    public List<VertexMetrics<Local, Integer>> getIdealLocalsForHubs(int n){

        IdealVerticesCalculator<Local, Integer> idealLocalsCalculator=new IdealVerticesCalculator<>(graphStore.getGraph(),
                graphStore.getSimpleLocals(),
                new IntegerComparator(),
                new IntegerBinaryOperator(),
                0);

        ArrayList<VertexMetrics<Local, Integer>> idealLocals=idealLocalsCalculator.getIdealVertices();
        return idealLocals.subList(0, n);
    }

    public boolean generateHubs(Map<Local, Integer> localsAndDischargeTimes){
        return graphStore.generateHubs(localsAndDischargeTimes);
    }
}
