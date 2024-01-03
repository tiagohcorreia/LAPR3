SELECT C.nome_comum AS Cultura, SUM(R.duracao) AS Consumo_Agua_Minutos
FROM Rega R
         JOIN Operacao_Agricola OA ON R.operacao_id = OA.id
         JOIN Setor_Rega SR ON R.setor_id = SR.id
         JOIN SetorRega_Plantacao SRP ON R.setor_id = SRP.setor_id
         JOIN Plantacao PL
         JOIN Plantacao_Permanente PLP ON PL.id = PLP.plantacao_id
         LEFT JOIN Plantacao_Temporaria PLT ON PL.id = PLT.plantacao_id
                   ON SRP.plantacao_id = PL.id
         JOIN Parcela P ON PL.parcela_id = P.id
         JOIN Variedade V ON (PLP.variedade_perm_id = V.id OR PLT.variedade_temp_id = V.id)
         JOIN Cultura C ON V.cultura_id = C.id
WHERE EXTRACT(YEAR FROM OA.data) = 2015
  AND V.id IN (
    SELECT DISTINCT VARIEDADE.id
    FROM VARIEDADE
             JOIN VARIEDADE_PERMANENTE ON VARIEDADE.id = VARIEDADE_PERMANENTE.variedade_id
             JOIN PLANTACAO_PERMANENTE ON VARIEDADE_PERMANENTE.variedade_id = PLANTACAO_PERMANENTE.variedade_perm_id
             JOIN PLANTACAO ON PLANTACAO_PERMANENTE.plantacao_id = PLANTACAO.id
    WHERE PLANTACAO.id = PLANTACAO_PERMANENTE.plantacao_id

    UNION

    SELECT DISTINCT VARIEDADE.id
    FROM VARIEDADE
             JOIN VARIEDADE_TEMPORARIA ON VARIEDADE.id = VARIEDADE_TEMPORARIA.variedade_id
             JOIN PLANTACAO_TEMPORARIA ON VARIEDADE_TEMPORARIA.variedade_id = PLANTACAO_TEMPORARIA.variedade_temp_id
             JOIN PLANTACAO ON PLANTACAO_TEMPORARIA.plantacao_id = PLANTACAO.id
    WHERE PLANTACAO.id = PLANTACAO_TEMPORARIA.plantacao_id
)
GROUP BY C.nome_comum
ORDER BY Consumo_Agua_Minutos DESC;



SELECT C.nome_comum AS Cultura, SUM(R.duracao) AS Consumo_Agua_Minutos
FROM Rega R
         JOIN Operacao_Agricola OA ON R.operacao_id = OA.id
         JOIN Setor_Rega SR ON R.setor_id = SR.id
         JOIN SetorRega_Plantacao SRP ON R.setor_id = SRP.setor_id
         JOIN Plantacao PL
         JOIN Plantacao_Permanente PLP ON PL.id = PLP.plantacao_id
         LEFT JOIN Plantacao_Temporaria PLT ON PL.id = PLT.plantacao_id
                   ON SRP.plantacao_id = PL.id
         JOIN Parcela P ON PL.parcela_id = P.id
         JOIN Variedade V ON (PLP.variedade_perm_id = V.id OR PLT.variedade_temp_id = V.id)
         JOIN Cultura C ON V.cultura_id = C.id
WHERE EXTRACT(YEAR FROM OA.data) = 2019
  AND V.id IN (
    SELECT DISTINCT VARIEDADE.id
    FROM VARIEDADE
             JOIN VARIEDADE_PERMANENTE ON VARIEDADE.id = VARIEDADE_PERMANENTE.variedade_id
             JOIN PLANTACAO_PERMANENTE ON VARIEDADE_PERMANENTE.variedade_id = PLANTACAO_PERMANENTE.variedade_perm_id
             JOIN PLANTACAO ON PLANTACAO_PERMANENTE.plantacao_id = PLANTACAO.id
    WHERE PLANTACAO.id = PLANTACAO_PERMANENTE.plantacao_id

    UNION

    SELECT DISTINCT VARIEDADE.id
    FROM VARIEDADE
             JOIN VARIEDADE_TEMPORARIA ON VARIEDADE.id = VARIEDADE_TEMPORARIA.variedade_id
             JOIN PLANTACAO_TEMPORARIA ON VARIEDADE_TEMPORARIA.variedade_id = PLANTACAO_TEMPORARIA.variedade_temp_id
             JOIN PLANTACAO ON PLANTACAO_TEMPORARIA.plantacao_id = PLANTACAO.id
    WHERE PLANTACAO.id = PLANTACAO_TEMPORARIA.plantacao_id
)
GROUP BY C.nome_comum
ORDER BY Consumo_Agua_Minutos DESC;

