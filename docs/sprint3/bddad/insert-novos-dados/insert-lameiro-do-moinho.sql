-- 04/01/2019 operação de aplicação de fator de produção BIOFERTIL N6, no solo, 1.1 ha, 3200 kg
INSERT INTO OPERACAO_AGRICOLA(ID, DATA)
VALUES (?, TO_DATE('04/01/2019', 'DD/MM/YYYY'));
INSERT INTO APLICACAO_FP(OPERACAO_ID, PARCELA_ID, VARIEDADE_ID, FATOR_PRODUCAO_ID, METODO_APLICACAO_ID, QUANTIDADE,
                         AREA)
VALUES (?, ?, ?, ?, ?, 3200, 1.1);

-- 09/01/2019 operação de plantação de Macieira Porta da Loja, 50 un
INSERT INTO OPERACAO_AGRICOLA(ID, DATA)
VALUES (?, TO_DATE('09/01/2019', 'DD/MM/YYYY'));
INSERT INTO OP_PLANTACAO(OPERACAO_ID, PARCELA_ID, VARIEDADE_ID, METODO_EXECUCAO_ID, QUANTIDADE)
VALUES (?, ?, ?, NULL, 50);

-- 09/01/2019 operação de plantação de Macieira Malápio, 20 un
INSERT INTO OPERACAO_AGRICOLA(ID, DATA)
VALUES (?, TO_DATE('09/01/2019', 'DD/MM/YYYY'));
INSERT INTO OP_PLANTACAO(OPERACAO_ID, PARCELA_ID, VARIEDADE_ID, METODO_EXECUCAO_ID, QUANTIDADE)
VALUES (?, ?, ?, NULL, 20);

-- 10/01/2019 operação de plantação de Macieira Pipo de Basto, 40 un
INSERT INTO OPERACAO_AGRICOLA(ID, DATA)
VALUES (?, TO_DATE('10/01/2019', 'DD/MM/YYYY'));
INSERT INTO OP_PLANTACAO(OPERACAO_ID, PARCELA_ID, VARIEDADE_ID, METODO_EXECUCAO_ID, QUANTIDADE)
VALUES (?, ?, ?, NULL, 40);

-- 10/01/2019 operação de plantação de Macieira Canada, 30 un
INSERT INTO OPERACAO_AGRICOLA(ID, DATA)
VALUES (?, TO_DATE('10/01/2019', 'DD/MM/YYYY'));
INSERT INTO OP_PLANTACAO(OPERACAO_ID, PARCELA_ID, VARIEDADE_ID, METODO_EXECUCAO_ID, QUANTIDADE)
VALUES (?, ?, ?, NULL, 30);

-- 11/01/2019 operação de plantação de Macieira Grand Fay, 40 un
INSERT INTO OPERACAO_AGRICOLA(ID, DATA)
VALUES (?, TO_DATE('11/01/2019', 'DD/MM/YYYY'));
INSERT INTO OP_PLANTACAO(OPERACAO_ID, PARCELA_ID, VARIEDADE_ID, METODO_EXECUCAO_ID, QUANTIDADE)
VALUES (?, ?, ?, NULL, 40);

-- 11/01/2019 operação de plantação de Macieira Gronho Doce, 50 un
INSERT INTO OPERACAO_AGRICOLA(ID, DATA)
VALUES (?, TO_DATE('11/01/2019', 'DD/MM/YYYY'));
INSERT INTO OP_PLANTACAO(OPERACAO_ID, PARCELA_ID, VARIEDADE_ID, METODO_EXECUCAO_ID, QUANTIDADE)
VALUES (?, ?, ?, NULL, 50);

-- 06/01/2020 operação de aplicação de fator de produção Fertimax Extrume de Cavalo, no solo, Macieira Porta da Loja, 100 kg
INSERT INTO OPERACAO_AGRICOLA(ID, DATA)
VALUES (?, TO_DATE('06/01/2020', 'DD/MM/YYYY'));
INSERT INTO APLICACAO_FP(OPERACAO_ID, PARCELA_ID, VARIEDADE_ID, FATOR_PRODUCAO_ID, METODO_APLICACAO_ID, QUANTIDADE,
                         AREA)
