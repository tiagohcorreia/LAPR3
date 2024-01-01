--Receita 10
-- EPSO TOP, K+S, 1.5 kg/ha
-- soluSOP 52, K+S, 2.5 kg/ha
-- Floracal Flow SL, Plymag, 1.7 l/ha
INSERT INTO Receita_Fertirrega(id, nome)
VALUES (1, 'Receita 10');

INSERT INTO Receita_FP(receita_id, fp_id, proporcao, unidade)
VALUES (1, 6, 1.5, 'kg/ha');
INSERT INTO Receita_FP(receita_id, fp_id, proporcao, unidade)
VALUES (1, 15, 2.5, 'kg/ha');
INSERT INTO Receita_FP(receita_id, fp_id, proporcao, unidade)
VALUES (1, 16, 1.7, 'l/ha');


-- Receita 11
-- Tecniferti MOL, Tecniferti, 60 l/ha
-- Kiplant AllGrip, Asfertglobal, 2 l/ha
INSERT INTO Receita_Fertirrega(id, nome)
VALUES (2, 'Receita 11');

INSERT INTO Receita_FP(receita_id, fp_id, proporcao, unidade)
VALUES (2, 14, 60, 'l/ha');
INSERT INTO Receita_FP(receita_id, fp_id, proporcao, unidade)
VALUES (2, 17, 2, 'l/ha');