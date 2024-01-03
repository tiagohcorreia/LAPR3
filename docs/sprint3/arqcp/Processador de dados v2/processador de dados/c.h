#ifndef ARQCP_C_H
#define ARQCP_C_H
#include <stdio.h>
#include <stdbool.h>

typedef struct {
    float* data;
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
    int time;
} SensorInfo;

typedef struct {
    int sensor_id;
    char type[50];
    char unit[20];
    int buffer_len;
    int window_len;
    int timeout;
} Config;

typedef struct {
    int sensor_id;
    char type[50];
    CircularBuffer buffer;
    MedianArray medianLength;
    int lastTimestamp;
    int timeout;
    int writeCounter;
} SameSensor;


void insertConfigData(SensorInfo* sensor, const char* configLine);
int getNumSensorsFromConfig(const char *configFilePath);
void checkAndCreateDirectory(const char *directoryPath);
char* readConfigLine(FILE* file);
int readConfigFile(const char* filename, Config** configs);
void allocateMemoryForSensor(SameSensor* sensor, Config* config,int i,int configIndex);
void populateSameSensor(SameSensor* sensor, Config* configs, int numConfigs, SensorInfo* sensorInfos, int numSensorInfos, int sensorId);
void allocMemSens(SameSensor** sensor, int num);
float calculateMedian(SameSensor* sensor,Config* config,int numConfigs,int i);
int compareFloat(const void* a, const void* b);
void freeSensorMemory(SameSensor* sensor);
void initializeSameSensor(SameSensor** sensor);
void writeSensorDataToFileError(int sensor_id, int write_counter, const char* type, const char* unit, char erro[], const char* output_directory);
void writeSensorDataToFile(int sensor_id, int write_counter, const char* type, const char* unit, int mediana, const char* output_directory);
#endif
