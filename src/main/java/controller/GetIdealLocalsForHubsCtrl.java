package controller;

import esinf.IntegerBinaryOperator;
import esinf.IntegerComparator;
import esinf.model.Local;
import esinf.store.GraphStore;
import esinf.us_ei02.IdealVerticesCalculator;

import java.util.ArrayList;
import java.util.List;

public class GetIdealLocalsForHubsCtrl {

    private GraphStore graphStore=new GraphStore();

    /*public List<Local> getIdealLocalsForHubs(int n){

        IdealVerticesCalculator<Local, Integer> idealLocalsCalculator=new IdealVerticesCalculator<>(graphStore.getGraph(),
                new IntegerComparator(),
                new IntegerBinaryOperator(),
                0);

        ArrayList<Local> idealLocals=idealLocalsCalculator.getIdealVertices();
        return idealLocals.subList(0, n);
    }*/
}
