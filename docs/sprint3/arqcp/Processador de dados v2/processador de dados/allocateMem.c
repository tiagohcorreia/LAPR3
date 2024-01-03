#include <sys/stat.h>
#include "c.h"
#include <stdlib.h>
#include <stdio.h>


void allocateMemoryForSensor(SameSensor** sensor, Config* config) {

    (*sensor)->buffer.data = malloc(sizeof(float) * config->buffer_len);
    if ((*sensor)->buffer.data == NULL) {
        fprintf(stderr, "Error: Failed to allocate memory for circular buffer.\n");
        exit(EXIT_FAILURE);
    }
    (*sensor)->buffer.size = config->buffer_len;
    (*sensor)->buffer.write_index = 0;


    (*sensor)->medianLength.data = malloc(sizeof(float) * config->window_len);
    if ((*sensor)->medianLength.data == NULL) {

        free((*sensor)->buffer.data);

        fprintf(stderr, "Error: Failed to allocate memory for median array.\n");
        exit(EXIT_FAILURE);
    }
    (*sensor)->medianLength.size = config->window_len;
    (*sensor)->medianLength.current_size = 0;
}