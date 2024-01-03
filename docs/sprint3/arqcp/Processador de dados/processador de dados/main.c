#include <sys/stat.h>
#include "c.h"
#include <stdlib.h>
#include <stdio.h>

int main(int argc, char* argv[]) {


    char* data_file_path = "C:\\Users\\rafa1\\Desktop\\ARQCP\\dados_sensores\\sensores.txt";//argv[1];
    char* config_file ="C:\\Users\\rafa1\\Desktop\\ARQCP\\config.txt";//argv[2];
    char* output_directory = "out";//argv[3];
    int num_readings = 0;//atoi(argv[4]);
    checkAndCreateDirectory(output_directory);

    Config* configs = NULL;
    int num_configs = 0;
    readConfigFile(config_file, &configs, &num_configs); // le e guarda num struct a config file para uso futuro


    int num_sensors = getNumSensorsFromConfig(data_file_path);  //numero de entradas totais na lista de dados
    SensorInfo* sensors = (SensorInfo*)malloc(num_sensors * sizeof(SensorInfo));
    if (sensors == NULL) {
        perror("Error allocating memory for sensors");
        exit(EXIT_FAILURE);
    }


    FILE* data_file_ptr = fopen(data_file_path, "r");
    if (data_file_ptr == NULL) {
        perror("Error opening file");
        exit(EXIT_FAILURE);
    }


    for (int i = 0; i < num_sensors; ++i) {
        char* data_line = readConfigLine(data_file_ptr);
        if (data_line == NULL) {
            perror("Error reading from configuration file");
            exit(EXIT_FAILURE);
        }

               insertConfigData(&sensors[i], data_line);    //inserts do dados do ficheiro para um struct


        free(data_line);
    }

    //populateSameSensor(); // cria um struct com todos os dados de um sensor (todos os values no buffer)

    free(sensors);

    fclose(data_file_ptr);

    return 0;
}