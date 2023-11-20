/* Operacoes campo novo */

-- Operacao_Agricola
INSERT INTO Operacao_Agricola(id, data) VALUES (328, TO_DATE('2023-09-15', 'YYYY-MM-DD'));
INSERT INTO Operacao_Agricola(id, data) VALUES (329, TO_DATE('2023-09-25', 'YYYY-MM-DD'));
INSERT INTO Operacao_Agricola(id, data) VALUES (330, TO_DATE('2023-09-18', 'YYYY-MM-DD'));
INSERT INTO Operacao_Agricola(id, data) VALUES (331, TO_DATE('2023-09-22', 'YYYY-MM-DD'));
INSERT INTO Operacao_Agricola(id, data) VALUES (332, TO_DATE('2023-10-05', 'YYYY-MM-DD'));

INSERT INTO Operacao_Agricola(id, data) VALUES (333, TO_DATE('2023-06-12', 'YYYY-MM-DD'));
INSERT INTO Operacao_Agricola(id, data) VALUES (334, TO_DATE('2023-06-19', 'YYYY-MM-DD'));
INSERT INTO Operacao_Agricola(id, data) VALUES (335, TO_DATE('2023-06-30', 'YYYY-MM-DD'));
INSERT INTO Operacao_Agricola(id, data) VALUES (336, TO_DATE('2023-07-08', 'YYYY-MM-DD'));
INSERT INTO Operacao_Agricola(id, data) VALUES (337, TO_DATE('2023-07-15', 'YYYY-MM-DD'));
INSERT INTO Operacao_Agricola(id, data) VALUES (338, TO_DATE('2023-07-22', 'YYYY-MM-DD'));
INSERT INTO Operacao_Agricola(id, data) VALUES (339, TO_DATE('2023-07-29', 'YYYY-MM-DD'));
INSERT INTO Operacao_Agricola(id, data) VALUES (340, TO_DATE('2023-08-05', 'YYYY-MM-DD'));
INSERT INTO Operacao_Agricola(id, data) VALUES (341, TO_DATE('2023-08-12', 'YYYY-MM-DD'));
INSERT INTO Operacao_Agricola(id, data) VALUES (342, TO_DATE('2023-08-19', 'YYYY-MM-DD'));
INSERT INTO Operacao_Agricola(id, data) VALUES (343, TO_DATE('2023-08-26', 'YYYY-MM-DD'));
INSERT INTO Operacao_Agricola(id, data) VALUES (344, TO_DATE('2023-08-31', 'YYYY-MM-DD'));
INSERT INTO Operacao_Agricola(id, data) VALUES (345, TO_DATE('2023-09-05', 'YYYY-MM-DD'));

INSERT INTO Operacao_Agricola(id, data) VALUES (346, TO_DATE('2023-05-20', 'YYYY-MM-DD'));
INSERT INTO Operacao_Agricola(id, data) VALUES (347, TO_DATE('2023-06-02', 'YYYY-MM-DD'));
INSERT INTO Operacao_Agricola(id, data) VALUES (348, TO_DATE('2023-06-09', 'YYYY-MM-DD'));
INSERT INTO Operacao_Agricola(id, data) VALUES (349, TO_DATE('2023-07-09', 'YYYY-MM-DD'));
INSERT INTO Operacao_Agricola(id, data) VALUES (350, TO_DATE('2023-07-16', 'YYYY-MM-DD'));
INSERT INTO Operacao_Agricola(id, data) VALUES (351, TO_DATE('2023-07-23', 'YYYY-MM-DD'));
INSERT INTO Operacao_Agricola(id, data) VALUES (352, TO_DATE('2023-07-30', 'YYYY-MM-DD'));
INSERT INTO Operacao_Agricola(id, data) VALUES (353, TO_DATE('2023-08-07', 'YYYY-MM-DD'));
INSERT INTO Operacao_Agricola(id, data) VALUES (354, TO_DATE('2023-08-14', 'YYYY-MM-DD'));
INSERT INTO Operacao_Agricola(id, data) VALUES (355, TO_DATE('2023-08-21', 'YYYY-MM-DD'));
INSERT INTO Operacao_Agricola(id, data) VALUES (356, TO_DATE('2023-08-28', 'YYYY-MM-DD'));
INSERT INTO Operacao_Agricola(id, data) VALUES (357, TO_DATE('2023-09-06', 'YYYY-MM-DD'));
INSERT INTO Operacao_Agricola(id, data) VALUES (358, TO_DATE('2013-09-13', 'YYYY-MM-DD'));
INSERT INTO Operacao_Agricola(id, data) VALUES (359, TO_DATE('2013-09-20', 'YYYY-MM-DD'));

