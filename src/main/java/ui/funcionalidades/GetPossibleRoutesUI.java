package ui.funcionalidades;

import esinf.model.Hub;
import esinf.model.Local;
import esinf.store.GraphStore;
import ui.utils.Utils;

import java.util.ArrayList;

public class GetPossibleRoutesUI implements Runnable{

    Local origin;
    Hub destiny;
    int autonomy;

    GraphStore graphStore=new GraphStore();

    @Override
    public void run() {
        getOrigin();
    }

    public void getOrigin(){
        ArrayList<Local> locals=graphStore.getGraph().vertices();
        origin=Utils.showAndSelectOneGeneric(locals, "Selecione o local de partida:");
    }
}
