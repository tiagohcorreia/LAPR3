/*
 ** USBD33 Como Gestor Agrícola, pretendo obter a lista das culturas com maior consumo de água (rega) para um dado ano civil. O consumo é em minutos e, em caso de empate, devem ser dadas todas essas culturas.

Ano civil 2023, culturas com 2130 min de rega:
Macieira Jonagored
Macieira Fuji
Macieira Royal Gala
Macieira Royal Gala
Macieira Pipo de Basto
Macieira Porta da Loja
Macieira Malápio
Macieira Canada
Macieira Grand Fay
Macieira Gronho Doce
 */

DECLARE
    ano  NUMBER := 2023;
BEGIN
    imprimirCulturasComMaiorConsumoAgua(ano);
END;
