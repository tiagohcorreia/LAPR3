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

>Question:A operação de monda tem algum modo ? (ex:química, térmica ou manual).No caso de ser química, que tipo de fator de produção/modo de aplicação devem ser considerados?

>Answer:A monda é um processo utilizado pelo diminuir o número de frutos ou plantas, para potenciar maior calibre dos produtos finais.A monda pode ser química, manual ou mecânica (não conheço térmica). No caso de ser química deverá poder guardar o produto químico utilizado e quantidades.
 
>Question:Qual o tipo de unidade de uma operação de monda? Isto é, devem ser metros quadrados, hectares ou podem ser considerados ambos e/ou mais tipos de unidade?

>Anwer:Lamento, mas no contexto dos dados adicionais que recebeu para o sprint 2 e do script para a sprint review 2, a pergunta não faz qualquer sentido.

>Question:Onde dever ser aplicada a operação de monda: numa cultura especifica de uma parcela ou em todas as culturas daquele tipo numa parcela (ambas estas situações acontecem no sistema legado).
 
>Anwer:uma operação agrícola do tipo monda será sobre uma cultura instalada numa parcela. Isto não significa que não acabe por ser realizada em todas as parcelas com a mesma cultura mas nesse caso até poderá ocorrer noutras datas.

>Question:Numa conversa consigo, disse que existem mondas que são feitas à base de substâncias químicas o que, no fundo, é uma operação de aplicação de fatores de produção. Isso é aplicável ao domínio deste negócio, sendo que estamos a falar de agricultura em modo biológico, ou foi apenas uma observação de cultura geral?

> Answer:na agricultura a monda pode ser utilizada com fins diversos e ser realizada de formas distintas.
>Monda de fruto, retirar da árvore parte da fruta numa fase muito precoce para obter fruta com melhor calibre e manter a árvore mais equilibrada (evita produções aneiras, alternadas ao longo dos anos)
>Monda vegetal, por exemplo arrancar o excesso de plantas de milho ou cenoura que estão a competir entre si
>Monda de ervas daninhas, consiste em arrancar ou limitar a evolução de espécies vegetais que concorrem com a cultura principal, prefiro a designação, controlo de infestantes.
>No que diz respeito à utilização de químicos na AB, existe um mal-entendido generalizado sobre o tema, na AB não é permitida a utilização de químicos de síntese. Os quimicos, esses são utilizados constantemente, o monóxido de di-hidrogênio é o produto mais utilizado em regas.

>Question:Dentro do contexto da USBD12 - Como Gestor Agrícola, quero registar uma operação de monda, esta operação ocorre ao nível da parcela ou da cultura?

>Answer:A realidade é demasiado complexa. Para efeito deste projeto, para já, pode assumir que é de uma cultura.


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



