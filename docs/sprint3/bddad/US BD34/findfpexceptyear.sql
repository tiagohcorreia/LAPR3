SET SERVEROUTPUT ON;
DECLARE

    CURSOR c_composto_quimico IS
        SELECT cq.*,
               (SELECT LISTAGG(fp.id, ', ') WITHIN GROUP (ORDER BY fp.id)
                FROM Fator_Producao fp
                         JOIN Ficha_Tecnica ft ON fp.id = ft.fator_producao_id
                         JOIN FP_APLICADOS fpa ON fp.id = fpa.fp_id
                         JOIN Operacao_Agricola oa ON fpa.Operacao_id = oa.id
                WHERE ft.composto_quimico_id = cq.id
                  AND EXTRACT(YEAR FROM oa.data) != 2023) AS fator_producao_ids
        FROM Composto_Quimico cq
        WHERE cq.id IN (SELECT DISTINCT ft.composto_quimico_id
                        FROM Ficha_Tecnica ft
                                 JOIN Fator_Producao fp ON ft.fator_producao_id = fp.id
                        WHERE ft.fator_producao_id IS NOT NULL)
          AND cq.id IN (SELECT DISTINCT ft.composto_quimico_id
                        FROM Ficha_Tecnica ft
                                 JOIN FP_APLICADOS fpa ON ft.fator_producao_id = fpa.fp_id
                                 JOIN Operacao_Agricola oa ON fpa.Operacao_id = oa.id
                        WHERE EXTRACT(YEAR FROM oa.data) != 2023);
    v_id                 Composto_Quimico.id%TYPE;
    v_name               Composto_Quimico.nome%TYPE;
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



create or replace function obter_compostos_quimicos_usados_nao_nesse_ano(v_ano number)
    return sys_refcursor
    is
    c sys_refcursor;
begin
    open c for
        select distinct COMPOSTO_QUIMICO.nome as composto
        from COMPOSTO_QUIMICO
        where COMPOSTO_QUIMICO.ID not in (select distinct COMPOSTO_QUIMICO.ID
                                          from OPERACAO_AGRICOLA,
                                               FP_APLICADOS,
                                               FICHA_TECNICA,
                                               COMPOSTO_QUIMICO
                                          where extract(year from OPERACAO_AGRICOLA.DATA) = v_ano
                                            and OPERACAO_AGRICOLA.ID = FP_APLICADOS.OPERACAO_ID
                                            and FP_APLICADOS.FP_ID = FICHA_TECNICA.FATOR_PRODUCAO_ID
                                            and FICHA_TECNICA.COMPOSTO_QUIMICO_ID = COMPOSTO_QUIMICO.ID)

        order by COMPOSTO_QUIMICO.NOME;
    return c;
end;



create or replace procedure imprimir_compostos_quimicos_usados_nao_nesse_ano(v_ano number)
    is
    v_compostos sys_refcursor := OBTER_COMPOSTOS_QUIMICOS_USADOS_NAO_NESSE_ANO(v_ano);
    v_composto  COMPOSTO_QUIMICO.nome%type;
begin
    DBMS_OUTPUT.PUT_LINE('COMPOSTOS QUÍMICOS: ');
    loop
        fetch v_compostos into v_composto;
        exit when v_compostos%notfound;
        DBMS_OUTPUT.PUT_LINE('- ' || v_composto);
    end loop;
end;
