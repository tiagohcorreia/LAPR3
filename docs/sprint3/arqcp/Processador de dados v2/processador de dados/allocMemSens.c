#include <sys/stat.h>
#include "c.h"
#include <stdlib.h>
#include <stdio.h>

void allocMemSens(SameSensor** sensor, int num) {
    *sensor = malloc(sizeof(SameSensor) * num);
    if (*sensor == NULL) {
        perror("Error allocating memory for sameSensors");
        exit(EXIT_FAILURE);
    }
}