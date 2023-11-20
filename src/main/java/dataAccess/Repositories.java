package dataAccess;

public class Repositories {

    private static final Repositories instance = new Repositories();
    private SailorRepository sailorRepository = null;
    private SementeiraRepository sementeiraRepository = null;

    private Repositories() {
        sailorRepository = new SailorRepository();
        sementeiraRepository = new SementeiraRepository();
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

}
