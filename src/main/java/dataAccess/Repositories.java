package dataAccess;

public class Repositories {

    private static final Repositories instance = new Repositories();
    private SailorRepository sailorRepository = null;
    private SementeiraRepository sementeiraRepository = null;
    private ColheitaRepository colheitaRepository = null;
    private OperacaoAgricolaRepository operacaoAgricolaRepository = null;

    private Repositories() {
        sailorRepository = new SailorRepository();
        sementeiraRepository = new SementeiraRepository();
        colheitaRepository = new ColheitaRepository();
        operacaoAgricolaRepository  = new OperacaoAgricolaRepository();
    }

    public static Repositories getInstance() {
        return instance;
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