VALUES (?, ?, ?, ?, ?, 100, null);

-- 06/01/2020 operação de aplicação de fator de produção Fertimax Extrume de Cavalo, no solo, Macieira Malápio, 40 kg
INSERT INTO OPERACAO_AGRICOLA(ID, DATA)
VALUES (?, TO_DATE('06/01/2020', 'DD/MM/YYYY'));
INSERT INTO APLICACAO_FP(OPERACAO_ID, PARCELA_ID, VARIEDADE_ID, FATOR_PRODUCAO_ID, METODO_APLICACAO_ID, QUANTIDADE,
                         AREA)
VALUES (?, ?, ?, ?, ?, 40, null);

-- 06/01/2020 operação de aplicação de fator de produção Fertimax Extrume de Cavalo, no solo, Macieira Pipo de Basto, 80 kg
INSERT INTO OPERACAO_AGRICOLA(ID, DATA)
VALUES (?, TO_DATE('06/01/2020', 'DD/MM/YYYY'));
INSERT INTO APLICACAO_FP(OPERACAO_ID, PARCELA_ID, VARIEDADE_ID, FATOR_PRODUCAO_ID, METODO_APLICACAO_ID, QUANTIDADE,
                         AREA)
VALUES (?, ?, ?, ?, ?, 80, null);

-- 06/01/2020 operação de aplicação de fator de produção Fertimax Extrume de Cavalo, no solo, Macieira Canada, 60 kg
INSERT INTO OPERACAO_AGRICOLA(ID, DATA)
VALUES (?, TO_DATE('06/01/2020', 'DD/MM/YYYY'));
INSERT INTO APLICACAO_FP(OPERACAO_ID, PARCELA_ID, VARIEDADE_ID, FATOR_PRODUCAO_ID, METODO_APLICACAO_ID, QUANTIDADE,
                         AREA)
VALUES (?, ?, ?, ?, ?, 60, null);

-- 07/01/2020 operação de aplicação de fator de produção Fertimax Extrume de Cavalo, no solo, Macieira Grand Fay, 80 kg
INSERT INTO OPERACAO_AGRICOLA(ID, DATA)
VALUES (?, TO_DATE('07/01/2020', 'DD/MM/YYYY'));
INSERT INTO APLICACAO_FP(OPERACAO_ID, PARCELA_ID, VARIEDADE_ID, FATOR_PRODUCAO_ID, METODO_APLICACAO_ID, QUANTIDADE,
                         AREA)
VALUES (?, ?, ?, ?, ?, 80, null);

-- 07/01/2020 operação de aplicação de fator de produção Fertimax Extrume de Cavalo, no solo, Macieira Gronho Doce, 100 kg
INSERT INTO OPERACAO_AGRICOLA(ID, DATA)
VALUES (?, TO_DATE('07/01/2020', 'DD/MM/YYYY'));
INSERT INTO APLICACAO_FP(OPERACAO_ID, PARCELA_ID, VARIEDADE_ID, FATOR_PRODUCAO_ID, METODO_APLICACAO_ID, QUANTIDADE,
                         AREA)
VALUES (?, ?, ?, ?, ?, 100, null);

-- 07/01/2021 operação de aplicação de fator de produção Fertimax Extrume de Cavalo, no solo, Macieira Porta da Loja, 150 kg
INSERT INTO OPERACAO_AGRICOLA(ID, DATA)
VALUES (?, TO_DATE('07/01/2021', 'DD/MM/YYYY'));
INSERT INTO APLICACAO_FP(OPERACAO_ID, PARCELA_ID, VARIEDADE_ID, FATOR_PRODUCAO_ID, METODO_APLICACAO_ID, QUANTIDADE,
                         AREA)
VALUES (?, ?, ?, ?, ?, 150, null);

