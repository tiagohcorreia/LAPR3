# US BD13

## Descrição

Como Product Owner, pretendo que seja desenvolvida uma funcionalidade que permita de forma automática consuma o plano de rega gerado pelo simulador do controlador desenvolvido na USLP02 e que de forma escalonada após a conclusão da rega em cada sector registe essa operação no caderno de campo.

## From the specifications document

>

## Clarificações do Cliente

>Question:

>Answer:


## Critérios de Aceitação

- **Critério mínimo de aceitação:** só serão avaliadas as US em que haja dados que permitam avaliar o seu funcionamento.

- **Esperado:** demonstrado com dados criados pelo grupo

- **Acima do esperado:** demonstrado com dados importados do sistema legacy
-
- **Conforme aplicável, a parcela, operação, planta, fruto, fator de produção, etc., têm de existir.**
- **Não é possível registar operações no futuro (não usar SYSDATE numa função, que ela deixa de ser testável!).**
- **Não é possível registar operações que envolvam área superior à de uma dada parcela.**
- **Não é possível registar operações que envolvam um número de plantas permanentes superior à existente na parcela.**
- **Não é possível registar alguns tipos de operações (e.g. colheita, poda, etc.) que envolvam um plantas permanentes ou temporárias que não existem na parcela.**


## Termos Importantes do Glossário

- Operação Agrícola -> Todas as atividades relacionadas com a produção agrícola. Incluem o preparo do solo, o plantio, a irrigação, a fertilização, o controle de pragas e doenças, a colheita e a pós-colheita.
- Parcela -> Área de terra usada para cultivo agrícola.
- Sistema de Rega/fertirrega | é um conjunto de equipamentos capaz de fazer chegar às culturas agua ou soluções aquosas contendo factores de produção



