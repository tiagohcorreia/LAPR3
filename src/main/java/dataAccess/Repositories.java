package dataAccess;

import dataAccess.aplicacoes_fp.AplicacoesFPRepo;
import dataAccess.metodos_execucao.MetodoExecucaoRepository;
import dataAccess.fatores_producao.FatorProducaoRepository;
import dataAccess.others.OtherDataAccesses;
import dataAccess.parcelas.ParcelaRepository;
import dataAccess.receitas_fertirrega.ReceitasFertirregaRepository;
import dataAccess.metodos_aplicacao.MetodosAplicacaoRepo;
import dataAccess.operacoes_colheita.ColheitaRepository;
import dataAccess.operacoes_monda.MondaRepository;
import dataAccess.operacoes_poda.PodaRepository;
import dataAccess.produtos.ProdutoRepo;
import dataAccess.operacoes_sementeira.OperacoesSementeiraRepo;
import dataAccess.tipos_fp.TiposFPRepo;
import dataAccess.variedades.VariedadeRepository;
import dataAccess.setores_rega.SetoresRegaRepository;
import esinf.store.GraphStore;

/**
 * The type Repositories.
 */
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
    private TiposFPRepo tiposFP=new TiposFPRepo();

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

    /**
     * Gets instance.
     *
     * @return the instance
     */
    public static Repositories getInstance() {
        return instance;
    }

    /**
     * Gets monda repository.
     *
     * @return the monda repository
     */
    public MondaRepository getMondaRepository() {
        return mondaRepository;
    }

    /**
     * Gets parcela repository.
     *
     * @return the parcela repository
     */
    public ParcelaRepository getParcelaRepository() {
        return parcelaRepository;
    }

    /**
     * Gets operacoes sementeira repo.
     *
     * @return the operacoes sementeira repo
     */
    public OperacoesSementeiraRepo getOperacoesSementeiraRepo() {
        return OperacoesSementeiraRepo;
    }

    /**
     * Gets colheita repository.
     *
     * @return the colheita repository
     */
    public ColheitaRepository getColheitaRepository() { return colheitaRepository; }

    /**
     * Gets operacao agricola repository.
     *
     * @return the operacao agricola repository
     */
    public OperacaoAgricolaRepository getOperacaoAgricolaRepository() { return operacaoAgricolaRepository;}

    /**
     * Gets variedade repository.
     *
     * @return the variedade repository
     */
    public VariedadeRepository getVariedadeRepository() {
        return variedadeRepository;
    }

    /**
     * Gets metodo excucao repository.
     *
     * @return the metodo excucao repository
     */
    public MetodoExecucaoRepository getMetodoExcucaoRepository() {
        return metodoExecucaoRepository;
    }

    /**
     * Gets fator producao repository.
     *
     * @return the fator producao repository
     */
    public FatorProducaoRepository getFatorProducaoRepository() {
        return fatorProducaoRepository;
    }

    /**
     * Gets rega repository.
     *
     * @return the rega repository
     */
    public RegaRepository getRegaRepository() { return regaRepository;}

    /**
     * Gets poda repository.
     *
     * @return the poda repository
     */
    public PodaRepository getPodaRepository() { return podaRepository;}

    /**
     * Get graph store graph store.
     *
     * @return the graph store
     */
    public GraphStore getGraphStore(){
        return graphStore;
    }

    /**
     * Get setores rega setores rega repository.
     *
     * @return the setores rega repository
     */
    public SetoresRegaRepository getSetoresRega(){
        return wateringSectors;
    }

    /**
     * Get receitas fertirrega receitas fertirrega repository.
     *
     * @return the receitas fertirrega repository
     */
    public ReceitasFertirregaRepository getReceitasFertirrega(){
        return fertigationMixes;
    }

    /**
     * Get metodos aplicacao metodos aplicacao repo.
     *
     * @return the metodos aplicacao repo
     */
    public MetodosAplicacaoRepo getMetodosAplicacao(){
        return metodosAplicacao;
    }

    /**
     * Gets aplicacoes fp.
     *
     * @return the aplicacoes fp
     */
    public AplicacoesFPRepo getAplicacoesFP() {
        return aplicacoesFP;
    }

    /**
     * Gets produtos.
     *
     * @return the produtos
     */
    public ProdutoRepo getProdutos() {
        return produtos;
    }

    /**
     * Gets others.
     *
     * @return the others
     */
    public OtherDataAccesses getOthers() {
        return others;
    }

    /**
     * Get tipos fp tipos fp repo.
     *
     * @return the tipos fp repo
     */
    public TiposFPRepo getTiposFP(){
        return tiposFP;
    }

    /**
     * Clear.
     */
    public void clear(){
        graphStore.clean();
    }
}