-- 07/01/2021 operação de aplicação de fator de produção Fertimax Extrume de Cavalo, no solo, Macieira Malápio, 60 kg
INSERT INTO OPERACAO_AGRICOLA(ID, DATA)
VALUES (?, TO_DATE('07/01/2021', 'DD/MM/YYYY'));
INSERT INTO APLICACAO_FP(OPERACAO_ID, PARCELA_ID, VARIEDADE_ID, FATOR_PRODUCAO_ID, METODO_APLICACAO_ID, QUANTIDADE,
                         AREA)
VALUES (?, ?, ?, ?, ?, 60, null);

-- 08/01/2021 operação de aplicação de fator de produção Fertimax Extrume de Cavalo, no solo, Macieira Pipo de Basto, 120 kg
INSERT INTO OPERACAO_AGRICOLA(ID, DATA)
VALUES (?, TO_DATE('08/01/2021', 'DD/MM/YYYY'));
INSERT INTO APLICACAO_FP(OPERACAO_ID, PARCELA_ID, VARIEDADE_ID, FATOR_PRODUCAO_ID, METODO_APLICACAO_ID, QUANTIDADE,
                         AREA)
VALUES (?, ?, ?, ?, ?, 120, null);

-- 07/01/2021 operação de aplicação de fator de produção Fertimax Extrume de Cavalo, no solo, Macieira Canada, 90 kg
INSERT INTO OPERACAO_AGRICOLA(ID, DATA)
VALUES (?, TO_DATE('07/01/2021', 'DD/MM/YYYY'));
INSERT INTO APLICACAO_FP(OPERACAO_ID, PARCELA_ID, VARIEDADE_ID, FATOR_PRODUCAO_ID, METODO_APLICACAO_ID, QUANTIDADE,
                         AREA)
VALUES (?, ?, ?, ?, ?, 90, null);

-- 07/01/2021 operação de aplicação de fator de produção Fertimax Extrume de Cavalo, no solo, Macieira Grand Fay, 120 kg
INSERT INTO OPERACAO_AGRICOLA(ID, DATA)
VALUES (?, TO_DATE('07/01/2021', 'DD/MM/YYYY'));
INSERT INTO APLICACAO_FP(OPERACAO_ID, PARCELA_ID, VARIEDADE_ID, FATOR_PRODUCAO_ID, METODO_APLICACAO_ID, QUANTIDADE,
                         AREA)
VALUES (?, ?, ?, ?, ?, 120, null);

-- 08/01/2021 operação de aplicação de fator de produção Fertimax Extrume de Cavalo, no solo, Macieira Gronho Doce, 150 kg
INSERT INTO OPERACAO_AGRICOLA(ID, DATA)
VALUES (?, TO_DATE('08/01/2021', 'DD/MM/YYYY'));
INSERT INTO APLICACAO_FP(OPERACAO_ID, PARCELA_ID, VARIEDADE_ID, FATOR_PRODUCAO_ID, METODO_APLICACAO_ID, QUANTIDADE,
                         AREA)
VALUES (?, ?, ?, ?, ?, 150, null);

-- 15/01/2022 operação de aplicação de fator de produção BIOFERTIL N6, no solo, Macieira Porta da Loja, 150 kg
INSERT INTO OPERACAO_AGRICOLA(ID, DATA)
VALUES (?, TO_DATE('15/01/2022', 'DD/MM/YYYY'));
INSERT INTO APLICACAO_FP(OPERACAO_ID, PARCELA_ID, VARIEDADE_ID, FATOR_PRODUCAO_ID, METODO_APLICACAO_ID, QUANTIDADE,
                         AREA)
VALUES (?, ?, ?, ?, ?, 150, null);

-- 15/01/2022 operação de aplicação de fator de produção BIOFERTIL N6, no solo, Macieira Malápio, 60 kg
INSERT INTO OPERACAO_AGRICOLA(ID, DATA)
VALUES (?, TO_DATE('15/01/2022', 'DD/MM/YYYY'));
INSERT INTO APLICACAO_FP(OPERACAO_ID, PARCELA_ID, VARIEDADE_ID, FATOR_PRODUCAO_ID, METODO_APLICACAO_ID, QUANTIDADE,
                         AREA)
