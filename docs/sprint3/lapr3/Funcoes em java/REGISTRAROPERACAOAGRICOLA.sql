create PROCEDURE RegistrarOperacaoAgricola(
    p_id Operacao_Agricola.id%TYPE,
    p_data Operacao_Agricola.data%TYPE,
    p_current_date_in Operacao_Agricola.data%TYPE := NULL
)
    IS
    id_operacao_existe EXCEPTION;
    v_current_date Operacao_Agricola.data%TYPE;
BEGIN
    v_current_date := p_current_date_in;

    -- Check if the provided id already exists
    FOR rec IN (SELECT id FROM Operacao_Agricola WHERE id = p_id)
        LOOP
            RAISE id_operacao_existe;
        END LOOP;

    -- Check if the provided data is valid
    IF (p_data > v_current_date) THEN
        RAISE_APPLICATION_ERROR(-20001, 'A data especificada não é válida. Não é permitido registrar operações no futuro.');
    END IF;

    -- Insert into Operacao_Agricola with the provided id
    INSERT INTO Operacao_Agricola(id, data)
    VALUES (p_id, p_data);

EXCEPTION
    WHEN id_operacao_existe THEN
        DBMS_OUTPUT.put_line('Não foi possível registrar a operação. O ID já existe.');
END;
/

