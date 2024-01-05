
-- ** USBD27 Como Gestor Agrícola, pretendo que não seja possível alterar ou apagar os logs.

/*
 <Caso de sucesso>
Tentar apagar o último registo da tabela de logs
Deve dar erro por operação ilegal/não permitida.

Tentar alterar texto do último registo da tabela de logs
Deve dar erro por operação ilegal/não permitida.
<\Caso de sucesso>

 */
insert into OPERACAO_AGRICOLA(id, data, validade)
values(-1, to_date('01-01-2000', 'dd-mm-yyyy'), 0);

insert into LOG_OPERACAO(id, OPERACAO_ID, log)
values(-1, -1, 'log_teste');

select * from LOG_OPERACAO;

update LOG_OPERACAO set LOG='log_teste_update' where id=-1;
delete from LOG_OPERACAO where id=-1;