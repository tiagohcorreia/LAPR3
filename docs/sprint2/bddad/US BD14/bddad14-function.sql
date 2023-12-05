--  USBD14 - Como Gestor Agrícola, quero registar uma operação de aplicação de
--  fator de produção

create or replace function verificarSeAplicacaoFpExiste(id aplicacao_fp.operacao_id%type)
    return number
    is
    otherId aplicacao_fp.operacao_id%type;
    cursor c1 is select operacao_id
                 from aplicacao_fp;
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

CREATE OR REPLACE function registrarAplicacaoFatorProducao(
    parcelaId number,
    variedadeId number,
    quantidade fator_producao.quantidade%TYPE,
    metodoAplicacaoId number,
    area fator_producao.area%TYPE,
    fatorProducaoId number,
    data date
)
    return number
    IS
    p_operacaoId Operacao_Agricola.id%TYPE;
BEGIN
    -- Verificar se parcela_id existe
    IF (checkIfParcelExists(parcelaId) = 0
        or checkIfVarietyExists(variedadeId) = 0
        or checkIfFpExists(fatorProducaoId) = 0
        or checkIfVarietyIsInParcel(parcelaId, variedadeId)=0) THEN
        return 0;
    END IF;

    savepoint sp;

    -- Inserir na tabela Operacao_Agricola
    SELECT COALESCE(MAX(id), 0) + 1 INTO p_operacaoId FROM Operacao_Agricola;
    INSERT INTO Operacao_Agricola(id, data) VALUES (operacaoId, data);

    -- Inserir na tabela Aplicacao_FP
    INSERT INTO Aplicacao_FP(operacao_id, parcela_id, variedade_id, fator_producao_id, metodo_aplicacao_id, quantidade,
                             area)
    VALUES (p_operacaoId, parcelaId, variedadeId, fatorProducaoId, metodoAplicacaoId, quantidade, area);

    if (checkIfOperationIdExists(id) = 1 and verificarSeAplicacaoFpExiste(id) = 1) then
        return 1;
    else
        rollback to sp;
        return 0;
    end if;
END;

declare
parcelaId number:=104;
variedadeId number:=83;
quantidade fator_producao.quantidade%TYPE:=2.1;
metodoAplicacaoId number:=1;
area fator_producao.area%TYPE:=2;
fatorProducaoId number:=3;
data date:=to_date('2020-12-05', 'yyyy-mm-dd');
    begin
    registrarAplicacaoFatorProducao(parcelaId, variedadeId, quantidade, metodoAplicacaoId, area, fatorProducaoId, data);
end;