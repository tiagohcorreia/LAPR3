create or replace function checkIfHarvestIsRegistered(id colheita.operacao_id%type)
    return number
    is
    otherId colheita.operacao_id%type;
    cursor c1 is select operacao_id
                 from colheita;
begin
    open c1;
    loop
        fetch c1 into otherId;
        if (id = otherId) then
            close c1;
            return 1;
        end if;
        exit when c1%notfound;
    end loop;
    close c1;
    return 0;
end;

create or replace function registar_Colheita(
    p_data Operacao_Agricola.data%TYPE,
    p_parcela_id Parcela.id%TYPE,
    p_produto_id Produto.id%TYPE,
    p_quantidade Colheita.quantidade%TYPE,
    p_metodo_execucao_id Metodo_Execucao.id%TYPE
)
    return number
    IS
    operation_id number;
    variedade_id  variedade.id%TYPE;

BEGIN

    select max(id) into operation_id from Operacao_Agricola;
    operation_id := operation_id + 1;

    -- Check if the provided id already exists
    if (checkIfOperationIdExists(operation_id) = 1) then
        return 0;
    end if;

    if (CHECKIFPARCELEXISTS(p_parcela_id) = 0) then
        return 0;
    end if;

    if check_if_product_exists(p_produto_id)=0 then
        return 0;
    end if;

    select variedade_id
    into variedade_id
    from produto,
         VARIEDADE
    where p_produto_id = produto.id
      and produto.VARIEDADE_ID = VARIEDADE.id;

    if (CHECKIFVARIETYISINPARCEL(p_parcela_id, variedade_id) = 0) then
        return 0;
    end if;


    savepoint s1;
    INSERT INTO Operacao_Agricola(id, data, validade)
    VALUES (operation_id, p_data, 1);
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




-- caso sucesso
-- Registar uma operação de colheita no Campo Grande, em 05/11/2023, de azeitona Galega, 100 kg
declare
    p_data               Operacao_Agricola.data%TYPE := TO_DATE('2023-11-05', 'YYYY-MM-DD');
    p_current_date_in    Operacao_Agricola.data%TYPE := sysdate;
    p_parcela_id         Parcela.id%TYPE             := 102;
    p_produto_id         Produto.id%TYPE             := 13;
    p_quantidade         Colheita.quantidade%TYPE    := 100;
    p_metodo_execucao_id Metodo_Execucao.id%TYPE     := null;
BEGIN
    if (registar_Colheita(p_data, p_current_date_in, p_parcela_id, p_produto_id, p_quantidade, p_metodo_execucao_id) =
        0) then
        DBMS_OUTPUT.put_line('Não foi possível registrar a colheita');
    else
        DBMS_OUTPUT.put_line('Operação de colheita registrada com sucesso.');
    end if;
end ;



-- caso insucesso
-- Registar uma operação de colheita no Campo Grande, em 05/10/2023, de Maçã Golden, 800 kg
declare
    p_data               Operacao_Agricola.data%TYPE := TO_DATE('2023-10-05', 'YYYY-MM-DD');
    p_current_date_in    Operacao_Agricola.data%TYPE := sysdate;
    p_parcela_id         Parcela.id%TYPE             := 102;
    p_produto_id         Produto.id%TYPE             := null;
    p_quantidade         Colheita.quantidade%TYPE    := 800;
    p_metodo_execucao_id Metodo_Execucao.id%TYPE     := null;
BEGIN
    if (registar_Colheita(p_data, p_current_date_in, p_parcela_id, p_produto_id, p_quantidade, p_metodo_execucao_id) =
        0) then
        DBMS_OUTPUT.put_line('Não foi possível registrar a colheita');
    else
        DBMS_OUTPUT.put_line('Operação de colheita registrada com sucesso.');
    end if;
end ;
