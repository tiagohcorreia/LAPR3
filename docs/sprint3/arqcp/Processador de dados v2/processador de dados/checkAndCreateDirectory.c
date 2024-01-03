#include <stdio.h>
#include "c.h"
#include <stdio.h>
#include <stdlib.h>
#include <sys/stat.h>

void checkAndCreateDirectory(const char *directoryPath) {
    struct stat dirStat;
    if (stat(directoryPath, &dirStat) != 0 || !S_ISDIR(dirStat.st_mode)) {
        if (mkdir(directoryPath) != 0) {
            perror("Error creating directory");
            exit(EXIT_FAILURE);
        }
    }
}