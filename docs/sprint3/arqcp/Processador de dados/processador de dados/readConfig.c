#include <sys/stat.h>
#include "c.h"
#include <stdlib.h>
#include <stdio.h>

void readConfigFile(const char* filename, Config** configs, int* num_configs) {
    FILE* file = fopen(filename, "r");
    if (file == NULL) {
        perror("Error opening configuration file");
        exit(EXIT_FAILURE);
    }

    *num_configs = 0;
    Config* temp_configs = NULL;

    while (1) {
        temp_configs = realloc(temp_configs, (*num_configs + 1) * sizeof(Config));
        if (temp_configs == NULL) {
            perror("Error reallocating memory for configurations");
            exit(EXIT_FAILURE);
        }

        int result = fscanf(file, "%d#%49[^#]#%19[^#]#%19[^#]#%19[^#]#%d",
                            &temp_configs[*num_configs].sensor_id,
                            temp_configs[*num_configs].type,
                            temp_configs[*num_configs].unit,
                            temp_configs[*num_configs].buffer_len,
                            temp_configs[*num_configs].window_len,
                            &temp_configs[*num_configs].timeout);

        if (result == EOF) {
            break;
        } else if (result != 6) {
            fprintf(stderr, "Error reading configuration file\n");
            exit(EXIT_FAILURE);
        }

        temp_configs[*num_configs].type[49] = '\0';
        temp_configs[*num_configs].unit[19] = '\0';
        temp_configs[*num_configs].buffer_len[19] = '\0';
        temp_configs[*num_configs].window_len[19] = '\0';

        (*num_configs)++;
    }

    *configs = malloc(*num_configs * sizeof(Config));
    if (*configs == NULL) {
        perror("Error allocating memory for configurations");
        exit(EXIT_FAILURE);
    }

    for (int i = 0; i < *num_configs; ++i) {
        (*configs)[i] = temp_configs[i];
    }

    free(temp_configs);

    fclose(file);
}