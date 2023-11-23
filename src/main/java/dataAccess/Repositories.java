package dataAccess;

public class Repositories {

    private static final Repositories instance = new Repositories();
    private SailorRepository sailorRepository = null;
    private SementeiraRepository sementeiraRepository = null;
    private ColheitaRepository colheitaRepository = null;
    private MondaRepository mondaRepository = null;

    private OperacaoAgricolaRepository operacaoAgricolaRepository = null;

    private Repositories() {
        sailorRepository = new SailorRepository();
        sementeiraRepository = new SementeiraRepository();
        colheitaRepository = new ColheitaRepository();
        mondaRepository = new MondaRepository();
        operacaoAgricolaRepository  = new OperacaoAgricolaRepository();
    }

    public static Repositories getInstance() {
        return instance;
    }
    public MondaRepository getMondaRepository() {
        return mondaRepository;
    }
    public SailorRepository getSailorRepository() {
        return sailorRepository;
    }
    public SementeiraRepository getSementeiraRepository() {
        return sementeiraRepository;
    }
    public ColheitaRepository getColheitaRepository() { return colheitaRepository; }
    public OperacaoAgricolaRepository getOperacaoAgricolaRepository() { return operacaoAgricolaRepository;}

}
