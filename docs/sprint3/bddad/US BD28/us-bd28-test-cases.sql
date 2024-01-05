/*
 ** USBD28 Como Gestor Agrícola, pretendo que não seja possível apagar operações, mas deve ser possível anular uma operação, ficando isso registado na BD.

<Caso de sucesso>
Tentar apagar o último registo da tabela de rega
Deve dar erro por operação ilegal/não permitida.

O log da anulação realizada na demonstração da USBD30 deve estar na tabela de logs.
<\Caso de sucesso>

 */

insert into OPERACAO_AGRICOLA(id, data, validade)
values (-1, to_date('01-01-2000', 'dd-mm-yyyy'), 0);

select * from OPERACAO_AGRICOLA;



insert into REGA(operacao_id, setor_id, duracao, hora)
VALUES (-1, 10, -1, '00:00');

select * from REGA;



delete
from REGA
where OPERACAO_ID = -1;