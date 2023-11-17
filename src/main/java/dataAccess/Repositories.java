package dataAccess;

public class Repositories {

    private static final Repositories instance = new Repositories();
    private SailorRepository sailorRepository = null;

    private Repositories() {
        sailorRepository = new SailorRepository();
    }

    public static Repositories getInstance() {
        return instance;
    }

    public SailorRepository getSailorRepository() {
        return sailorRepository;
    }

}