VALUES (?, ?, ?, ?, ?, 60, null);

-- 15/01/2022 operação de aplicação de fator de produção BIOFERTIL N6, no solo, Macieira Pipo de Basto, 120 kg
INSERT INTO OPERACAO_AGRICOLA(ID, DATA)
VALUES (?, TO_DATE('15/01/2022', 'DD/MM/YYYY'));
INSERT INTO APLICACAO_FP(OPERACAO_ID, PARCELA_ID, VARIEDADE_ID, FATOR_PRODUCAO_ID, METODO_APLICACAO_ID, QUANTIDADE,
                         AREA)
VALUES (?, ?, ?, ?, ?, 120, null);

-- 16/01/2022 operação de aplicação de fator de produção BIOFERTIL N6, no solo, Macieira Canada, 90 kg
INSERT INTO OPERACAO_AGRICOLA(ID, DATA)
VALUES (?, TO_DATE('16/01/2022', 'DD/MM/YYYY'));
INSERT INTO APLICACAO_FP(OPERACAO_ID, PARCELA_ID, VARIEDADE_ID, FATOR_PRODUCAO_ID, METODO_APLICACAO_ID, QUANTIDADE,
                         AREA)
VALUES (?, ?, ?, ?, ?, 90, null);

-- 16/01/2022 operação de aplicação de fator de produção BIOFERTIL N6, no solo, Macieira Grand Fay, 120 kg
INSERT INTO OPERACAO_AGRICOLA(ID, DATA)
VALUES (?, TO_DATE('16/01/2022', 'DD/MM/YYYY'));
INSERT INTO APLICACAO_FP(OPERACAO_ID, PARCELA_ID, VARIEDADE_ID, FATOR_PRODUCAO_ID, METODO_APLICACAO_ID, QUANTIDADE,
                         AREA)
VALUES (?, ?, ?, ?, ?, 120, null);

-- 16/01/2022 operação de aplicação de fator de produção BIOFERTIL N6, no solo, Macieira Gronho Doce, 150 kg
INSERT INTO OPERACAO_AGRICOLA(ID, DATA)
VALUES (?, TO_DATE('16/01/2022', 'DD/MM/YYYY'));
INSERT INTO APLICACAO_FP(OPERACAO_ID, PARCELA_ID, VARIEDADE_ID, FATOR_PRODUCAO_ID, METODO_APLICACAO_ID, QUANTIDADE,
                         AREA)
VALUES (?, ?, ?, ?, ?, 150, null);

-- 15/05/2023 operação de aplicação de fator de produção EPSO Microtop, foliar, Macieira Porta da Loja, 5 kg
INSERT INTO OPERACAO_AGRICOLA(ID, DATA)
VALUES (?, TO_DATE('15/05/2023', 'DD/MM/YYYY'));
INSERT INTO APLICACAO_FP(OPERACAO_ID, PARCELA_ID, VARIEDADE_ID, FATOR_PRODUCAO_ID, METODO_APLICACAO_ID, QUANTIDADE,
                         AREA)
VALUES (?, ?, ?, ?, ?, 5, null);

-- 15/05/2023 operação de aplicação de fator de produção EPSO Microtop, foliar, Macieira Malápio, 2 kg
INSERT INTO OPERACAO_AGRICOLA(ID, DATA)
VALUES (?, TO_DATE('15/05/2023', 'DD/MM/YYYY'));
INSERT INTO APLICACAO_FP(OPERACAO_ID, PARCELA_ID, VARIEDADE_ID, FATOR_PRODUCAO_ID, METODO_APLICACAO_ID, QUANTIDADE,
                         AREA)
VALUES (?, ?, ?, ?, ?, 2, null);

