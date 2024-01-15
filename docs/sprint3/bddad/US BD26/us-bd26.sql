CREATE TABLE Log_Operacao
(
    log_id         NUMBER(10) PRIMARY KEY,
    operacao_id    NUMBER(10)    NOT NULL,
    instante       TIMESTAMP(0)  NOT NULL,
    tipo_operacao  VARCHAR2(255) NOT NULL,
    data           DATE          NOT NULL,
    FOREIGN KEY (operacao_id) REFERENCES Operacao_Agricola (id)
);

-- Criação da sequência para log_id
CREATE SEQUENCE log_seq
    INCREMENT BY 1;

-- Criação do Trigger
CREATE OR REPLACE TRIGGER trig_log_operacao
    AFTER INSERT OR UPDATE
    ON Operacao_Agricola
    FOR EACH ROW
BEGIN
    IF INSERTING THEN
        INSERT INTO Log_Operacao (log_id, operacao_id, instante, tipo_operacao, data)
        VALUES (
                   log_seq.NEXTVAL,
                   :NEW.id,
                   CURRENT_TIMESTAMP,
                   'Criação',
                   :NEW.data
               );
    ELSIF UPDATING THEN
        INSERT INTO Log_Operacao (log_id, operacao_id, instante, tipo_operacao, data)
        VALUES (
                   log_seq.NEXTVAL,
                   :NEW.id,
                   CURRENT_TIMESTAMP,
                   'Alteração',
                   :NEW.data
               );
    END IF;
END;

SELECT * FROM Log_Operacao
ORDER BY LOG_ID ;


INSERT INTO Operacao_Agricola(id, data, validade)
VALUES (454, TO_DATE('20/09/2023', 'DD/MM/YYYY'), 1);
INSERT INTO Rega(operacao_id, setor_id, duracao, hora)
VALUES (454, 41, 120, '07:00');

SELECT * FROM Log_Operacao
ORDER BY LOG_ID ;

INSERT INTO Operacao_Agricola(id, data, validade)
VALUES (455, TO_DATE('20/09/2023', 'DD/MM/YYYY'), 1);
INSERT INTO Rega(operacao_id, setor_id, duracao, hora)
VALUES (455, 41, 120, '07:00');

SELECT * FROM Log_Operacao
ORDER BY LOG_ID ;

-- Update Operacao
UPDATE Operacao_Agricola
SET
    data = TO_DATE('21/09/2023', 'DD/MM/YYYY'), -- Updated date
    validade = 0 -- Updated validade
WHERE id = 455;

-- Update Rega
UPDATE Rega
SET
    setor_id = 42, -- Updated setor_id
    duracao = 150, -- Updated duracao
    hora = '08:30' -- Updated hora
WHERE operacao_id = 455;



SELECT * FROM Log_Operacao
ORDER BY LOG_ID ;


-- Drop the trigger
DROP TRIGGER trig_log_operacao;

-- Drop the sequence
DROP SEQUENCE log_seq;

-- Drop the table
DROP TABLE Log_Operacao;


SELECT *
FROM Operacao_Agricola
WHERE id = (SELECT MAX(id) FROM Operacao_Agricola);
