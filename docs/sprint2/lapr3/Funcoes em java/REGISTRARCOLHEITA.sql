create function registrarColheita(
    p_data Operacao_Agricola.data%TYPE,
    p_current_date_in Operacao_Agricola.data%TYPE := NULL,
    p_parcela_id Parcela.id%TYPE,
    p_produto_id Produto.id%TYPE,
    p_quantidade Colheita.quantidade%TYPE,
    p_metodo_execucao_id Metodo_Execucao.id%TYPE
)
    return number
    IS
    operation_id number;
    variedadeId  variedade.id%TYPE;

BEGIN
    -- Check if the provided data is valid
    if (p_data > p_current_date_in) then
        return 0;
    end if;

    select max(id) into operation_id from Operacao_Agricola;
    operation_id := operation_id + 1;

    -- Check if the provided id already exists
    if (checkIfOperationIdExists(operation_id) = 1) then
        return 0;
    end if;

    if (CHECKIFPARCELEXISTS(p_parcela_id) = 0) then
        return 0;
    end if;

    select variedade_id
    into variedadeId
    from produto,
         VARIEDADE
    where p_produto_id = produto.id
      and produto.VARIEDADE_ID = VARIEDADE.id;

    if (CHECKIFVARIETYISINPARCEL(p_parcela_id, variedadeId) = 0) then
        return 0;
    end if;

    savepoint s1;
    INSERT INTO Operacao_Agricola(id, data)
    VALUES (operation_id, p_data);
-- Insert into Colheita
    INSERT INTO Colheita(operacao_id, parcela_id, produto_id, metodo_execucao_id, quantidade)
    VALUES (operation_id, p_parcela_id, p_produto_id, p_metodo_execucao_id, p_quantidade);

    if (CHECKIFOPERATIONIDEXISTS(operation_id) = 0 or checkIfHarvestIsRegistered(operation_id) = 0) then
        rollback to s1;
        return 0;
    end if;

    commit;
    return 1;
end;
/

