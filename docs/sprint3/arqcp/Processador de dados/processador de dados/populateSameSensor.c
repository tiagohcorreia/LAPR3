#include <stdio.h>
#include <stdlib.h>
#include <intrin.h>
#include <string.h>
#include "c.h"



void populateSameSensor(SameSensor* sameSensors, int* numSameSensors, Config* configs, int numConfigs, SensorInfo* sensorInfos, int numSensorInfos,int sensorId) {
    *numSameSensors = 0;
    sameSensors->sensor_id =sensorId;
    int configIndex = -1;
    for (int i = 0; i < numConfigs; ++i) {
        if (configs[i].sensor_id == sameSensors->sensor_id) {
            configIndex = i;
            break;
        }
    }

    if (configIndex == -1) {
        fprintf(stderr, "Config not found for sensor_id: %d\n", sameSensors->sensor_id);
        exit(EXIT_FAILURE);
    }


    int bufferSize = atoi(configs[configIndex].buffer_len);
    int medianaSize = atoi(configs[configIndex].window_len);


            allocateMemoryForSensor(&sameSensors[sensorId], bufferSize,medianaSize);


            sameSensors[sensorId].lastTimestamp[0] = '\0';
            sameSensors[sensorId].writeCounter[0] = '\0';


        for (int i = 0; i < numSensorInfos; ++i) {
            if (sensorInfos[i].sensor_id == sameSensors->sensor_id) {

                int value = atoi(sensorInfos[i].value);
                CircularBuffer[sensorId].data = CircularBuffer[sensorId].data + value;  // ????
            }
        }

    }
