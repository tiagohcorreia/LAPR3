#include <sys/stat.h>
#include "c.h"
#include <stdlib.h>
#include <stdio.h>


void allocateMemoryForSensor(SameSensor* sensor, Config* config,int i,int configIndex) {

    sensor[i].buffer.data = malloc(sizeof(float) * config[configIndex].buffer_len);
    sensor[i].medianLength.data = malloc(sizeof(int) * config[configIndex].window_len);
}