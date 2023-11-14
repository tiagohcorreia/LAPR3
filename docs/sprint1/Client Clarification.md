# From the Client Clarifications

>p: Onde deve ser aplicada a operação de monda: numa cultura especifica de uma parcela ou em todas as culturas daquele tipo numa parcela (ambas estas situações acontecem no sistema legado).
>
>r: uma operação agrícola do tipo monda será sobre uma cultura instalada numa parcela. Isto não significa que não acabe por ser realizada em todas as parcelas com a mesma cultura mas nesse caso até poderá ocorrer noutras datas.



>p: Quando o enunciado se refere a "e que de forma escalonada após a conclusão da rega em cada sector registe essa operação"  ,  significa que a operação apenas tem que ser registada comparando a data e hora atual do computador com a do ficheiro que o plano de rega gerou?
>Qual deve ser o formato do caderno de campo?
>O caderno de campo é também um ficheiro .csv ? 
>
>r: 1. Significa que quando termina a rega de uma sector (de acordo com o Plano de Rega criado no LP2) deve ser criada uma entrada no Caderno de Campo da instalação agrícola. A hora actual pode naturalmente ser fornecida pelo computador.
>2.O formato do Caderno de Campo é definido pela equipa e deve estar modelado/capturado pelo modelo conceptual e pelo lógico, os dados deste caderno são guardados na Base de Dados.



>p: Tendo em conta a seguinte informação acerca do Caderno de Campo:
>"O Caderno de Campo é um documento formal  que permite registar todas as operações agrícolas relevantes ocorridas na exploração, em particular:
>     ....
>Regas executadas, quantidades, data da realização, parcela;"
>Como é que, a partir do ficheiro gerado na US-LP02, sabemos a quantidade de água utilizada na rega?

r: as regas podem ser registadas em minutos e em função do tipo de rega instalado no sector/parcela e respectivo débito poderiamos calcular a quantidade de água. No entanto não entendo que o precisem de fazer, os minutos de rega são suficientes.



p: Boa tarde, a nova atualização do documento do projeto dá a entender que cultura e planta são a mesma coisa (no ponto de estado fenológico, secção 2.2). Gostaria de saber se isto é verdade e se caso contrário qual a relação entre as duas, obrigado.

r: a cultura da vinha tem plantas que são as videiras, por isso, o ciclo fenológico da videira determina o ciclo da vinha. Espero ter esclarecido a sua dúvida.



p: Bom dia, gostaria de saber se o input recebido pela USPL03 é o csv de output da USPL02, como por exemplo este:
Dia,Sector,Duração,Início,Final
2/11/2023,A,14,10:00,10:14
2/11/2023,B,8,10:14,10:22
2/11/2023,C,40,10:22,11:02
2/11/2023,E,7,11:02,11:09
2/11/2023,A,14,11:40,11:54
2/11/2023,B,8,11:54,12:02
2/11/2023,C,40,12:02,12:42
2/11/2023,E,7,12:42,12:49
2/11/2023,A,14,13:50,14:04
2/11/2023,B,8,14:04,14:12
2/11/2023,C,40,14:12,14:52
2/11/2023,E,7,14:52,14:59
2/11/2023,A,14,22:00,22:14
2/11/2023,B,8,22:14,22:22
2/11/2023,C,40,22:22,23:02
2/11/2023,E,7,23:02,23:09

r: de facto, na USLP3 é será utilizada a informação gerada na USLP2. No entanto, a decisão de consumir um ficheiro .csv, ou não, depende da forma como vai interligar as duas USs.



p: Para inserir uma operação na base de dados é necessário o tipo de operação (colheita, poda, etc...), esta US consiste em adicionar uma operação de aplicação de fator produção, o que é que colocamos como tipo de operação?
- Usamos um nome igual independentemente do tipo de fator de produção aplicado (Ex.: "Aplicação de um fator de produção")?
- Usamos um nome que depende do tipo de fator de produção aplicado (Ex.: Fertilização caso seja um fertilizante)?
- Usamos um nome que será posteriormente inserido pelo utilizador?