-- 15/05/2023 operação de aplicação de fator de produção EPSO Microtop, foliar, Macieira Pipo de Basto, 4 kg
INSERT INTO OPERACAO_AGRICOLA(ID, DATA)
VALUES (?, TO_DATE('15/05/2023', 'DD/MM/YYYY'));
INSERT INTO APLICACAO_FP(OPERACAO_ID, PARCELA_ID, VARIEDADE_ID, FATOR_PRODUCAO_ID, METODO_APLICACAO_ID, QUANTIDADE,
                         AREA)
VALUES (?, ?, ?, ?, ?, 4, null);

-- 15/05/2023 operação de aplicação de fator de produção EPSO Microtop, foliar, Macieira Canada, 3 kg
INSERT INTO OPERACAO_AGRICOLA(ID, DATA)
VALUES (?, TO_DATE('15/05/2023', 'DD/MM/YYYY'));
INSERT INTO APLICACAO_FP(OPERACAO_ID, PARCELA_ID, VARIEDADE_ID, FATOR_PRODUCAO_ID, METODO_APLICACAO_ID, QUANTIDADE,
                         AREA)
VALUES (?, ?, ?, ?, ?, 3, null);

-- 15/05/2023 operação de aplicação de fator de produção EPSO Microtop, foliar, Macieira Grand Fay, 4 kg
INSERT INTO OPERACAO_AGRICOLA(ID, DATA)
VALUES (?, TO_DATE('15/05/2023', 'DD/MM/YYYY'));
INSERT INTO APLICACAO_FP(OPERACAO_ID, PARCELA_ID, VARIEDADE_ID, FATOR_PRODUCAO_ID, METODO_APLICACAO_ID, QUANTIDADE,
                         AREA)
VALUES (?, ?, ?, ?, ?, 4, null);

-- 15/05/2023 operação de aplicação de fator de produção EPSO Microtop, foliar, Macieira Gronho Doce, 5 kg
INSERT INTO OPERACAO_AGRICOLA(ID, DATA)
VALUES (?, TO_DATE('15/05/2023', 'DD/MM/YYYY'));
INSERT INTO APLICACAO_FP(OPERACAO_ID, PARCELA_ID, VARIEDADE_ID, FATOR_PRODUCAO_ID, METODO_APLICACAO_ID, QUANTIDADE,
                         AREA)
VALUES (?, ?, ?, ?, ?, 5, null);


-- 15/09/2023 operação de colheita de maçã Canada, 700 kg
INSERT INTO OPERACAO_AGRICOLA(ID, DATA)
VALUES (?, TO_DATE('15/09/2023', 'DD/MM/YYYY'));
INSERT INTO COLHEITA(OPERACAO_ID, PARCELA_ID, PRODUTO_ID, METODO_EXECUCAO_ID, QUANTIDADE)
VALUES (?, ?, ?, NULL, 700);

-- 16/09/2023 operação de colheita de maçã Grand Fay, 600 kg
INSERT INTO OPERACAO_AGRICOLA(ID, DATA)
VALUES (?, TO_DATE('16/09/2023', 'DD/MM/YYYY'));
INSERT INTO COLHEITA(OPERACAO_ID, PARCELA_ID, PRODUTO_ID, METODO_EXECUCAO_ID, QUANTIDADE)
VALUES (?, ?, ?, NULL, 600);

-- 20/09/2023 operação de colheita de maçã Grand Fay, 700 kg
INSERT INTO OPERACAO_AGRICOLA(ID, DATA)
VALUES (?, TO_DATE('20/09/2023', 'DD/MM/YYYY'));
INSERT INTO COLHEITA(OPERACAO_ID, PARCELA_ID, PRODUTO_ID, METODO_EXECUCAO_ID, QUANTIDADE)
VALUES (?, ?, ?, NULL, 700);

-- 27/09/2023 operação de colheita de maçã Pipo de Basto, 600 kg
INSERT INTO OPERACAO_AGRICOLA(ID, DATA)
VALUES (?, TO_DATE('27/09/2023', 'DD/MM/YYYY'));
INSERT INTO COLHEITA(OPERACAO_ID, PARCELA_ID, PRODUTO_ID, METODO_EXECUCAO_ID, QUANTIDADE)
VALUES (?, ?, ?, NULL, 600);

