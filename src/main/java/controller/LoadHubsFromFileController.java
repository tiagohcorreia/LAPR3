package controller;

import esinf.us_ei11.LoadHubsFromFile;

public class LoadHubsFromFileController {

    public LoadHubsFromFileController() {

    }

    public boolean loadHubs() {

        LoadHubsFromFile hubs = new LoadHubsFromFile();
        return hubs.loadHubsFormFile();
    }
}
