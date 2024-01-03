cmake_minimum_required(VERSION 3.27)
project(ARQCP C)

set(CMAKE_C_STANDARD 11)

add_executable(ARQCP
        "Processador de Dados/main.c"
        "Processador de Dados/allocateMem.c"
        "Processador de Dados/checkAndCreateDirectory.c"
        "Processador de Dados/c.h"
        "Processador de Dados/readLine.c"
        "Processador de Dados/insertConfigData.c"
        "Processador de Dados/getNumSensorsFromConfig.c"
        "Processador de Dados/readConfig.c"
        "Processador de Dados/populateSameSensor.c"
        "processador de dados/allocMemSens.c"
        "processador de dados/calculateMedian.c"
        "processador de dados/compareFloat.c"
        "processador de dados/freeSens.c"
        "processador de dados/writeOut.c"
        "processador de dados/writeOutError.c"
)
