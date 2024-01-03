#include <stdio.h>
#include <stdlib.h>
#include <intrin.h>
#include <string.h>
#include "c.h"

void populateSameSensor(SameSensor* sensor, Config* configs, int numConfigs, SensorInfo* sensorInfos, int numSensorInfos, int sensorId) {
    int configIndex = -1;
    for (int i = 0; i < numConfigs; ++i) {
        if (configs[i].sensor_id == sensorId + 1) {
            configIndex = i;
            break;
        }
    }
    int aux = 0;
    int timeout = configs[configIndex].timeout;
    sensor[sensorId].sensor_id = sensorId + 1;
    strcpy(sensor[sensorId].type,configs[configIndex].type);
    sensor[sensorId].timeout = configs[configIndex].timeout;
    sensor[sensorId].buffer.data = malloc(sizeof(float) * configs[configIndex].buffer_len);
    if (sensor[sensorId].buffer.data == NULL) {
        fprintf(stderr, "Memory allocation failed\n");
        exit(EXIT_FAILURE);
    }

    int lastTimestamp = 0;
    for (int i = 0; i < numSensorInfos; ++i) {
        if (sensorInfos[i].sensor_id == sensorId + 1) {
            float value = atof(sensorInfos[i].value);
            sensor[sensorId].buffer.data[aux] = value;
            aux++;
            if(aux>1){
                if(sensorInfos[i].time - lastTimestamp > timeout){
                    sensor[sensorId].timeout = -1;

                }
            }
            lastTimestamp = sensorInfos[i].time;


        }

        if (aux >= configs[configIndex].buffer_len) {
            break;
        }
    }

   sensor[sensorId].lastTimestamp = lastTimestamp;
    for (int i = aux; i < configs[configIndex].buffer_len; ++i) {
        sensor[sensorId].buffer.data[i] = 0.0f;
    }
}