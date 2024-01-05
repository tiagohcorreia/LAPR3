-- Criação da tabela Log_Operacao
/*CREATE TABLE Log_Operacao
(
    log_id         NUMBER(10) PRIMARY KEY,
    operacao_id    NUMBER(10)    NOT NULL,
    instante       TIMESTAMP(0)  NOT NULL,
    tipo_operacao  VARCHAR2(255) NOT NULL,
    dados_operacao CLOB,
    FOREIGN KEY (operacao_id) REFERENCES Operacao_Agricola (id)
);*/

-- Criação da sequência para log_id
CREATE SEQUENCE log_seq;

-- Criação do Trigger
CREATE OR REPLACE TRIGGER trig_log_operacao
    AFTER INSERT OR UPDATE
    ON Operacao_Agricola
    FOR EACH ROW
BEGIN
    IF INSERTING THEN
        INSERT INTO Log_Operacao (log_id, operacao_id, instante, tipo_operacao, dados_operacao)
        VALUES (log_seq.NEXTVAL, :NEW.id, CURRENT_TIMESTAMP, 'Criação',
                'Data: ' || TO_CHAR(:NEW.data, 'YYYY-MM-DD') || ', Validade: ' || :NEW.validade);
    ELSIF UPDATING THEN
        INSERT INTO Log_Operacao (log_id, operacao_id, instante, tipo_operacao, dados_operacao)
        VALUES (log_seq.NEXTVAL, :NEW.id, CURRENT_TIMESTAMP, 'Alteração',
                'Data: ' || TO_CHAR(:NEW.data, 'YYYY-MM-DD') || ', Validade: ' || :NEW.validade);
    END IF;
END;

/

