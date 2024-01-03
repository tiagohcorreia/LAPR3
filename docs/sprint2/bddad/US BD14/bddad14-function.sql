--  USBD14 - Como Gestor Agrícola, quero registar uma operação de aplicação de
--  fator de produção

-- Função para verificar se uma aplicação de fator de produção já existe
create or replace function verificarSeAplicacaoFpExiste(id aplicacao_fp.operacao_id%type)
    return number
    is
    returnValue number := 0;
    otherId     aplicacao_fp.operacao_id%type;
    cursor c1 is select operacao_id
                 from aplicacao_fp;
begin
    open c1;
    loop
        fetch c1 into otherId;
        if (id = otherId) then
            returnValue := 1; -- A operação já existe
        end if;
        exit when c1%notfound;
    end loop;
    close c1;
    return returnValue;
end;

-- Procedimento para registrar uma aplicação de fator de produção
CREATE OR REPLACE function registrar_Aplicacao_FP(
    parcelaId number,
    variedadeId number,
    quantidade aplicacao_fp.quantidade%TYPE,
    metodoAplicacaoId number,
    area aplicacao_fp.area%TYPE,
    fatorProducaoId number,
    data date
)
    return number
    IS
    p_operacaoId Operacao_Agricola.id%TYPE;
BEGIN
    -- Verificar se a parcela, fator de produção e área são válidos
    IF (checkIfParcelExists(parcelaId) = 0
        or checkIfFpExists(fatorProducaoId) = 0
        or check_if_area_is_greater_then_parcel(parcelaId, area) = 1) THEN
        return 0; -- Falha nas verificações, abortar
    END IF;

    -- Se a variedade for fornecida, verificar se é válida
    if variedadeId is not null then
        if (checkIfVarietyExists(variedadeId) = 0 or checkIfVarietyIsInParcel(parcelaId, variedadeId) = 0) then
            return 0; -- Variedade inválida, abortar
        end if;
    end if;

    savepoint sp; -- Ponto de salvamento para rollback em caso de falha

    -- Inserir na tabela Operacao_Agricola
    SELECT MAX(id) + 1 INTO p_operacaoId FROM Operacao_Agricola;
    INSERT INTO Operacao_Agricola(id, data) VALUES (p_operacaoId, data);

    -- Inserir na tabela Aplicacao_FP
    INSERT INTO Aplicacao_FP(operacao_id, parcela_id, variedade_id, fator_producao_id, metodo_aplicacao_id, quantidade,
                             area)
    VALUES (p_operacaoId, parcelaId, variedadeId, fatorProducaoId, metodoAplicacaoId, quantidade, area);

    -- Verificar se as inserções foram bem-sucedidas
    if (checkIfOperationIdExists(p_operacaoId) = 1 and verificarSeAplicacaoFpExiste(p_operacaoId) = 1) then
        commit; -- Confirmar transação
        return 1; -- Sucesso
    else
        rollback to sp; -- Reverter para o ponto de salvamento em caso de falha
        return 0; -- Falha
    end if;
END;


-- Caso de sucesso
declare
    parcelaId         number                       := 108;
    variedadeId       number                       := null;
    quantidade        aplicacao_fp.quantidade%TYPE := 4000;
    metodoAplicacaoId number                       := 7;
    area              aplicacao_fp.area%TYPE       := 1.1;
    fatorProducaoId   number                       := 12;
    data              date                         := to_date('2023-10-06', 'yyyy-mm-dd');
    result            number;
begin
    result := registrar_Aplicacao_FP(parcelaId, variedadeId, quantidade, metodoAplicacaoId, area,
                                     fatorProducaoId, data);
    if result = 1 then
        dbms_output.put_line('Aplicação de fator de produção registada com sucesso');
    else
        dbms_output.put_line('Aplicação de fator de produção não registada');
    end if;
end;

select * from Aplicacao_FP;

-- Caso de insucesso
declare
    parcelaId         number                       := 108;
    variedadeId       number                       := null;
    quantidade        aplicacao_fp.quantidade%TYPE := 8000;
    metodoAplicacaoId number                       := 7;
    area              aplicacao_fp.area%TYPE       := 2.1;
    fatorProducaoId   number                       := 12;
    data              date                         := to_date('2023-10-08', 'yyyy-mm-dd');
    result            number;
begin
    result := registrar_Aplicacao_FP(parcelaId, variedadeId, quantidade, metodoAplicacaoId, area,
                                     fatorProducaoId, data);
    if result = 1 then
        dbms_output.put_line('Aplicação de fator de produção registada com sucesso');
    else
        dbms_output.put_line('Aplicação de fator de produção não registada');
    end if;
end;


