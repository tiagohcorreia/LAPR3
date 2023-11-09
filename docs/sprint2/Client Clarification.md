# From the Client Clarifications


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