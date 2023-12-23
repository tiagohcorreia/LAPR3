package controller;

import esinf.Graph;
import esinf.model.Local;
import esinf.store.GraphStore;

public class GetPossibleRoutesCtrl {

    private GraphStore graphStore = new GraphStore();

    public Graph<Local, Integer> getGraph(){
        return graphStore.getGraph();
    }
}
