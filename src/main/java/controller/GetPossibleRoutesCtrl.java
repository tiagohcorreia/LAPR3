package controller;

import esinf.Graph;
import esinf.model.Local;
import esinf.store.GraphStore;
import dataAccess.Repositories;

/**
 * The type Get possible routes ctrl.
 */
public class GetPossibleRoutesCtrl {

    private GraphStore graphStore = Repositories.getInstance().getGraphStore();

    /**
     * Get graph graph.
     *
     * @return the graph
     */
    public Graph<Local, Integer> getGraph(){
        return graphStore.getGraph();
    }
}
