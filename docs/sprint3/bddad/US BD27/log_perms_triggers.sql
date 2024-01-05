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


--CASO DE TESTE

insert into OPERACAO_AGRICOLA(id, data, validade)
values(-1, to_date('01-01-2000', 'dd-mm-yyyy'), 0);

insert into LOG_OPERACAO(id, OPERACAO_ID, log)
values(-1, -1, 'log_teste');

select * from LOG_OPERACAO;

update LOG_OPERACAO set LOG='log_teste_update' where id=-1;
delete from LOG_OPERACAO where id=-1;