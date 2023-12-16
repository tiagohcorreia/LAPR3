create PROCEDURE RegistarRega(
    p_id Operacao_Agricola.id%TYPE,
    p_setor_id Setor_Rega.id%TYPE,
    p_duracao Rega.duracao%TYPE,
    p_hora Rega.hora%TYPE
)
    IS
    setor_nao_existe EXCEPTION;
BEGIN
    -- Check if parcelaId exists
    FOR rec IN (SELECT id FROM Setor_Rega WHERE id = p_setor_id)
        LOOP
            NULL;
        END LOOP;

    IF SQL%NOTFOUND THEN
        RAISE setor_nao_existe;
    END IF;

    -- Insert into Rega
    INSERT INTO Rega(operacao_id, setor_id, duracao, hora)
    VALUES (p_id, p_setor_id, p_duracao, p_hora);

EXCEPTION
    WHEN setor_nao_existe THEN
        DBMS_OUTPUT.put_line('O setor especificada não está registrada na base de dados');
END;
/

