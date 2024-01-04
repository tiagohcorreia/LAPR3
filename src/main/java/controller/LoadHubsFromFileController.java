package controller;

import esinf.us_ei11.LoadHubsFromFile;

/**
 * The type Load hubs from file controller.
 */
public class LoadHubsFromFileController {

    /**
     * Instantiates a new Load hubs from file controller.
     */
    public LoadHubsFromFileController() {

    }

    /**
     * Load hubs boolean.
     *
     * @return the boolean
     */
    public boolean loadHubs() {

        LoadHubsFromFile hubs = new LoadHubsFromFile();
        return hubs.loadHubsFormFile("src/test/java/esinf/us_ei11/testFiles/hubs.txt");
    }
}
