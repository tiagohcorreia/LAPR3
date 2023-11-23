create or replace NONEDITIONABLE PROCEDURE RegistrarOperacaoAgricola(
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

CREATE OR REPLACE NONEDITIONABLE PROCEDURE RegistrarColheita(
    p_id Operacao_Agricola.id%TYPE,
    p_parcela_id Parcela.id%TYPE,
    p_produto_id Produto.id%TYPE,
    p_quantidade Colheita.quantidade%TYPE,
    p_metodo_execucao_id Metodo_Execucao.id%TYPE
)
    IS
    parcela_nao_existe EXCEPTION;
    produto_nao_existe EXCEPTION;
BEGIN
    -- Check if parcelaId exists
    FOR rec IN (SELECT id FROM Parcela WHERE id = p_parcela_id)
        LOOP
            NULL;
        END LOOP;

    IF SQL%NOTFOUND THEN
        RAISE parcela_nao_existe;
    END IF;

    -- Check if produtoId exists
    FOR rec IN (SELECT id FROM Produto WHERE id = p_produto_id)
        LOOP
            NULL;
        END LOOP;

    IF SQL%NOTFOUND THEN
        RAISE produto_nao_existe;
    END IF;

    -- Insert into Colheita
    INSERT INTO Colheita(operacao_id, parcela_id, produto_id, metodo_execucao_id, quantidade)
    VALUES (p_id, p_parcela_id, p_produto_id, p_metodo_execucao_id, p_quantidade);

EXCEPTION
    WHEN parcela_nao_existe THEN
        DBMS_OUTPUT.put_line('A parcela especificada não está registrada na base de dados');
    WHEN produto_nao_existe THEN
        DBMS_OUTPUT.put_line('O produto especificado não está registrado na base de dados');
END;
/
