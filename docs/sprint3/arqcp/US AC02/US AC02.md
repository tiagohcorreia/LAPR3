# US AC02 

## Descrição

Desenvolva uma função em assembly que insira um valor (int value) num array (int * array). Este array deve ser implementado de acordo com as regras de um buffer circular.

## From the specifications document

>>Este array deve ser implementado de acordo com as regras de um buffer circular.
void enqueue_value(int* array, int length,
int* read, int* write, int value);

> Um buffer circular é um array de tamanho fixo (definido por length) cuja política de inserções e remoções dos elementos do array permite a criar a circulariedade,isto é, faz com que o fim do array pareça estar ligado ao início (int * read,int *write). Se o array estiver cheio o elemento mais antigo no array deve ser descartado

## Clarificações do Cliente 

>Question:O avanço do apontador "write" e "read" deve ser feito no assembly, ou será gerido pelo código que chame o nosso método?

>Answer:Obviamente que é a função que atualiza o valor do índices.

>Question:Digamos que num array de tamanho 5, o apontador "read" está na posição 3 e o apontador "write" está na posição 2 (tendo já completado um "ciclo").
Se agora forem escritos 2 novos valores, em que posição ficaria o "write" e o "read"?

>Answer:Se o array tiver tamanho 5, guarda os últimos 5 valores. Quero com isto dizer, que se o buffer estiver cheio e aparecer um novo valor para ser registado, então é eliminado o valor que está à mais tempo no buffer e adicionado o novo valor.
Um buffer circular serve para guardar os n (sendo n o tamanho do buffer) últimos elementos produzidos por um qualquer sistema.

>Question:Relativamente à 2 já tinha percebido o que é um buffer circular, mas continuo sem perceber se quando insiro valores, se tenho de alguma maneira, mover o apontador read.

>Answer:Tens de "mover" o apontador read quando o buffer está cheio. Se está cheio e queres inserir um novo valor tens de retirar um. Ora retirar um elemento é avançar com o índice read.


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



