# US EI03 

## Descrição

Dado um veículo, a sua autonomia e atendendo a que os carregamentos só podem ser feitos nas localidades, determinar o percurso mínimo possível entre os dois locais mais afastados da rede de distribuição, indicando o número de paragens necessárias para carregamentos do veículo. 
## From the specifications document

>>Critério de Aceitação: Devolver o percurso entre os dois locais mais afastados da rede de distribuição: local de origem, os locais de passagem (indicando os locais onde foi feito carregamento da viatura), distância entre os locais do percurso,local destino, distância total do percurso e o número total de carregamentos.


## Clarificações do Cliente 

>Question:Considerando que temos acesso a coordenadas e a distancias de cada Edge, devemos considerar os dois pontos mais afastados como sendo os mais afastados a nível de caminho pelo grafo ou pela distancia de um ponto de GPS a outro?

>Answer:Na 3ª US pretende-se o percurso mínimo possível entre os dois locais mais afastados da rede de distribuição, ou seja, os dois vértices mais afastados no grafo.


 >Question:Em relação ao USEI03, para a determinação dos dois vertices mais distantes, é suposto ter em conta a autonomia?
Por exemplo, no grafo abaixo, o percurso mínimo dos dois vertices mais distantes tanto pode ser 1-2-4 como 1-3-4. No entanto, se a autonomia máxima for 100000 metros, já não é possível percorrer a aresta entre os vertices 3 e 4 visto que a distancia é superior à autonomia.
Neste caso, o percurso minimo dos dois vertices mais distantes seria 3-1-2-4 ou 1-2-4?

>Answer:Nesta US primeiro tem de encontrar os dois vértices mais distantes na rede. Depois tem de encontrar um possível caminho mínimo entre esses dois vértices mais distantes. Este caminho mínimo não pode conter troços cuja distância seja superior à autonomia do veículo.
No exemplo que dá, o caminho 1 - 3- 4 não é possível pois o veículo não tem autonomia para percorrer o troço 3 - 4, por isso o caminho mínimo possível é 1 - 2- 4.

>Question:

## Critérios de Aceitação

- **Critério mínimo de aceitação:** só serão avaliadas as US em que haja dados que permitam avaliar o seu funcionamento.

- **Esperado:** demonstrado com dados criados pelo grupo

- **Acima do esperado:** demonstrado com dados importados do sistema legacy


## Termos Importantes do Glossário

- Parcela Agrícola —> Área de terra usada para cultivo agrícola



