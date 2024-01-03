#ifndef ARQCP_C_H
#define ARQCP_C_H
#include <stdio.h>
typedef struct {
    int* data;
    int size;
    int write_index;
}CircularBuffer;

typedef struct {
    int* data;
    int size;
    int current_size;
}MedianArray;

typedef struct {
    int sensor_id;
    char type[50];
    char value[20];
    char unit[20];
    char time[20];
} SensorInfo;

typedef struct {
    int sensor_id;
    char type[50];
    char unit[20];
    char buffer_len[20];
    char window_len[20];
    const char *timeout;
} Config;

typedef struct {
    int sensor_id;
    char type[50];
    CircularBuffer buffer;
    MedianArray medianLength;
    char lastTimestamp [20];
    char timeout[25];
    char writeCounter[20];
} SameSensor;


void insertConfigData(SensorInfo* sensor, const char* configLine);
int getNumSensorsFromConfig(const char *configFilePath);
void checkAndCreateDirectory(const char *directoryPath);
char* readConfigLine(FILE* file);
void readConfigFile(const char* filename, Config** configs, int* num_configs);
void allocateMemoryForSensor(SameSensor* sensor, int buffer_len,int mediana_len);
void populateSameSensor(SameSensor* sameSensors, int* numSameSensors, Config* configs, int numConfigs, SensorInfo* sensorInfos, int numSensorInfos,int sensorId);
#endif