CREATE OR REPLACE FUNCTION obterCulturasComMaiorConsumoAgua(ano NUMBER)

    return sys_refcursor
    is
    c sys_refcursor;
begin
    open c for

        SELECT C.nome_comum AS Cultura, SUM(R.duracao) AS Consumo_Agua_Minutos
        FROM Rega R
                 JOIN Operacao_Agricola OA ON R.operacao_id = OA.id
                 JOIN Setor_Rega SR ON R.setor_id = SR.id
                 JOIN SetorRega_Plantacao SRP ON R.setor_id = SRP.setor_id
                 JOIN Plantacao PL
                 JOIN Plantacao_Permanente PLP ON PL.id = PLP.plantacao_id
                 LEFT JOIN Plantacao_Temporaria PLT ON PL.id = PLT.plantacao_id
                           ON SRP.plantacao_id = PL.id
                 JOIN Parcela P ON PL.parcela_id = P.id
                 JOIN Variedade V ON (PLP.variedade_perm_id = V.id OR PLT.variedade_temp_id = V.id)
                 JOIN Cultura C ON V.cultura_id = C.id
        WHERE EXTRACT(YEAR FROM OA.data) = ano
          AND V.id IN (
            SELECT DISTINCT VARIEDADE.id
            FROM VARIEDADE
                     JOIN VARIEDADE_PERMANENTE ON VARIEDADE.id = VARIEDADE_PERMANENTE.variedade_id
                     JOIN PLANTACAO_PERMANENTE ON VARIEDADE_PERMANENTE.variedade_id = PLANTACAO_PERMANENTE.variedade_perm_id
                     JOIN PLANTACAO ON PLANTACAO_PERMANENTE.plantacao_id = PLANTACAO.id
            WHERE PLANTACAO.id = PLANTACAO_PERMANENTE.plantacao_id

            UNION

            SELECT DISTINCT VARIEDADE.id
            FROM VARIEDADE
                     JOIN VARIEDADE_TEMPORARIA ON VARIEDADE.id = VARIEDADE_TEMPORARIA.variedade_id
                     JOIN PLANTACAO_TEMPORARIA ON VARIEDADE_TEMPORARIA.variedade_id = PLANTACAO_TEMPORARIA.variedade_temp_id
                     JOIN PLANTACAO ON PLANTACAO_TEMPORARIA.plantacao_id = PLANTACAO.id
            WHERE PLANTACAO.id = PLANTACAO_TEMPORARIA.plantacao_id
        )
        GROUP BY C.nome_comum
        ORDER BY Consumo_Agua_Minutos DESC;
    return c;
end;

CREATE OR REPLACE PROCEDURE imprimirCulturasComMaiorConsumoAgua(ano NUMBER)
    IS
    c SYS_REFCURSOR := obterCulturasComMaiorConsumoAgua(ano);
    nomeCultura   CULTURA.nome_comum%TYPE;
    consumoAgua    NUMBER;
BEGIN
    LOOP
        FETCH c INTO nomeCultura, consumoAgua;
        EXIT WHEN c%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('CULTURA = ' || nomeCultura);
        DBMS_OUTPUT.PUT_LINE('CONSUMO DE ÁGUA (Minutos) = ' || consumoAgua);
        DBMS_OUTPUT.PUT_LINE('------------------------------------------');
    END LOOP;
    CLOSE c;
END;

DECLARE
    ano  NUMBER := 2019;
BEGIN
    imprimirCulturasComMaiorConsumoAgua(ano);
END;
/
