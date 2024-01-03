#include <stdio.h>
#include <stdlib.h>
#include <intrin.h>
#include <string.h>
#include "c.h"

void insertConfigData(SensorInfo* sensor, const char* configLine) {

    sscanf(configLine, "%d %49[^ ] %19[^ ] %19[^ ] %19s",
           &sensor->sensor_id, sensor->type, sensor->value,
           sensor->unit, sensor->time);

  
    sensor->type[sizeof(sensor->type) - 1] = '\0';
    sensor->value[sizeof(sensor->value) - 1] = '\0';
    sensor->unit[sizeof(sensor->unit) - 1] = '\0';
    sensor->time[sizeof(sensor->time) - 1] = '\0';
}
