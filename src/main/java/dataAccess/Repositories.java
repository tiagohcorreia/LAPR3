package dataAccess;

import esinf.store.GraphStore;

public class Repositories {

    private static final Repositories instance = new Repositories();
    private SementeiraRepository sementeiraRepository = null;
    private ColheitaRepository colheitaRepository = null;
    private MondaRepository mondaRepository = null;
    private ParcelaRepository parcelaRepository = null;
    private VariedadeRepository variedadeRepository = null;
    private MetodoExcucaoRepository metodoExcucaoRepository = null;
    private OperacaoAgricolaRepository operacaoAgricolaRepository = null;
    private FatorProducaoRepository fatorProducaoRepository = null;
    private RegaRepository regaRepository = null;
    private PodaRepository podaRepository = null;
    private GraphStore graphStore=new GraphStore();

    private Repositories() {
        sementeiraRepository = new SementeiraRepository();
        colheitaRepository = new ColheitaRepository();
        mondaRepository = new MondaRepository();
        operacaoAgricolaRepository  = new OperacaoAgricolaRepository();
        parcelaRepository = new ParcelaRepository();
        metodoExcucaoRepository = new MetodoExcucaoRepository();
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
    public SementeiraRepository getSementeiraRepository() {
        return sementeiraRepository;
    }
    public ColheitaRepository getColheitaRepository() { return colheitaRepository; }
    public OperacaoAgricolaRepository getOperacaoAgricolaRepository() { return operacaoAgricolaRepository;}
    public VariedadeRepository getVariedadeRepository() {
        return variedadeRepository;
    }
    public MetodoExcucaoRepository getMetodoExcucaoRepository() {
        return metodoExcucaoRepository;
    }
    public FatorProducaoRepository getFatorProducaoRepository() {
        return fatorProducaoRepository;
    }
    public RegaRepository getRegaRepository() { return regaRepository;}
    public PodaRepository getPodaRepository() { return podaRepository;}

    public GraphStore getGraphStore(){
        return graphStore;
    }

}
