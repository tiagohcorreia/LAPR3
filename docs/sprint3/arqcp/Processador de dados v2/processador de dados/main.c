#include <sys/stat.h>
#include "c.h"
#include <stdlib.h>
#include <stdio.h>


int main(int argc, char* argv[]) {


    char *data_file_path = argv[1]; //"C:\\Users\\rafa1\\Desktop\\ARQCP\\dados_sensores\\sensores.txt";
    char *config_file = argv[2]; // "C:\\Users\\rafa1\\Desktop\\ARQCP\\config.txt";//
    char *output_directory = argv[3]; //"C:\\Users\\rafa1\\Desktop\\ARQCP\\out";
     int num_readings = atoi(argv[4]);
    checkAndCreateDirectory(output_directory);

    Config *configs = NULL;
    int num_configs = 10;
    num_configs = readConfigFile(config_file, &configs); // le e guarda num struct a config file para uso futuro

    //int num_readings = getNumSensorsFromConfig(data_file_path);  //numero de entradas totais na lista de dados
    SensorInfo *sensors = (SensorInfo *) malloc(num_readings * sizeof(SensorInfo));
    if (sensors == NULL) {
        perror("Error allocating memory for sensors");
        exit(EXIT_FAILURE);
    }


    FILE *data_file_ptr = fopen(data_file_path, "r");
    if (data_file_ptr == NULL) {
        perror("Error opening file");
        exit(EXIT_FAILURE);
    }


    for (int i = 0; i < num_readings; ++i) {
        char *data_line = readConfigLine(data_file_ptr);
        if (data_line == NULL) {
            perror("Error reading from configuration file");
            exit(EXIT_FAILURE);
        }

        insertConfigData(&sensors[i], data_line);    //inserts do dados do ficheiro para um struct


        free(data_line);
    }

    SameSensor *sameSensors = malloc(sizeof(SameSensor) * num_configs);
    float median[num_configs];

    if (sameSensors == NULL) {

        fprintf(stderr, "Memory allocation failed\n");
        exit(EXIT_FAILURE);
    }

    for (int i = 0; i < num_configs; i++) {
        populateSameSensor(sameSensors, configs, num_configs, sensors, num_readings, i);
        if(sameSensors[i].timeout == -1){
            char erro[20]= "error";
            writeSensorDataToFileError(i+1,sameSensors[i].writeCounter,sameSensors[i].type,configs[i].unit,erro,output_directory);
        }else{
        median[i] = calculateMedian(sameSensors, configs, num_configs, i);
        writeSensorDataToFile(i+1,sameSensors[i].writeCounter,sameSensors[i].type,configs[i].unit,(int)median[i],output_directory);
        }
    }
        free(sensors);

        free(sameSensors);

        fclose(data_file_ptr);


        return 0;
    }
