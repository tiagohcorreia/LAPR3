package controller;

import esinf.Graph;
import esinf.model.Local;
import esinf.store.GraphStore;
import dataAccess.Repositories;

public class GetPossibleRoutesCtrl {

    private GraphStore graphStore = Repositories.getInstance().getGraphStore();

    public Graph<Local, Integer> getGraph(){
        return graphStore.getGraph();
    }
}