-- 05/10/2023 operação de colheita de maçã Pipo de Basto, 700 kg
INSERT INTO OPERACAO_AGRICOLA(ID, DATA)
VALUES (?, TO_DATE('05/10/2023', 'DD/MM/YYYY'));
INSERT INTO COLHEITA(OPERACAO_ID, PARCELA_ID, PRODUTO_ID, METODO_EXECUCAO_ID, QUANTIDADE)
VALUES (?, ?, ?, NULL, 700);

-- 15/10/2023 operação de colheita de maçã Gronho Doce, 1200 kg
INSERT INTO OPERACAO_AGRICOLA(ID, DATA)
VALUES (?, TO_DATE('15/10/2023', 'DD/MM/YYYY'));
INSERT INTO COLHEITA(OPERACAO_ID, PARCELA_ID, PRODUTO_ID, METODO_EXECUCAO_ID, QUANTIDADE)
VALUES (?, ?, ?, NULL, 1200);

-- 15/10/2023 operação de colheita de maçã Malápio, 700 kg
INSERT INTO OPERACAO_AGRICOLA(ID, DATA)
VALUES (?, TO_DATE('15/10/2023', 'DD/MM/YYYY'));
INSERT INTO COLHEITA(OPERACAO_ID, PARCELA_ID, PRODUTO_ID, METODO_EXECUCAO_ID, QUANTIDADE)
VALUES (?, ?, ?, NULL, 700);

-- 12/11/2023 operação de colheita de maçã Porta da Loja, 700 kg
INSERT INTO OPERACAO_AGRICOLA(ID, DATA)
VALUES (?, TO_DATE('12/11/2023', 'DD/MM/YYYY'));
INSERT INTO COLHEITA(OPERACAO_ID, PARCELA_ID, PRODUTO_ID, METODO_EXECUCAO_ID, QUANTIDADE)
VALUES (?, ?, ?, NULL, 700);

-- 15/11/2023 operação de colheita de maçã Porta da Loja, 800 kg
INSERT INTO OPERACAO_AGRICOLA(ID, DATA)
VALUES (?, TO_DATE('15/11/2023', 'DD/MM/YYYY'));
INSERT INTO COLHEITA(OPERACAO_ID, PARCELA_ID, PRODUTO_ID, METODO_EXECUCAO_ID, QUANTIDADE)
VALUES (?, ?, ?, NULL, 800);



-- 13/05/2023 operação de rega, setor 22, 120 min, 23:00
INSERT INTO OPERACAO_AGRICOLA(ID, DATA)
VALUES (?, TO_DATE('13/05/2023', 'DD/MM/YYYY'));
INSERT INTO Rega(operacao_id, setor_id, duracao, hora)
VALUES (?, 22, 120, '23:00');

-- 02/06/2023 operação de rega, setor 22, 120 min, 23:00
INSERT INTO OPERACAO_AGRICOLA(ID, DATA)
VALUES (?, TO_DATE('02/06/2023', 'DD/MM/YYYY'));
INSERT INTO Rega(operacao_id, setor_id, duracao, hora)
VALUES (?, 22, 120, '23:00');

-- 16/06/2023 operação de rega, setor 22, 120 min, 23:00
INSERT INTO OPERACAO_AGRICOLA(ID, DATA)
VALUES (?, TO_DATE('16/06/2023', 'DD/MM/YYYY'));
INSERT INTO Rega(operacao_id, setor_id, duracao, hora)
VALUES (?, 22, 120, '23:00');

-- 01/07/2023 operação de rega, setor 22, 120 min, 23:00
INSERT INTO OPERACAO_AGRICOLA(ID, DATA)
VALUES (?, TO_DATE('01/07/2023', 'DD/MM/YYYY'));
INSERT INTO Rega(operacao_id, setor_id, duracao, hora)
VALUES (?, 22, 120, '23:00');

