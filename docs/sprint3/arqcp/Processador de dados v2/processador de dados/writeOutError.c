#include <stdio.h>
#include <time.h>

void writeSensorDataToFileError(int sensor_id, int write_counter, const char* type, const char* unit, char erro[], const char* output_directory) {
    time_t current_time = time(NULL);
    struct tm* time_info = localtime(&current_time);


    // Build the file name with the specified format
    char file_name[256];  // Adjust the size as needed
    snprintf(file_name, sizeof(file_name), "%04d%02d%02d%02d%02d%02d_sensors.txt",
             time_info->tm_year + 1900, time_info->tm_mon + 1, time_info->tm_mday,
             time_info->tm_hour, time_info->tm_min, time_info->tm_sec);

    // Build the full file path
    char file_path[256];  // Adjust the size as needed
    snprintf(file_path, sizeof(file_path), "%s\\%s", output_directory, file_name);

    FILE* file = fopen(file_path, "a");
    if (file == NULL) {
        perror("Error opening file for writing");
        return;
    }

    fprintf(file, "%d,%d,%s,%s,%s#\n", sensor_id, write_counter, type, unit, erro);

    fclose(file);
}

