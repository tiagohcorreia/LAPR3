cmake_minimum_required(VERSION 3.27)
project(ARQCP C)

set(CMAKE_C_STANDARD 11)

add_executable(ARQCP
        "Processador de Dados/main.c"
        "Processador de Dados/freeMem.c"
        "Processador de Dados/allocateMem.c"
        "Processador de Dados/checkAndCreateDirectory.c"
        "Processador de Dados/c.h"
        "Processador de Dados/readLine.c"
        "Processador de Dados/insertConfigData.c"
        "Processador de Dados/getNumSensorsFromConfig.c"
        "Processador de Dados/readConfig.c"
        "Processador de Dados/populateSameSensor.c"
)
