package controller.us_bd06;

import dataAccess.Repositories;
import domain.Parcela;

import java.util.List;

public class ObterFpPorTipoController {

    Repositories repo = Repositories.getInstance();

    public List<Parcela> getParcelas(){
        return repo.getParcelaRepository().getParcelas();
    }
}
