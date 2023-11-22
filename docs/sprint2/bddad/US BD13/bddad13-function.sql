create or replace NONEDITIONABLE PROCEDURE registrarColheita(
    p_id Operacao_Agricola.id%TYPE,
    parcelaId Parcela.id%TYPE,
    produtoId Produto.id%TYPE,
    data Operacao_Agricola.data%TYPE,
    quantidade Colheita.quantidade%TYPE,
    metodoExecucaoId Metodo_Execucao.id%TYPE,
    current_date_in Operacao_Agricola.data%TYPE := NULL
)
    IS
    id_operacao_existe EXCEPTION;
    parcela_nao_existe EXCEPTION;
    produto_nao_existe EXCEPTION;
    data_invalida EXCEPTION;
    v_current_date Operacao_Agricola.data%TYPE;
BEGIN

    v_current_date := current_date_in;


    -- Check if the provided id already exists
    FOR rec IN (SELECT id FROM Operacao_Agricola WHERE id = p_id)
        LOOP
            RAISE id_operacao_existe;
        END LOOP;

    -- Check if parcelaId exists
    FOR rec IN (SELECT id FROM Parcela WHERE id = parcelaId)
        LOOP
            NULL;
        END LOOP;

    IF SQL%NOTFOUND THEN
        RAISE parcela_nao_existe;
    END IF;

    -- Check if produtoId exists
    FOR rec IN (SELECT id FROM Produto WHERE id = produtoId)
        LOOP
            NULL;
        END LOOP;

    IF SQL%NOTFOUND THEN
        RAISE produto_nao_existe;
    END IF;


    IF (data > v_current_date) THEN
        RAISE data_invalida;
    END IF;

    -- Insert into Operacao_Agricola with the provided id
    INSERT INTO Operacao_Agricola(id, data)
    VALUES (p_id, data);

    -- Insert into Colheita
    INSERT INTO Colheita(operacao_id, parcela_id, produto_id, metodo_execucao_id, quantidade)
    VALUES (p_id, parcelaId, produtoId, metodoExecucaoId, quantidade);

EXCEPTION
    WHEN id_operacao_existe THEN
        DBMS_OUTPUT.put_line('Nao foi possível registrar a operacao. O ID ja existe.');
    WHEN parcela_nao_existe THEN
        DBMS_OUTPUT.put_line('A parcela especificada nao esta registada na base de dados');
    WHEN produto_nao_existe THEN
        DBMS_OUTPUT.put_line('O produto especificado nao esta registado na base de dados');
    WHEN data_invalida THEN
        DBMS_OUTPUT.put_line('A data especificada nao e válida. Nao e permitido registrar operacoes no futuro.');
END;