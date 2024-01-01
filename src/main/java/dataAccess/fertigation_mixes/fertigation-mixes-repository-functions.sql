create or replace function get_fertigation_mixes
    return sys_refcursor
    is
    c sys_refcursor;
begin
    open c for
        select * from RECEITA_FERTIRREGA;
    return c;
end;

create or replace function is_there_mix(mix_name RECEITA_FERTIRREGA.nome%type)
    return number
    is
    mixes              sys_refcursor := get_fertigation_mixes();
    ID                   SETOR_REGA.id%type;
    name                 setor_rega.nome%type;
begin
    loop
        fetch mixes into id, name;
        if lower(mix_name) = lower(name) then
            return 1;
        end if;
        exit when mixes%notfound;
    end loop;
    return 0;
end;

declare
    output number;
begin
    output:=is_there_mix('mix1');
    if output=1 then
        dbms_output.PUT_LINE('mix existe, retorno: '|| output);
    else
        dbms_output.PUT_LINE('mix não existe, retorno: '|| output);
    end if;
end;

create FUNCTION REGISTRAR_APLICACAO_FP_VARIEDADE(
    P_OPERACAO_ID IN OPERACAO_AGRICOLA.ID%TYPE,
    P_METODO_APLICACAO_ID IN METODO_APLICACAO.ID%TYPE
)
    RETURN NUMBER
    IS

BEGIN


    INSERT INTO APLICACAO_FP_VARIEDADE (OPERACAO_ID, METODO_APLICACAO_ID)
    VALUES (P_OPERACAO_ID, P_METODO_APLICACAO_ID);

    COMMIT;

    RETURN 1;
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        RETURN 0;
END REGISTRAR_APLICACAO_FP_VARIEDADE;

create FUNCTION registrarFpAplicados(
    p_operacao_id Operacao_Agricola.id%TYPE,
    p_fp_id FATOR_PRODUCAO.id%TYPE
)
    RETURN NUMBER
    IS
    fp_aplicado_id NUMBER;

    operacao_nao_existe EXCEPTION;
    fp_nao_existe EXCEPTION;
BEGIN
    FOR rec IN (SELECT id FROM Operacao_Agricola WHERE id = p_operacao_id)
        LOOP
            NULL;
        END LOOP;

    IF SQL%NOTFOUND THEN
        RAISE operacao_nao_existe;
    END IF;

    FOR rec IN (SELECT id FROM FATOR_PRODUCAO WHERE id = p_fp_id)
        LOOP
            NULL;
        END LOOP;

    IF SQL%NOTFOUND THEN
        RAISE fp_nao_existe;
    END IF;

    INSERT INTO FP_APLICADOS(Operacao_id, fp_id)
    VALUES (p_operacao_id, p_fp_id)
    RETURNING fp_id INTO fp_aplicado_id;

    IF fp_aplicado_id IS NOT NULL THEN
        COMMIT;
        RETURN 1;
    ELSE
        ROLLBACK;
        RETURN 0;
    END IF;
EXCEPTION
    WHEN operacao_nao_existe THEN
        RETURN 0;
    WHEN fp_nao_existe THEN
        RETURN 0;
END;
/

create FUNCTION registrarPVAplicadas(
    p_operacao_id Operacao_Agricola.id%TYPE,
    p_parcela_id Parcela.id%TYPE,
    p_variedade_id Variedade.id%TYPE
)
    RETURN NUMBER
    IS
    pv_aplicada_id NUMBER;

    operacao_nao_existe EXCEPTION;
    parcela_nao_existe EXCEPTION;
    variedade_nao_existe EXCEPTION;
BEGIN
    FOR rec IN (SELECT id FROM Operacao_Agricola WHERE id = p_operacao_id)
        LOOP
            NULL;
        END LOOP;

    IF SQL%NOTFOUND THEN
        RAISE operacao_nao_existe;
    END IF;

    FOR rec IN (SELECT id FROM Parcela WHERE id = p_parcela_id)
        LOOP
            NULL;
        END LOOP;

    IF SQL%NOTFOUND THEN
        RAISE parcela_nao_existe;
    END IF;

    FOR rec IN (SELECT id FROM Variedade WHERE id = p_variedade_id)
        LOOP
            NULL;
        END LOOP;

    IF SQL%NOTFOUND THEN
        RAISE variedade_nao_existe;
    END IF;

    INSERT INTO Parcelas_Variedades_Aplicadas(operacao_id, parcela_id, variedade_id)
    VALUES (p_operacao_id, p_parcela_id, p_variedade_id)
    RETURNING operacao_id INTO pv_aplicada_id;

    IF pv_aplicada_id IS NOT NULL THEN
        COMMIT;
        RETURN 1;
    ELSE
        ROLLBACK;
        RETURN 0;
    END IF;
EXCEPTION
    WHEN operacao_nao_existe THEN
        RETURN 0;
    WHEN parcela_nao_existe THEN
        RETURN 0;
    WHEN variedade_nao_existe THEN
        RETURN 0;
END;
/




