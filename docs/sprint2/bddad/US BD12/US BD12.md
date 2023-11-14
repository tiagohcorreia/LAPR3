# US BD12 

## Descrição

Como Gestor Agrícola, quero registar uma operação de monda

## From the specifications document

>>A demonstração das user stories USBD11 a USBD20 tem de ser efetuada no SGBD Oracle a correr no docker do grupo na infraestrutura do DEI.
> Não são aceites demonstrações no LiveSQL, nem num SGBD local
> Os estudantes com LAPR3 podem chamar os métodos implementados a partir de uma aplicação Java.
> Todos podem chamar os métodos implementados em blocos anónimos (que têm de ser completamente funcionais, incluindo tratar eventuais exceções).


## Clarificações do Cliente 

>Question:Como gestor Agrícola, quero registar uma operação de monda. Onde dever ser aplicada a operação de monda: numa cultura especifica de uma parcela ou em todas as culturas daquele tipo numa parcela (ambas estas situações acontecem no sistema legado).

>Answer:Uma operação agrícola do tipo monda será sobre uma cultura instalada numa parcela. Isto não significa que não acabe por ser realizada em todas as parcelas com a mesma cultura mas nesse caso até poderá ocorrer noutras datas.


## Critérios de Aceitação

- **Critério mínimo de aceitação:** só serão avaliadas as US em que haja dados que permitam avaliar o seu funcionamento.

- **Esperado:** demonstrado com dados criados pelo grupo

- **Acima do esperado:** demonstrado com dados importados do sistema legacy

- **Conforme aplicável, a parcela, operação, planta, fruto, fator de produção, etc., têm de existir.**
- **Não é possível registar operações no futuro (não usar SYSDATE numa função, que ela deixa de ser testável!).**
- **Não é possível registar operações que envolvam área superior à de uma dada parcela.**
- **Não é possível registar operações que envolvam um número de plantas permanentes superior à existente na parcela.**
- **Não é possível registar alguns tipos de operações (e.g. colheita, poda, etc.) que envolvam um plantas permanentes ou temporárias que não existem na parcela.**

## Termos Importantes do Glossário

- Parcela Agrícola —> Área de terra usada para cultivo agrícola



