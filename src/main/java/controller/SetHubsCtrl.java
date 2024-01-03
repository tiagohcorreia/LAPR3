package controller;

import esinf.IntegerBinaryOperator;
import esinf.IntegerComparator;
import esinf.dataStructure.VertexMetrics;
import esinf.model.Local;
import esinf.store.GraphStore;
import esinf.us_ei02.IdealVerticesCalculator;
import dataAccess.Repositories;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * The type Set hubs ctrl.
 */
public class SetHubsCtrl {

    private GraphStore graphStore= Repositories.getInstance().getGraphStore();

    /**
     * Get number of simple locals int.
     *
     * @return the int
     */
    public int getNumberOfSimpleLocals(){
        return graphStore.getSimpleLocals().size();
    }

    /**
     * Get ideal locals for hubs list.
     *
     * @param n the n
     * @return the list
     */
    public List<VertexMetrics<Local, Integer>> getIdealLocalsForHubs(int n){

        IdealVerticesCalculator<Local, Integer> idealLocalsCalculator=new IdealVerticesCalculator<>(graphStore.getGraph(),
                graphStore.getSimpleLocals(),
                new IntegerComparator(),
                new IntegerBinaryOperator(),
                0);

        ArrayList<VertexMetrics<Local, Integer>> idealLocals=idealLocalsCalculator.getIdealVertices();
        return idealLocals.subList(0, n);
    }

    /**
     * Generate hubs boolean.
     *
     * @param localsAndDischargeTimes the locals and discharge times
     * @return the boolean
     */
    public boolean generateHubs(Map<Local, Integer> localsAndDischargeTimes){
        return graphStore.generateHubs(localsAndDischargeTimes);
    }
}
