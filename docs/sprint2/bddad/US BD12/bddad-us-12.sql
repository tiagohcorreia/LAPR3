CREATE OR REPLACE PROCEDURE registrarMonda(
    parcelaId Parcela.id%TYPE NOT NULL,
    variedadeId Variedade.id%TYPE NOT NULL,
    quantidade Monda.quantidade%TYPE NOT NULL,
    metodoExecucaoId Metodo_Execucao.id%TYPE,
    fatorProducaoId Fator_Producao.id%TYPE,
    data Operacao_Agricola.data%TYPE
)
IS
    id Operacao_Agricola.id%TYPE := (SELECT MAX(id) FROM Operacao_Agricola);
    id_operacao_existe EXCEPTION;
    parcela_nao_existe EXCEPTION;
    variedade_nao_existe EXCEPTION;
    fator_producao_nao_existe EXCEPTION;
BEGIN
    id := id + 1;

    IF (id IN Operacao_Agricola.id) THEN
        RAISE id_operacao_existe;
    ELSIF (parcelaId NOT IN Parcela.id) THEN
        RAISE parcela_nao_existe;
    ELSIF (variedadeId NOT IN Variedade.id) THEN
        RAISE variedade_nao_existe;
    ELSIF (fatorProducaoId NOT IN Fator_Producao.id) THEN
        RAISE fator_producao_nao_existe;
        ELS
END IF;

INSERT INTO Operacao_Agricola(id, data)
VALUES (id, data);

INSERT INTO Monda(operacao_id, parcela_id, variedade_id, quantidade, metodo_execucao_id, fator_producao_id)
VALUES (id, parcelaId, variedadeId, quantidade, metodoExecucaoId, fatorProducaoId);

EXCEPTION
    WHEN id_operacao_existe
        THEN DBMS_OUTPUT.put_line('Esta operação colide com uma que já existe.');
WHEN parcela_nao_existe
        THEN DBMS_OUTPUT.put_line('A parcela especificada não está registrada na base de dados');
WHEN variedade_nao_existe
        THEN DBMS_OUTPUT.put_line('A variedade especificada não está registrada na base de dados');
WHEN fator_producao_nao_existe
        THEN DBMS_OUTPUT.put_line('O fator de produção especificado não está registrada na base de dados');
END;

    --retornaar valor para designar sucesso ou insucesso