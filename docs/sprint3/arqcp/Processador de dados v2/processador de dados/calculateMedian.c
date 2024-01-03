#include <stdio.h>
#include <stdlib.h>
#include <intrin.h>
#include <string.h>
#include <stdbool.h>
#include "c.h"

float calculateMedian(SameSensor* sensor,Config* config,int numConfigs,int i) {
    int timesElapsed = 0;
    float median;
    int numValues = config[i].window_len;
    
    int* indices = (int*)malloc(numValues * sizeof(int));
    if (indices == NULL) {
        return 0.0f;
    }

    for (int i = 0; i < numValues; ++i) {
        indices[i] = i;
    }


    for (int j = 0; j < numValues - 1; ++j) {
        for (int k = 0; k < numValues - j - 1; ++k) {
            if (sensor[i].buffer.data[indices[k]] > sensor[i].buffer.data[indices[k + 1]]) {
                int temp = indices[k];
                indices[k] = indices[k + 1];
                indices[k + 1] = temp;
            }
        }
    }

    if (numValues % 2 == 0) {
        median = (sensor[i].buffer.data[indices[numValues / 2 - 1]] +
                  sensor[i].buffer.data[indices[numValues / 2]]) / 2.0f;
    } else {
        median = sensor[i].buffer.data[indices[numValues / 2]];
    }
    timesElapsed++;
    sensor[i].writeCounter = timesElapsed;

    free(indices);

    return median;
}