r: Não vou responder à questão, mas sugeria que perguntas sobre aspetos técnicos de US específicas de BDDAD faz mais sentido serem colocadas no forum de questões relacionadas com BDDAD. Não consigo perceber bem a sua questão, pelo que fico com dúvidas se não será antes sobre a US de LAPR3 correspondente, a USLP07, nomeadamente a forma como se pretende implementar a interação com o utilizador.

De qualquer forma, deixo-lhe a indicação que deve ser mais cuidadoso com a linguagem. Se não for tecnicamente correta é muito difícil ajudá-lo. Por exemplo:
"[...] o que é que colocamos como tipo de operação?
- Usamos um nome igual independentemente [...]"
Se interpretado literalmente, a simples sugestão que o tipo de operação a ser inserido na BD poderia ser um nome seria uma enormidade. Mas já poderá fazer sentido, ou não, ao nível da UI (US de LAPR3).



p: Nos dados legacy, as diferentes Plantas têm informações relativas aos seus periodos ideais para Poda, Floração, Colheita e Sementeira/Plantação.
Será necessário utilizar esta informação para realizar alguma análise das Plantas, ou podemos assumir que é meramente informativa.

r: a indicação dos períodos previstos diz respeito à realização de operações agrícolas (por exemplo, poda) e estado fenológico das plantas (por exemplo, floração). As operações agrícolas e estados fenológicos estão intimamente ligados e é importante a sua compreensão para a construção/actualização adequada dos artefactos que capturam a informação do domínio do problema. No entanto, são as USs que determinam a necessidade de modelar estes aspectos nos diferentes níveis de abstracção (conceptual, lógico, ...), enquanto não forem necessários em qualquer US, podem ser considerados "informativos".



p: No seguimento da análise efetuada à user storie USLP03, surgiu uma questão, sobre a seguinte nota:
"(...)Nota: No desenvolvimento desta US serao intencionalmente aspectos estudados em Sistemas Distribuidos (como por exemplo tolerancia a falhas)(...)"
O conceito de Sistemas Distribuidos, no contexto desta US, assumimos que é especificamente referente à convergência do registo da operação no caderno de campo nos processos.
Está correta a assunção? Em caso negativo, queiram p.f indicar detalhadamente o que pretende efetivamente para seguimento.

r: existe uma gralha na escrita do texto, deveria ser:
"No desenvolvimento desta US serao intencionalmente ignorados aspectos estudados em Sistemas Distribuidos (como por exemplo tolerancia a falhas)."
Isto significa que o simulador que está a ser desenvolvido, por exemplo, assume que os sistemas que lhe fornecem dados vão funcionar adequadamente, sem falhas. O que obviamente é uma simplificação do caso real mas pedagógicamente adequada ao ano curricular em que decorre LAPR3.



p: Pressupondo que temos um plano de rega a começar às 15:00 e às 16:00 e a duração de cada ciclo de rega é de 01:30. Nesta situação, o programa deve alertar e não deixar executar, pois o plano está mal definido, ou deve executar normalmente com o segundo ciclo a começar às 16:30?

r: deve ser gerado um alerta aquando da geração do plano de rega.



p: Numa pergunta que fiz sobre a extensão do plano de rega, disse-me o seguinte: "No caso de gerarem um ficheiro de texto (desejável) com o resultado da geração (Plano de Rega) deveria ter uma extensao .csv.".
O cliente pode elaborar mais neste 'resultado' da geração do Plano de Rega? Do que se trata?

r: suponhamos o seguinte ficheiro exemplo com as instruções para gerar o plano de rega:
8:30, 17:00
A,14,T
B,8,T
C,25,P
D,25,I
E,7,T
F,10,3
e que o dia de geração seria hoje (24/10/2023). Assim, o plano de rega deveria ser:

