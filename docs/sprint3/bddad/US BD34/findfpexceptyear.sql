SET SERVEROUTPUT ON
DECLARE

    CURSOR c_composto_quimico IS
        SELECT
            cq.*,
            (
                SELECT LISTAGG(DISTINCT fp.id, ', ') WITHIN GROUP (ORDER BY fp.id)
                FROM Fator_Producao fp
                         JOIN Ficha_Tecnica ft ON fp.id = ft.fator_producao_id
                         JOIN FP_APLICADOS fpa ON fp.id = fpa.fp_id
                         JOIN Operacao_Agricola oa ON fpa.Operacao_id = oa.id
                WHERE ft.composto_quimico_id = cq.id
                  AND EXTRACT(YEAR FROM oa.data) != 2023
            ) AS fator_producao_ids
        FROM
            Composto_Quimico cq
        WHERE
                cq.id IN (
                SELECT DISTINCT ft.composto_quimico_id
                FROM Ficha_Tecnica ft
                         JOIN Fator_Producao fp ON ft.fator_producao_id = fp.id
                WHERE ft.fator_producao_id IS NOT NULL
            )
          AND cq.id IN (
            SELECT DISTINCT ft.composto_quimico_id
            FROM Ficha_Tecnica ft
                     JOIN FP_APLICADOS fpa ON ft.fator_producao_id = fpa.fp_id
                     JOIN Operacao_Agricola oa ON fpa.Operacao_id = oa.id
            WHERE EXTRACT(YEAR FROM oa.data) != 2023
        );


    v_id Composto_Quimico.id%TYPE;
    v_name Composto_Quimico.nome%TYPE;
    v_fator_producao_ids VARCHAR2(4000);

BEGIN

    OPEN c_composto_quimico;


    LOOP
        FETCH c_composto_quimico INTO v_id, v_name, v_fator_producao_ids;


        EXIT WHEN c_composto_quimico%NOTFOUND;


        DBMS_OUTPUT.PUT_LINE('Composto_Quimico ID: ' || v_id);
        DBMS_OUTPUT.PUT_LINE('Composto_Quimico Name: ' || v_name);
        DBMS_OUTPUT.PUT_LINE('Fator_Producao IDs: ' || v_fator_producao_ids);
    END LOOP;


    CLOSE c_composto_quimico;
END;
/
