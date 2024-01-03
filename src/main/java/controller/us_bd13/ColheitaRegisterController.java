package controller.us_bd13;

import dataAccess.Repositories;
import domain.*;

import java.time.LocalDate;
import java.util.List;

public class ColheitaRegisterController {
    Repositories repo=Repositories.getInstance();

    public List<Parcela> getParcelas(){
        return repo.getParcelaRepository().getParcelas();
    }

    public List<Produto> getProdutosInParcela(int parcelId){
        return repo.getProdutos().getProdutosInParcela(parcelId);
    }

    public List<MetodoExecucao> getMetodosExecucao(){
        return repo.getMetodoExcucaoRepository().getMetodosExecucao();
    }

    public boolean registerColheita(LocalDate data, int parcelaId, int produtoId, double quantidade, int metodoExecucaoId){
        return repo.getColheitaRepository().colheitaRegister(data, parcelaId, produtoId, quantidade, metodoExecucaoId);
    }
}