-- Semeadura

-- Monda

-- Colheita
INSERT INTO Colheita(operacao_id,parcela_id,produto_id,quantidade) values (328, .., ..,8000);
INSERT INTO Colheita(operacao_id,parcela_id,produto_id,quantidade) values (329, .., ..,5000);
INSERT INTO Colheita(operacao_id,parcela_id,produto_id,quantidade) values (330, .., ..,900);
INSERT INTO Colheita(operacao_id,parcela_id,produto_id,quantidade) values (331, .., ..,1500);
INSERT INTO Colheita(operacao_id,parcela_id,produto_id,quantidade) values (332, .., ..,1200);

-- Rega
-- Setor 42
INSERT INTO Rega(operacao_id, setor_id, duracao) VALUES (333, 42, 60);
INSERT INTO Rega(operacao_id, setor_id, duracao) VALUES (334, 42, 60);
INSERT INTO Rega(operacao_id, setor_id, duracao) VALUES (335, 42, 120);
INSERT INTO Rega(operacao_id, setor_id, duracao) VALUES (336, 42, 120);
INSERT INTO Rega(operacao_id, setor_id, duracao) VALUES (337, 42, 120);
INSERT INTO Rega(operacao_id, setor_id, duracao) VALUES (338, 42, 150);
INSERT INTO Rega(operacao_id, setor_id, duracao) VALUES (339, 42, 150);
INSERT INTO Rega(operacao_id, setor_id, duracao) VALUES (340, 42, 120);
INSERT INTO Rega(operacao_id, setor_id, duracao) VALUES (341, 42, 120);
INSERT INTO Rega(operacao_id, setor_id, duracao) VALUES (342, 42, 120);
INSERT INTO Rega(operacao_id, setor_id, duracao) VALUES (343, 42, 120);
INSERT INTO Rega(operacao_id, setor_id, duracao) VALUES (344, 42, 120);
INSERT INTO Rega(operacao_id, setor_id, duracao) VALUES (345, 42, 120);
INSERT INTO Rega(operacao_id, setor_id, duracao) VALUES (346, 42, 120);
-- Setor 41
INSERT INTO Rega(operacao_id, setor_id, duracao) VALUES (347, 41, 120);
INSERT INTO Rega(operacao_id, setor_id, duracao) VALUES (348, 41, 120);
INSERT INTO Rega(operacao_id, setor_id, duracao) VALUES (349, 41, 120);
INSERT INTO Rega(operacao_id, setor_id, duracao) VALUES (350, 41, 120);
INSERT INTO Rega(operacao_id, setor_id, duracao) VALUES (351, 41, 120);
INSERT INTO Rega(operacao_id, setor_id, duracao) VALUES (352, 41, 120);
INSERT INTO Rega(operacao_id, setor_id, duracao) VALUES (353, 41, 120);
INSERT INTO Rega(operacao_id, setor_id, duracao) VALUES (354, 41, 120);
INSERT INTO Rega(operacao_id, setor_id, duracao) VALUES (355, 41, 120);
INSERT INTO Rega(operacao_id, setor_id, duracao) VALUES (356, 41, 120);
INSERT INTO Rega(operacao_id, setor_id, duracao) VALUES (357, 41, 120);
INSERT INTO Rega(operacao_id, setor_id, duracao) VALUES (358, 41, 120);
INSERT INTO Rega(operacao_id, setor_id, duracao) VALUES (359, 41, 120);






