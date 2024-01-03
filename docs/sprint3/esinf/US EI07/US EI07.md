# US EI07 

## Descrição

Encontrar para um produtor que parte de um local origem o percurso de entrega que maximiza o número de hubs pelo qual passa, tendo em consideração o horário de funcionamento de cada hub, o tempo de descarga dos cestos em cada hub, as distâncias a percorrer, a velocidade média do veículo e os tempos de carregamento do veículo
## From the specifications document
>>Critério de Aceitação:Devolver o local de origem do percurso, os locais de passagem (sendo um hub, identificá-lo), hora de chegada no formato hh:mm em todos os locais do percurso (tratando-se de um hub indicar também a hora de partida, no formato hh:mm, após a descarga dos cestos), a distãncia total do percurso, o número de carregamentos do veículo e o tempo total do circuito (discriminando o tempo afeto aos carregamentos do veículo, ao percurso e ao tempo de descarga dos cestos em cada hub).
 

## Clarificações do Cliente 

>Question:Segundo o enunciado:
"USEI07 – Encontrar para um produtor que parte de um local origem o percurso de entrega que maximiza o número de hubs pelo qual passa, tendo em consideração o horário de funcionamento de cada hub, o tempo de descarga dos cestos em cada hub, as distâncias a percorrer, a velocidade média do veículo e os tempos de carregamento do veículo."
A nossa pergunta é a seguinte: Considerando que o local de origem é um input, devemos também considerar que a velocidade do veículo, uma possível autonomia, um tempo de descargas e o tempo de carregamentos como um input do utilizador, dados de um ficheiro possivelmente recebido na US 11 ou algo que devemos, de uma forma, encontrar a partir dos dados já nos fornecidos?

>Answer:
Para maior simplicidade assuma que as viaturas têm uma autonomia máxima de A km, deslocando-se a uma velocidade média de V km/h, os carregamentos dos veículos só podem ser feitos nas localidades, nunca no percurso entre localidades, e cada carregamento de bateria dos veículos demora Tc min. Considere ainda que o tempo médio de descarga dos cabazes de produtos nos hubs é de cerca de Td min.
Estes dados quando necessários à US devem recebê-los por parâmetro.

 >Question:Na Us07 é pedido para encontrar o percurso que passe pelo maior numero de hubs .
A duvida que tenho é se temos que pedir ao utilizador quais os locais que este deseja que sejam hubs ou se temos que usar , por exemplo a us02 para definir tais hubs de forma "automática".

>Answer:Têm de usar os hubs definidos na US02. O número de hubs recebem por parâmetro.

>Question:Tenho uma duvida em relação ao descarregamento dos cestos .
Digamos que um veiculo chega a um hub as 12:50 e o hub fecha as 13:00 , caso o tempo de descarga dos cestos seja acima de 10 minutos consideramos o hub, ou assumimos que por este fechar , já fica indisponivel a descarga.

>Answer:Se conseguem chegar ao hub e este ainda aberto, podem considerá-lo, mesmo que o tempo de descarga exceda a janela temporal do hub.


>Question:Na US07, para o caminho que temos de encontrar, é obrigatório que ele consiga percorrer o caminho? Considerando a autonomia devo sempre encontrar um caminho que sirva para essa autonomia, sendo o caso em que não consegue aquele em que a autonomia não consegue percorrer nenhum á sua beira ou podemos utilizar o shortestpath para encontrar esse caminho e se nao conseguir percorrer dizemos que não consegue?
Ou seja, quão limitado é o nosso programa devido á autonomia nos dada?


>Answer:A autonomia do veículo não é um entrave à construção do caminho, pois o veículo pode ser carregado em qualquer localidade, por isso a autonomia pode é acrescentar mais tempo ao percurso.
## Critérios de Aceitação

- **Critério mínimo de aceitação:** só serão avaliadas as US em que haja dados que permitam avaliar o seu funcionamento.

- **Esperado:** demonstrado com dados criados pelo grupo

- **Acima do esperado:** demonstrado com dados importados do sistema legacy


## Termos Importantes do Glossário

- Parcela Agrícola —> Área de terra usada para cultivo agrícola



