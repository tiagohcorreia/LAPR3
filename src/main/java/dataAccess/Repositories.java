package dataAccess;

import dataAccess.execution_methods.MetodoExcucaoRepository;
import dataAccess.fertigation_mixes.FertigationMixesRepository;
import dataAccess.pruning_operations.PodaRepository;
import dataAccess.seeding_operations.SeedingOperationsRepository;
import dataAccess.varieties.VariedadeRepository;
import dataAccess.watering_sectors.WateringSectorsRepository;
import esinf.store.GraphStore;

public class Repositories {

    private static final Repositories instance = new Repositories();
    private SeedingOperationsRepository SeedingOperationsRepository = null;
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
    private WateringSectorsRepository wateringSectors=new WateringSectorsRepository();
    private FertigationMixesRepository fertigationMixes=new FertigationMixesRepository();

    private Repositories() {
        SeedingOperationsRepository = new SeedingOperationsRepository();
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
    public SeedingOperationsRepository getSeedingOperationsRepository() {
        return SeedingOperationsRepository;
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
    public WateringSectorsRepository getWateringSectors(){
        return wateringSectors;
    }
    public FertigationMixesRepository getFertigationMixes(){
        return fertigationMixes;
    }


    public void clear(){
        graphStore.clean();
    }
}
