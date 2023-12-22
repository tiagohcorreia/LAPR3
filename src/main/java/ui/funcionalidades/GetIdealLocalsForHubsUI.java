package ui.funcionalidades;

import controller.GetIdealLocalsForHubsCtrl;
import esinf.model.Local;
import ui.utils.Utils;

import java.util.List;

public class GetIdealLocalsForHubsUI implements Runnable{

    GetIdealLocalsForHubsCtrl ctrl=new GetIdealLocalsForHubsCtrl();
    private int numberOFHubs;

    @Override
    public void run() {

    }

    public void getNumberOFHubs(){
        numberOFHubs=Utils.readIntegerFromConsole("Introduza o número de locais ideais pretendidos:");
    }

    /*public void displayIdealLocals(){
        List<Local> idealLocals=ctrl.getIdealLocalsForHubs(numberOFHubs);
        //Utils.
    }*/
}
