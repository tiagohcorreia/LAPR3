#include <stdio.h>
#include "extract_token.h"


int main() {
    char input[] = "token=123";
    char token[] = "token";
    int output;

    extract_token(input, token, &output);

    printf("Valor extraído: %d\n", output);

    return 0;
}
