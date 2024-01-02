CREATE OR REPLACE TRIGGER log_operacao_update_trigger
    BEFORE UPDATE ON LOG_OPERACAO
    FOR EACH ROW
BEGIN
    RAISE_APPLICATION_ERROR(-20001, 'Updates are not allowed on the LOG_OPERACAO table.');
END;
/

CREATE OR REPLACE TRIGGER log_operacao_delete_trigger
    BEFORE DELETE ON LOG_OPERACAO
    FOR EACH ROW
BEGIN
    RAISE_APPLICATION_ERROR(-20002, 'Deletions are not allowed on the LOG_OPERACAO table.');
END;
/