-- 08/07/2023 operação de rega, setor 22, 180 min, 23:00
INSERT INTO OPERACAO_AGRICOLA(ID, DATA)
VALUES (?, TO_DATE('08/07/2023', 'DD/MM/YYYY'));
INSERT INTO Rega(operacao_id, setor_id, duracao, hora)
VALUES (?, 22, 180, '23:00');

-- 15/07/2023 operação de rega, setor 22, 180 min, 23:00
INSERT INTO OPERACAO_AGRICOLA(ID, DATA)
VALUES (?, TO_DATE('15/07/2023', 'DD/MM/YYYY'));
INSERT INTO Rega(operacao_id, setor_id, duracao, hora)
VALUES (?, 22, 180, '23:00');

-- 22/07/2023 operação de rega, setor 22, 180 min, 23:00
INSERT INTO OPERACAO_AGRICOLA(ID, DATA)
VALUES (?, TO_DATE('22/07/2023', 'DD/MM/YYYY'));
INSERT INTO Rega(operacao_id, setor_id, duracao, hora)
VALUES (?, 22, 180, '23:00');

-- 29/07/2023 operação de rega, setor 22, 180 min, 23:00
INSERT INTO OPERACAO_AGRICOLA(ID, DATA)
VALUES (?, TO_DATE('29/07/2023', 'DD/MM/YYYY'));
INSERT INTO Rega(operacao_id, setor_id, duracao, hora)
VALUES (?, 22, 180, '23:00');

-- 05/08/2023 operação de rega, setor 22, 150 min, 23:00
INSERT INTO OPERACAO_AGRICOLA(ID, DATA)
VALUES (?, TO_DATE('05/08/2023', 'DD/MM/YYYY'));
INSERT INTO Rega(operacao_id, setor_id, duracao, hora)
VALUES (?, 22, 150, '23:00');

-- 10/08/2023 operação de rega, setor 22, 150 min, 23:00
INSERT INTO OPERACAO_AGRICOLA(ID, DATA)
VALUES (?, TO_DATE('10/08/2023', 'DD/MM/YYYY'));
INSERT INTO Rega(operacao_id, setor_id, duracao, hora)
VALUES (?, 22, 150, '23:00');

-- 17/08/2023 operação de rega, setor 22, 150 min, 23:00
INSERT INTO OPERACAO_AGRICOLA(ID, DATA)
VALUES (?, TO_DATE('17/08/2023', 'DD/MM/YYYY'));
INSERT INTO Rega(operacao_id, setor_id, duracao, hora)
VALUES (?, 22, 150, '23:00');

-- 24/08/2023 operação de rega, setor 22, 120 min, 23:00
INSERT INTO OPERACAO_AGRICOLA(ID, DATA)
VALUES (?, TO_DATE('24/08/2023', 'DD/MM/YYYY'));
INSERT INTO Rega(operacao_id, setor_id, duracao, hora)
VALUES (?, 22, 120, '23:00');

-- 02/09/2023 operação de rega, setor 22, 120 min, 23:00
INSERT INTO OPERACAO_AGRICOLA(ID, DATA)
VALUES (?, TO_DATE('02/09/2023', 'DD/MM/YYYY'));
INSERT INTO Rega(operacao_id, setor_id, duracao, hora)
VALUES (?, 22, 120, '23:00');

-- 09/09/2023 operação de rega, setor 22, 120 min, 23:00
INSERT INTO OPERACAO_AGRICOLA(ID, DATA)
VALUES (?, TO_DATE('09/09/2023', 'DD/MM/YYYY'));
INSERT INTO Rega(operacao_id, setor_id, duracao, hora)
VALUES (?, 22, 120, '23:00');

-- 18/09/2023 operação de rega, setor 22, 120 min, 23:00
INSERT INTO OPERACAO_AGRICOLA(ID, DATA)
VALUES (?, TO_DATE('18/09/2023', 'DD/MM/YYYY'));
INSERT INTO Rega(operacao_id, setor_id, duracao, hora)
VALUES (?, 22, 120, '23:00');