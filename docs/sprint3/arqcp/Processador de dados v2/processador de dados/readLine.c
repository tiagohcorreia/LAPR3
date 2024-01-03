#include <stdio.h>
#include <stdlib.h>
#include <intrin.h>
#include <string.h>
#include "c.h"

char* extractSubstring(const char* line, char start_char, char end_char) {
    char* start = strchr(line, start_char);
    char* end = strchr(line, end_char);


    if (start != NULL && end != NULL && start < end) {
        size_t substring_length = end - start - 1;

        char* substring = (char*)malloc((substring_length + 1) * sizeof(char));
        strncpy(substring, start + 1, substring_length);
        substring[substring_length] = '\0';

        return substring;
    }

    return NULL;
}

char* readConfigLine(FILE* file) {
    char line[256];
    while (fgets(line, sizeof(line), file) != NULL) {
        size_t len = strlen(line);
        if (line[len - 1] == '\n') {
            line[len - 1] = '\0';
        }


        if (line[0] == '\0') {
            continue;
        }


        char* sensor_id = extractSubstring(line, ':', '#');
        char* type = extractSubstring(strstr(line, "type:"), ':', '#');
        char* value = extractSubstring(strstr(line, "value:"), ':', '#');
        char* unit = extractSubstring(strstr(line, "unit:"), ':', '#');
        char* time = extractSubstring(strstr(line, "time:"), ':', '\0');


        size_t result_len = strlen(sensor_id) + strlen(type) + strlen(value) + strlen(unit) + strlen(time) + 5;
        char* result = (char*)malloc(result_len * sizeof(char));
        snprintf(result, result_len, "%s %s %s %s %s", sensor_id, type, value, unit, time);


        free(sensor_id);
        free(type);
        free(value);
        free(unit);
        free(time);

        return result;
    }


    return NULL;
}