Dia Sector Duração Inicio Final
24/10/2023 A 14 08:30 08:44
24/10/2023 B 8 08:44 08:52
24/10/2023 C 25 08:52 09:17
24/10/2023 E 7 09:17 09:24
24/10/2023 F 10 09:24 09:34
24/10/2023 A 14 17:00 17:14
24/10/2023 B 8 17:14 17:22
24/10/2023 C 25 17:22 17:47
24/10/2023 E 7 17:47 17:54
24/10/2023 F 10 17:54 18:04

Se exportar este resultado para um ficheiro, .csv parece-me uma extensão apropriada.



p: Gostaríamos de lhe perguntar se é necessário que a aplicação tenha alguma característica do gestor agricola.
Por exemplo, deverá estar associado a este um nome, morada, etc..?

r: não sei se o Gestor Agrícola é uma entidade do domínio ou um utilizador do sistema a desenvolver. No primeiro caso, as USs serão determinantes para aferir os atributos necessários, no segundo, não será requerida informação adicional.



> **Question:** "Venho por meio este colocar uma questão sobre a presença do sistema de rega no modelo relaciona, 
> o enunciado refere a este componente como uma "caixa preta", isto faz com que no modelo relacional, se representado,
> seja uma tabela com quase nenhuma utilidade, sendo apenas uma formalidade. Visto isto, é necessário o sistema de rega 
> ser representado no modelo relacional?"
>  
> **Answer:** "R: Tem de distinguir entre a modelação da morfologia do sistema de rega (detalhes internos), 
> que não é necessária, pelo menos para já, e a modelação geral de cada subsistema de rega. Esta última parece-me 
> essencial existir, ainda que possa eventualmente estar pouco detalhada neste sprint."
 
> **Question:** "Sabemos que uma parcela pode ter varias culturas, mas uma cultura pode estar em varias parcelas?"
>
> **Answer:** "sim de facto, uma parcela pode ter várias culturas, por exemplo, é possível ter milho, feijão e 
> abóboras porque criam "sinergias", chamadas consorciações (os feijões fixam o azoto no solo, o azoto é fundamental 
> para o milho, as canas do milho protegem as abóboras do sol, e também servem como estacas para o feijão, para além 
> disso as raizes das aboboreiras são muito fortes e profundas, e como tal arejam o solo). Este é um clássico mas 
> existem muitos exemplos destes, seja para repelir pragas ou para evitar o aparecimento de infestantes.

> **Question:** "Todos os respetivos sensores(temperatura, humidade, etc) devem estar ligados a uma entidade que guarda 
> os dados recolhidos ou os sensores devem estar ligados individualmente á estação metereológica?"
>
> **Answer:** "no essencial uma estação meteorológica agrícola (EMA) é constituída por um conjunto de sensores que
> medem diferentes grandezas meteológicas com interesse para a acitividade agrícola, como por exemplo, humidade 
> atmosférica, direcção e velocidade do vento, pressão atmosférica; normalmente existe um controlador que concentra as
> leituras dos diferentes sensores mas pode depender do fabricante. Os sensores do solo podem ler desde humidade e 
> muitas outras (por exemplo pH) depende da sofisticação, e podem não estar integrados na EMA."

> **Question:** "No enunciado do projeto foi especificado que a unidade de área da parcela é em hectares(ha), no 
> ficheiro legacy fornecido existem parcelas com diferentes tipos de unidades de área. A unidade a ser utilizada é a 
> do enunciado ou a do ficheiro fornecido (fazer a conversão para hectares) ?"
>
> **Answer:** "a unidade de referência para áreas em agricultura é o hectare; o dados legacy reflectem algo existente 
> que terá de ser importado (com todas as operações que isso implique) para o modelo que entenda utilizar na solução
> a desenvolver."
 
> **Question:** "Pode a mesma ficha técnica estar presente em múltiplos factores de produção?"
>
> **Answer:** "não; um factor de produção tem um nome comercial e uma ficha técnica. Se ajudar, considere o paralelo 
> com um medicamento, diferente medicamentos (produtos comerciais) podem ter a mesma composição 
> (por exemplo paracetamol) mas cada produto tem a sua bula."

