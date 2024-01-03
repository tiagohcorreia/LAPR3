#include <sys/stat.h>
#include "c.h"
#include <stdlib.h>
#include <stdio.h>


void allocateMemoryForSensor(SameSensor* sensor, int buffer_len,int mediana_len) {

    sensor->buffer.data = malloc(sizeof(int) * buffer_len);
    sensor->buffer.size = buffer_len;
    sensor->buffer.write_index = 0;


    sensor->medianLength.data = malloc(sizeof(int) * mediana_len);
    sensor->medianLength.size = mediana_len;
    sensor->medianLength.current_size = 0;
}