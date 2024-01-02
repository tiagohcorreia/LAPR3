/* Operacoes campo grande */

-- 12/10/2016 operação de plantação de Oliveira Arbequina, 40 un, compasso de 6 m, distancia entre filas de 6 m
INSERT INTO Operacao_Agricola(id, data, INSTANTE_REGISTO, VALIDADE)
VALUES (?, TO_DATE('2016-10-12', 'YYYY-MM-DD'), null, 1);
INSERT INTO Op_Plantacao(operacao_id, parcela_id, VARIEDADE_ID, quantidade, COMPASSO, DISTANCIA_FILAS)
values (?, ?, ?, 40, 6, 6);

-- 13/01/2021 operação de aplicação de fator de produção BIOFERTIL N6, Oliveira Picual, 120 kg
INSERT INTO Operacao_Agricola(id, data)
VALUES (?, TO_DATE('2021-01-13', 'YYYY-MM-DD'));
INSERT INTO Aplicacao_FP(operacao_id, parcela_id, variedade_id, fator_producao_id, metodo_aplicacao_id, quantidade,
                         area)
VALUES (?, ?, ?, ?, null, 120, null);

-- 12/01/2021 operação de aplicação de fator de produção BIOFERTIL N6, Oliveira Galega, 180 kg
INSERT INTO Operacao_Agricola(id, data)
VALUES (?, TO_DATE('2021-01-12', 'YYYY-MM-DD'));
INSERT INTO Aplicacao_FP(operacao_id, parcela_id, variedade_id, fator_producao_id, metodo_aplicacao_id, quantidade,
                         area)
VALUES (?, ?, ?, ?, null, 180, null);

-- 12/01/2021 operação de aplicação de fator de produção BIOFERTIL N6, Oliveira Arbequina, 240 kg
INSERT INTO Operacao_Agricola(id, data)
VALUES (?, TO_DATE('2021-01-12', 'YYYY-MM-DD'));
INSERT INTO Aplicacao_FP(operacao_id, parcela_id, variedade_id, fator_producao_id, metodo_aplicacao_id, quantidade,
                         area)
VALUES (?, ?, ?, ?, null, 240, null);

-- 12/01/2022 operação de aplicação de fator de produção BIOFERTIL N6, Oliveira Picual, 120 kg
INSERT INTO Operacao_Agricola(id, data)
VALUES (?, TO_DATE('2022-01-12', 'YYYY-MM-DD'));
INSERT INTO Aplicacao_FP(operacao_id, parcela_id, variedade_id, fator_producao_id, metodo_aplicacao_id, quantidade,
                         area)
VALUES (?, ?, ?, ?, null, 120, null);

-- 12/01/2022 operação de aplicação de fator de produção BIOFERTIL N6, Oliveira Galega, 180 kg
INSERT INTO Operacao_Agricola(id, data)
VALUES (?, TO_DATE('2022-01-12', 'YYYY-MM-DD'));
INSERT INTO Aplicacao_FP(operacao_id, parcela_id, variedade_id, fator_producao_id, metodo_aplicacao_id, quantidade,
                         area)
VALUES (?, ?, ?, ?, null, 180, null);

-- 13/01/2022 operação de aplicação de fator de produção BIOFERTIL N6, Oliveira Arbequina, 240 kg
INSERT INTO Operacao_Agricola(id, data)
VALUES (?, TO_DATE('2022-01-13', 'YYYY-MM-DD'));
INSERT INTO Aplicacao_FP(operacao_id, parcela_id, variedade_id, fator_producao_id, metodo_aplicacao_id, quantidade,
                         area)
VALUES (?, ?, ?, ?, null, 240, null);

-- 12/01/2023 operação de aplicação de fator de produção BIOFERTIL N6, Oliveira Picual, 120 kg
INSERT INTO Operacao_Agricola(id, data)
VALUES (?, TO_DATE('2023-01-12', 'YYYY-MM-DD'));
INSERT INTO Aplicacao_FP(operacao_id, parcela_id, variedade_id, fator_producao_id, metodo_aplicacao_id, quantidade,
                         area)
VALUES (?, ?, ?, ?, null, 120, null);

-- 12/01/2023 operação de aplicação de fator de produção BIOFERTIL N6, Oliveira Galega, 180 kg
INSERT INTO Operacao_Agricola(id, data)
VALUES (?, TO_DATE('2023-01-12', 'YYYY-MM-DD'));
INSERT INTO Aplicacao_FP(operacao_id, parcela_id, variedade_id, fator_producao_id, metodo_aplicacao_id, quantidade,
                         area)
VALUES (?, ?, ?, ?, null, 180, null);

-- 12/01/2023 operação de aplicação de fator de produção BIOFERTIL N6, Oliveira Arbequina, 240 kg
INSERT INTO Operacao_Agricola(id, data)
VALUES (?, TO_DATE('2023-01-12', 'YYYY-MM-DD'));
INSERT INTO Aplicacao_FP(operacao_id, parcela_id, variedade_id, fator_producao_id, metodo_aplicacao_id, quantidade,
                         area)
VALUES (?, ?, ?, ?, null, 240, null);
--
-- 02/11/2023 operação de colheita de azeitona Arbequina, 400 kg
INSERT INTO Operacao_Agricola(id, data)
VALUES (?, TO_DATE('2023-11-02', 'YYYY-MM-DD'));
INSERT INTO Colheita(operacao_id, parcela_id, produto_id, quantidade)
values (?, ?, ?, 400);

-- 05/11/2023 operação de colheita de azeitona Picual, 300 kg
INSERT INTO Operacao_Agricola(id, data)
VALUES (?, TO_DATE('2023-11-05', 'YYYY-MM-DD'));
INSERT INTO Colheita(operacao_id, parcela_id, produto_id, quantidade)
values (?, ?, ?, 300);

-- 08/11/2023 operação de colheita de azeitona Galega, 350 kg
INSERT INTO Operacao_Agricola(id, data)
VALUES (?, TO_DATE('2023-11-08', 'YYYY-MM-DD'));
INSERT INTO Colheita(operacao_id, parcela_id, produto_id, quantidade)
values (?, ?, ?, 350);