> **Question:** "O que se entende por operações realizadas sobre uma parcela? Essas operações incluem sempre o uso 
> de fatores de produção?"
>
> **Answer:** "uma operação realizada numa parcela é uma acção cultural (sobre uma cultura), pode ser semeadura ou
> plantação, poda, monda, desfolha, aplicação de um factor de produção, corte de infestantes, rega, colheita, pastoreio 
> (entre outros). No fundo todas as actividades que visam fornecer as melhores condições às plantas e solo para uma 
> produção plena. Nem todas as acções implicam factores de produção, como por exemplo poda ou colheita."

> **Question:** "Os armazéns são sempre especializados ou podem existir armazéns que guardam mais do que um tipo de 
> inventário (ex.: armazém de ração e fator de produção)?"
>
> **Answer:** "isso depende do histórico de cada instalação agrícola, quando se tratam de quintas instaladas há muito 
> tempo, é comum os edifícios existentes assumirem múltiplas valências que podem mudar ao longo do tempo em função da 
> própria evolução da instalação. No caso de instalações novas, os armazéns podem ser criados de outra forma. 
> Em resumo, os edíficios podem assumir múltiplas funções."

> **Question:** "Uma estação meteorológica pode estar responsável por várias parcelas? E uma parcela pode ter várias
> estações meteorológicas?"
>
> **Answer:** "uma estção meteorológica pode ser um equipamento bastante caro e tipicamente servirá toda a exploração, 
> até porque as grandezas meteorológicas não variam significativamente em áreas pequenas. Os sensores de solo podem 
> existir vários por parcela, depende da dimensão da parcela e da precisão desejada dos valores medidos."

> **Question:** "Sr. Cliente, consegue-nos esclarecer sobre as extensões desejadas num ficheiro que reflete um plano de 
> rega? Este ficheiro pode ser .txt, .csv, etc..., ou existe alguma em específico?"
>
> **Answer:** "o ficheiro a consumir com as instruções de rega pode ter uma exensão .txt.
No caso de gerarem um ficheiro de texto (desejável) com o resultado da geração (Plano de Rega) deveria ter uma extensao 
> .csv."

> **Question:** "Gostaria saber se uma cultura, com apenas uma variedade de uma espécie, pode ter apenas um tipo de 
> produto resultante ou pode ter mais do que um."
>
> **Answer:** "pode ter mais do que um produto, por exemplo, na produção dos cereais, é comum colher o grão para 
> produção (por exemplo) de farinhas e a parte restante da planta é aproveitada para produção de palha para alimentação 
> animal."

> **Question:** "Um fator de produção pode ter mais de 4 componentes?"
>
> **Answer:** "Sim pode."

> **Question:** "Pretendo saber qual é a diferença entre os elementos e as substâncias presentes na ficha técnica, ou 
> então se são o mesmo conceito."
>
> **Answer:** "elemento será um elemento químico (e.g., Ferro, Calcio, Zinco,etc) e substância será tipicamente uma 
> mistura (e.g., calda bordalesa, que é sulfato de cobre penta-hidratado (CuSO4. 5H2O) com suspensão aquosa de 
> hidróxido de cálcio (Ca[OH]2) obtida pela hidratação e diluição da cal virgem (CaO))."

> **Question:** "Na ficha do fator de produção a composição química é expremida em percentagens, isto poderá mudar 
> no futuro? Por exemplo ser expremido pelos gramas de quimico por kilo de fator de produção. Além disso, a estação 
> metereológica pode ter vários sensores do mesmo tipo?"
>
> **Answer:** "a composição química é expressa em percentagem com o objectivo de comunicao uma relação face ao total. 
> Uma estação meteorológica não terá em princípio mais do que um sensor de um determinado tipo mas podem existir
> multiplos sensores do mesmo tipo no solo (por exemplo de humidade)."


> **Question:** ""
>
> **Answer:** ""