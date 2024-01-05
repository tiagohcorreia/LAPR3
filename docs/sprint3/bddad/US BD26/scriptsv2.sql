create sequence LOG_OPERACAO_SEQ
    nocache
/
CREATE OR REPLACE TRIGGER PREVENT_DELETE_REGA_TRIGGER
    BEFORE DELETE ON Rega
    FOR EACH ROW
BEGIN
    RAISE_APPLICATION_ERROR(-20001, 'Nao e permitido apagar na tabela rega.');
END;
/
CREATE OR REPLACE TRIGGER REGA_INSERT_TRIGGER
    AFTER INSERT ON Rega
    FOR EACH ROW
DECLARE
    v_log_message NVARCHAR2(255);
BEGIN
    -- Customize the log message as needed
    v_log_message := 'Nova entrada de Rega com operacao_id: ' || :NEW.operacao_id || ', setor_id: ' || :NEW.setor_id || ', duracao: ' || :NEW.duracao || ', hora: ' || :NEW.hora;

    -- Insert into LOG_OPERACAO table
    INSERT INTO LOG_OPERACAO (id, operacao_id, log)
    VALUES (log_operacao_seq.NEXTVAL, :NEW.operacao_id, v_log_message);
END;
/
