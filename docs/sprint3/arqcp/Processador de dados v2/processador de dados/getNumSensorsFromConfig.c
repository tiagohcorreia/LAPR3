#include <sys/stat.h>
#include "c.h"
#include <stdlib.h>
#include <stdio.h>

int getNumSensorsFromConfig(const char *configFilePath) {
    FILE *configFile = fopen(configFilePath, "r");
    if (configFile == NULL) {
        perror("Error opening configuration file");
        exit(EXIT_FAILURE);
    }

    int numSensors = 0;
    char line[256];


    while (fgets(line, sizeof(line), configFile) != NULL) {

        if (strspn(line, " \t\n") < strlen(line) - 1) {
            numSensors++;
        }
    }

    fclose(configFile);

    return numSensors;
}
