#include <sys/stat.h>
#include "c.h"
#include <stdlib.h>
#include <stdio.h>


void freeSensorMemory(SameSensor* sensor) {
    free(sensor->buffer.data);
    sensor->buffer.data = NULL;  // Set to NULL after freeing

    free(sensor->medianLength.data);
    sensor->medianLength.data = NULL;  // Set to NULL after freeing
}