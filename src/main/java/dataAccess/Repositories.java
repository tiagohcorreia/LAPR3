package dataAccess;

import dataAccess.aplicacoes_fp.AplicacoesFPRepo;
import dataAccess.metodos_execucao.MetodoExecucaoRepository;
import dataAccess.fatores_producao.FatorProducaoRepository;
import dataAccess.others.OtherDataAccesses;
import dataAccess.receitas_fertirrega.ReceitasFertirregaRepository;
import dataAccess.metodos_aplicacao.MetodosAplicacaoRepo;
import dataAccess.operacoes_colheita.ColheitaRepository;
import dataAccess.operacoes_monda.MondaRepository;
import dataAccess.operacoes_poda.PodaRepository;
import dataAccess.produtos.ProdutoRepo;
import dataAccess.operacoes_sementeira.OperacoesSementeiraRepo;
import dataAccess.variedades.VariedadeRepository;
import dataAccess.setores_rega.SetoresRegaRepository;
import esinf.store.GraphStore;

public class Repositories {

    private static final Repositories instance = new Repositories();
    private OperacoesSementeiraRepo OperacoesSementeiraRepo = null;
    private ColheitaRepository colheitaRepository = null;
    private MondaRepository mondaRepository = null;
    private ParcelaRepository parcelaRepository = null;
    private VariedadeRepository variedadeRepository = null;
    private MetodoExecucaoRepository metodoExecucaoRepository = null;
    private OperacaoAgricolaRepository operacaoAgricolaRepository = null;
    private FatorProducaoRepository fatorProducaoRepository = null;
    private RegaRepository regaRepository = null;
    private PodaRepository podaRepository = null;
    private GraphStore graphStore=new GraphStore();
    private SetoresRegaRepository wateringSectors=new SetoresRegaRepository();
    private ReceitasFertirregaRepository fertigationMixes=new ReceitasFertirregaRepository();
    private MetodosAplicacaoRepo metodosAplicacao=new MetodosAplicacaoRepo();
    private ProdutoRepo produtos=new ProdutoRepo();
    private OtherDataAccesses others=new OtherDataAccesses();

    private AplicacoesFPRepo aplicacoesFP=new AplicacoesFPRepo();

    private Repositories() {
        OperacoesSementeiraRepo = new OperacoesSementeiraRepo();
        colheitaRepository = new ColheitaRepository();
        mondaRepository = new MondaRepository();
        operacaoAgricolaRepository  = new OperacaoAgricolaRepository();
        parcelaRepository = new ParcelaRepository();
        metodoExecucaoRepository = new MetodoExecucaoRepository();
        variedadeRepository = new VariedadeRepository();
        fatorProducaoRepository = new FatorProducaoRepository();
        regaRepository = new RegaRepository();
        podaRepository = new PodaRepository();
    }

    public static Repositories getInstance() {
        return instance;
    }
    public MondaRepository getMondaRepository() {
        return mondaRepository;
    }
    public ParcelaRepository getParcelaRepository() {
        return parcelaRepository;
    }
    public OperacoesSementeiraRepo getOperacoesSementeiraRepo() {
        return OperacoesSementeiraRepo;
    }
    public ColheitaRepository getColheitaRepository() { return colheitaRepository; }
    public OperacaoAgricolaRepository getOperacaoAgricolaRepository() { return operacaoAgricolaRepository;}
    public VariedadeRepository getVariedadeRepository() {
        return variedadeRepository;
    }
    public MetodoExecucaoRepository getMetodoExcucaoRepository() {
        return metodoExecucaoRepository;
    }
    public FatorProducaoRepository getFatorProducaoRepository() {
        return fatorProducaoRepository;
    }
    public RegaRepository getRegaRepository() { return regaRepository;}
    public PodaRepository getPodaRepository() { return podaRepository;}
    public GraphStore getGraphStore(){
        return graphStore;
    }
    public SetoresRegaRepository getSetoresRega(){
        return wateringSectors;
    }
    public ReceitasFertirregaRepository getReceitasFertirrega(){
        return fertigationMixes;
    }
    public MetodosAplicacaoRepo getMetodosAplicacao(){
        return metodosAplicacao;
    }
    public AplicacoesFPRepo getAplicacoesFP() {
        return aplicacoesFP;
    }
    public ProdutoRepo getProdutos() {
        return produtos;
    }

    public OtherDataAccesses getOthers() {
        return others;
    }

    public void clear(){
        graphStore.clean();
    }
}
