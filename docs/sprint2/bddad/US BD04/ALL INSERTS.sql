DELETE FROM Desfolha;
DELETE FROM Incorporacao_Solo;
DELETE FROM Mobilizacao_Solo;
DELETE FROM Op_Plantacao;
DELETE FROM Poda;
DELETE FROM Rega;
DELETE FROM Aplicacao_FP;
DELETE FROM Colheita;
DELETE FROM Monda;
DELETE FROM Sementeira;
DELETE FROM Tutoramento;
DELETE FROM Operacao_Agricola;
DELETE FROM FP_Metodo_Aplicacao;
DELETE FROM Ficha_Tecnica;
DELETE FROM Fator_Producao;
DELETE FROM Composto_Quimico;
DELETE FROM Plantacao_Permanente;
DELETE FROM Plantacao_Temporaria;
DELETE FROM SetorRega_Plantacao;
DELETE FROM Plantacao;
DELETE FROM Produto;
DELETE FROM Variedade_Permanente;
DELETE FROM Variedade_Temporaria;
DELETE FROM Variedade;
DELETE FROM Cultura;
DELETE FROM Edificio;
DELETE FROM Formulacao_FP;
DELETE FROM Metodo_Aplicacao;
DELETE FROM Metodo_Dispensasao;
DELETE FROM Metodo_Execucao;
DELETE FROM Parcela;
DELETE FROM Registro_Sensor;
DELETE FROM Sensor;
DELETE FROM Setor_Rega;
DELETE FROM Tipo_Edificio;
DELETE FROM Tipo_FP;
DELETE FROM Tipo_Sensor;



-- tabela Tipo_Edificio
INSERT INTO Tipo_Edificio(id, tipo, unidade)
VALUES (1, 'Armazém', 'm2');
INSERT INTO Tipo_Edificio(id, tipo, unidade)
VALUES (2, 'Garagem', 'm2');
INSERT INTO Tipo_Edificio(id, tipo, unidade)
VALUES (3, 'Moinho', NULL);
INSERT INTO Tipo_Edificio(id, tipo, unidade)
VALUES (4, 'Rega', 'm3');

-- tabela Parcela
INSERT INTO Parcela(id, nome, area)
VALUES (101, 'Campo da bouça', 1.2);
INSERT INTO Parcela(id, nome, area)
VALUES (102, 'Campo grande', 3);
INSERT INTO Parcela(id, nome, area)
VALUES (103, 'Campo do poço', 1.5);
INSERT INTO Parcela(id, nome, area)
VALUES (104, 'Lameiro da ponte', 0.8);
INSERT INTO Parcela(id, nome, area)
VALUES (105, 'Lameiro do moinho', 1.1);
INSERT INTO Parcela(id, nome, area)
VALUES (106, 'Horta Nova', 0.3);
INSERT INTO Parcela(id, nome, area)
VALUES (107, 'Vinha', 2);

-- tabela Edificio
INSERT INTO Edificio(id, nome, dimensao, tipo_edificio_id)
VALUES (201, 'Espigueiro', 600, 1);
INSERT INTO Edificio(id, nome, dimensao, tipo_edificio_id)
VALUES (202, 'Armazém novo', 800, 1);
INSERT INTO Edificio(id, nome, dimensao, tipo_edificio_id)
VALUES (203, 'Armazém grande', 900, 2);
INSERT INTO Edificio(id, nome, dimensao, tipo_edificio_id)
VALUES (250, 'Moinho', NULL, 3);
INSERT INTO Edificio(id, nome, dimensao, tipo_edificio_id)
VALUES (301, 'Tanque do campo grande', 18, 4);
INSERT INTO Edificio(id, nome, dimensao, tipo_edificio_id)
VALUES (302, 'Poço da bouça', 35, 4);

-- NOVOS DADOS ----------------------------------------------------------------------------------------------

-- Em 01/12/2022, Campo Novo, 1.1 ha
INSERT INTO Parcela(id, nome, area)
VALUES (108, 'Campo Novo', 1.1);

-- DADOS LEGACY

INSERT INTO Cultura(id, nome_comum, nome_cientifico)
values (1, 'Ameixoeira', 'Prunus domestica');
INSERT INTO Cultura(id, nome_comum, nome_cientifico)
values (2, 'Damasqueiro', 'Prunus armeniaca');
INSERT INTO Cultura(id, nome_comum, nome_cientifico)
values (3, 'Macieira', 'Malus domestica');
INSERT INTO Cultura(id, nome_comum, nome_cientifico)
values (4, 'Pera Nashi', 'Pyrus pyrifolia');
INSERT INTO Cultura(id, nome_comum, nome_cientifico)
values (5, 'Cenoura', 'Daucus carota subsp. Sativus');
INSERT INTO Cultura(id, nome_comum, nome_cientifico)
values (6, 'Tremoço', 'Lupinus luteus');
INSERT INTO Cultura(id, nome_comum, nome_cientifico)
values (7, 'Milho', 'Zea mays');
INSERT INTO Cultura(id, nome_comum, nome_cientifico)
values (8, 'Nabo greleiro', 'Brassica rapa');
INSERT INTO Cultura(id, nome_comum, nome_cientifico)
values (9, 'Oliveira', 'Olea europaea');
INSERT INTO Cultura(id, nome_comum, nome_cientifico)
values (10, 'Nabo', 'Brassica rapa');
INSERT INTO Cultura(id, nome_comum, nome_cientifico)
values (11, 'Videira', 'Vitis vinifera');

INSERT INTO Variedade(id, nome, cultura_id)
values (1, 'Ameixoeira Rainha Claudia Caranguejeira', 1);
INSERT INTO Variedade(id, nome, cultura_id)
values (2, 'Ameixoeira President', 1);
INSERT INTO Variedade(id, nome, cultura_id)
values (3, 'Ameixoeira Stanley', 1);
INSERT INTO Variedade(id, nome, cultura_id)
values (4, 'Ameixoeira Angeleno', 1);
INSERT INTO Variedade(id, nome, cultura_id)
values (5, 'Ameixoeira Black Beauty', 1);
INSERT INTO Variedade(id, nome, cultura_id)
values (6, 'Ameixoeira Black Star', 1);
INSERT INTO Variedade(id, nome, cultura_id)
values (7, 'Ameixoeira Black Gold', 1);
INSERT INTO Variedade(id, nome, cultura_id)
values (8, 'Ameixoeira Black Diamond', 1);
INSERT INTO Variedade(id, nome, cultura_id)
values (9, 'Ameixoeira Black Amber', 1);
INSERT INTO Variedade(id, nome, cultura_id)
values (10, 'Ameixoeira Black Splendor', 1);
INSERT INTO Variedade(id, nome, cultura_id)
values (11, 'Ameixoeira Fortuna', 1);
INSERT INTO Variedade(id, nome, cultura_id)
values (12, 'Ameixoeira Friar', 1);
INSERT INTO Variedade(id, nome, cultura_id)
values (13, 'Ameixoeira El Dorado', 1);
INSERT INTO Variedade(id, nome, cultura_id)
values (14, 'Ameixoeira Elephant Heart', 1);
INSERT INTO Variedade(id, nome, cultura_id)
values (15, 'Ameixoeira Golden Japan', 1);
INSERT INTO Variedade(id, nome, cultura_id)
values (16, 'Ameixoeira Harry Pitchon', 1);
INSERT INTO Variedade(id, nome, cultura_id)
values (17, 'Ameixoeira Laetitia', 1);
INSERT INTO Variedade(id, nome, cultura_id)
values (18, 'Ameixoeira Metley', 1);
INSERT INTO Variedade(id, nome, cultura_id)
values (19, 'Ameixoeira Mirabelle de Nancy', 1);
INSERT INTO Variedade(id, nome, cultura_id)
values (20, 'Ameixoeira Queen Rose', 1);
INSERT INTO Variedade(id, nome, cultura_id)
values (21, 'Ameixoeira Red Beaut', 1);
INSERT INTO Variedade(id, nome, cultura_id)
values (22, 'Ameixoeira Santa Rosa', 1);
INSERT INTO Variedade(id, nome, cultura_id)
values (23, 'Ameixoeira Shiro', 1);
INSERT INTO Variedade(id, nome, cultura_id)
values (24, 'Ameixoeira Sungold', 1);
INSERT INTO Variedade(id, nome, cultura_id)
values (25, 'Ameixoeira Wilson Perfection', 1);
INSERT INTO Variedade(id, nome, cultura_id)
values (26, 'Ameixoeira Autumn Giant', 1);
INSERT INTO Variedade(id, nome, cultura_id)
values (27, 'Damasqueiro Bulida', 2);
INSERT INTO Variedade(id, nome, cultura_id)
values (28, 'Damasqueiro Canino', 2);
INSERT INTO Variedade(id, nome, cultura_id)
values (29, 'Damasqueiro Liabaud', 2);
INSERT INTO Variedade(id, nome, cultura_id)
values (30, 'Damasqueiro Maillot Jaune', 2);
INSERT INTO Variedade(id, nome, cultura_id)
values (31, 'Damasqueiro Polonais', 2);
INSERT INTO Variedade(id, nome, cultura_id)
values (32, 'Macieira Akane', 3);
INSERT INTO Variedade(id, nome, cultura_id)
values (33, 'Macieira Belgolden', 3);
INSERT INTO Variedade(id, nome, cultura_id)
values (34, 'Macieira Bravo de Esmolfe', 3);
INSERT INTO Variedade(id, nome, cultura_id)
values (35, 'Macieira Casa Nova de Alcobaça', 3);
INSERT INTO Variedade(id, nome, cultura_id)
values (36, 'Macieira Erovan', 3);
INSERT INTO Variedade(id, nome, cultura_id)
values (37, 'Macieira Fuji', 3);
INSERT INTO Variedade(id, nome, cultura_id)
values (38, 'Macieira Granny Smith', 3);
INSERT INTO Variedade(id, nome, cultura_id)
values (39, 'Macieira Golden Delicious', 3);
INSERT INTO Variedade(id, nome, cultura_id)
values (40, 'Macieira Hi-Early', 3);
INSERT INTO Variedade(id, nome, cultura_id)
values (41, 'Macieira Jonagored', 3);
INSERT INTO Variedade(id, nome, cultura_id)
values (42, 'Macieira Lysgolden', 3);
INSERT INTO Variedade(id, nome, cultura_id)
values (43, 'Macieira Mutsu', 3);
INSERT INTO Variedade(id, nome, cultura_id)
values (44, 'Macieira Porta da Loja', 3);
INSERT INTO Variedade(id, nome, cultura_id)
values (45, 'Macieira Reinette ou Canada', 3);
INSERT INTO Variedade(id, nome, cultura_id)
values (46, 'Macieira Reinette ou Grand Fay', 3);
INSERT INTO Variedade(id, nome, cultura_id)
values (47, 'Macieira Riscadinha de Palmela', 3);
INSERT INTO Variedade(id, nome, cultura_id)
values (48, 'Macieira Royal Gala', 3);
INSERT INTO Variedade(id, nome, cultura_id)
values (49, 'Macieira Redchief', 3);
INSERT INTO Variedade(id, nome, cultura_id)
values (50, 'Macieira Starking', 3);
INSERT INTO Variedade(id, nome, cultura_id)
values (51, 'Macieira Summer Red', 3);
INSERT INTO Variedade(id, nome, cultura_id)
values (52, 'Macieira Wellspur Delicious', 3);
INSERT INTO Variedade(id, nome, cultura_id)
values (53, 'Macieira Noiva', 3);
INSERT INTO Variedade(id, nome, cultura_id)
values (54, 'Macieira Olho Aberto', 3);
INSERT INTO Variedade(id, nome, cultura_id)
values (55, 'Macieira Camoesa Rosa', 3);
INSERT INTO Variedade(id, nome, cultura_id)
values (56, 'Macieira Malapio', 3);
INSERT INTO Variedade(id, nome, cultura_id)
values (57, 'Macieira Gronho Doce', 3);
INSERT INTO Variedade(id, nome, cultura_id)
values (58, 'Macieira Pé de Boi', 3);
INSERT INTO Variedade(id, nome, cultura_id)
values (59, 'Macieira Pinova', 3);
INSERT INTO Variedade(id, nome, cultura_id)
values (60, 'Macieira Pardo Lindo', 3);
INSERT INTO Variedade(id, nome, cultura_id)
values (61, 'Macieira Pipo de Basto', 3);
INSERT INTO Variedade(id, nome, cultura_id)
values (62, 'Macieira Prima', 3);
INSERT INTO Variedade(id, nome, cultura_id)
values (63, 'Macieira Querina', 3);
INSERT INTO Variedade(id, nome, cultura_id)
values (64, 'Macieira Vista Bella', 3);
INSERT INTO Variedade(id, nome, cultura_id)
values (65, 'Macieira Golden Smoothee', 3);
INSERT INTO Variedade(id, nome, cultura_id)
values (66, 'Macieira Golden Suprema', 3);
INSERT INTO Variedade(id, nome, cultura_id)
values (67, 'Macieira Gloster 69', 3);
INSERT INTO Variedade(id, nome, cultura_id)
values (68, 'Macieira Freedom', 3);
INSERT INTO Variedade(id, nome, cultura_id)
values (69, 'Pera Nashi Sninseiki', 4);
INSERT INTO Variedade(id, nome, cultura_id)
values (70, 'Pera Nashi Kumoi', 4);
INSERT INTO Variedade(id, nome, cultura_id)
values (71, 'Pera Nashi Hosui', 4);
INSERT INTO Variedade(id, nome, cultura_id)
values (72, 'Pera Nashi Nijisseiki', 4);
INSERT INTO Variedade(id, nome, cultura_id)
values (73, 'Cenoura Carson Hybrid', 5);
INSERT INTO Variedade(id, nome, cultura_id)
values (74, 'Cenoura Red Cored Chantenay', 5);
INSERT INTO Variedade(id, nome, cultura_id)
values (75, 'Cenoura Danvers Half Long', 5);
INSERT INTO Variedade(id, nome, cultura_id)
values (76, 'Cenoura Imperator 58', 5);
INSERT INTO Variedade(id, nome, cultura_id)
values (77, 'Cenoura Sugarsnax Hybrid', 5);
INSERT INTO Variedade(id, nome, cultura_id)
values (78, 'Cenoura Nelson Hybrid', 5);
INSERT INTO Variedade(id, nome, cultura_id)
values (79, 'Cenoura Scarlet Nantes', 5);
INSERT INTO Variedade(id, nome, cultura_id)
values (80, 'Tremoço Amarelo', 6);
INSERT INTO Variedade(id, nome, cultura_id)
values (81, 'Tremoço Branco', 6);
INSERT INTO Variedade(id, nome, cultura_id)
values (82, 'Milho Mas 24.C', 7);
INSERT INTO Variedade(id, nome, cultura_id)
values (83, 'Milho Doce Golden Bantam', 7);
INSERT INTO Variedade(id, nome, cultura_id)
values (84, 'Nabo Greleiro Senhora Conceição', 8);
INSERT INTO Variedade(id, nome, cultura_id)
values (85, 'Oliveira Cobrançosa', 9);
INSERT INTO Variedade(id, nome, cultura_id)
values (86, 'Oliveira Arbequina', 9);
INSERT INTO Variedade(id, nome, cultura_id)
values (87, 'Oliveira Hojiblanca', 9);
INSERT INTO Variedade(id, nome, cultura_id)
values (88, 'Oliveira Negrinha do Freixo', 9);
INSERT INTO Variedade(id, nome, cultura_id)
values (89, 'Oliveira Picual', 9);
INSERT INTO Variedade(id, nome, cultura_id)
values (90, 'Oliveira Maçanilha', 9);
INSERT INTO Variedade(id, nome, cultura_id)
values (91, 'Oliveira Conserva de Elvas', 9);
INSERT INTO Variedade(id, nome, cultura_id)
values (92, 'Oliveira Galega', 9);
INSERT INTO Variedade(id, nome, cultura_id)
values (93, 'Nabo S. Cosme', 10);
INSERT INTO Variedade(id, nome, cultura_id)
values (94, 'Videira Dona Maria', 11);
INSERT INTO Variedade(id, nome, cultura_id)
values (95, 'Videira Cardinal', 11);

INSERT INTO Variedade_Permanente(variedade_id, fase_poda, fase_floracao, fase_colheita)
VALUES (1, 'Novembro a dezembro', 'Fevereiro a março', 'Julho a agosto');
INSERT INTO Variedade_Permanente(variedade_id, fase_poda, fase_floracao, fase_colheita)
VALUES (2, 'Novembro a dezembro', 'Fevereiro a março', 'Julho a agosto');
INSERT INTO Variedade_Permanente(variedade_id, fase_poda, fase_floracao, fase_colheita)
VALUES (3, 'Novembro a dezembro', 'Fevereiro a março', 'Julho a agosto');
INSERT INTO Variedade_Permanente(variedade_id, fase_poda, fase_floracao, fase_colheita)
VALUES (4, 'Novembro a dezembro', 'Fevereiro a março', 'Julho a agosto');
INSERT INTO Variedade_Permanente(variedade_id, fase_poda, fase_floracao, fase_colheita)
VALUES (5, 'Novembro a dezembro', 'Fevereiro a março', 'Julho a agosto');
INSERT INTO Variedade_Permanente(variedade_id, fase_poda, fase_floracao, fase_colheita)
VALUES (6, 'Novembro a dezembro', 'Fevereiro a março', 'Julho a agosto');
INSERT INTO Variedade_Permanente(variedade_id, fase_poda, fase_floracao, fase_colheita)
VALUES (7, 'Novembro a dezembro', 'Fevereiro a março', 'Julho a agosto');
INSERT INTO Variedade_Permanente(variedade_id, fase_poda, fase_floracao, fase_colheita)
VALUES (8, 'Novembro a dezembro', 'Fevereiro a março', 'Julho a agosto');
INSERT INTO Variedade_Permanente(variedade_id, fase_poda, fase_floracao, fase_colheita)
VALUES (9, 'Novembro a dezembro', 'Fevereiro a março', 'Julho a agosto');
INSERT INTO Variedade_Permanente(variedade_id, fase_poda, fase_floracao, fase_colheita)
VALUES (10, 'Novembro a dezembro', 'Fevereiro a março', 'Julho a agosto');
INSERT INTO Variedade_Permanente(variedade_id, fase_poda, fase_floracao, fase_colheita)
VALUES (11, 'Novembro a dezembro', 'Fevereiro a março', 'Julho a agosto');
INSERT INTO Variedade_Permanente(variedade_id, fase_poda, fase_floracao, fase_colheita)
VALUES (12, 'Novembro a dezembro', 'Fevereiro a março', 'Julho a agosto');
INSERT INTO Variedade_Permanente(variedade_id, fase_poda, fase_floracao, fase_colheita)
VALUES (13, 'Novembro a dezembro', 'Fevereiro a março', 'Julho a agosto');
INSERT INTO Variedade_Permanente(variedade_id, fase_poda, fase_floracao, fase_colheita)
VALUES (14, 'Novembro a dezembro', 'Fevereiro a março', 'Julho a agosto');
INSERT INTO Variedade_Permanente(variedade_id, fase_poda, fase_floracao, fase_colheita)
VALUES (15, 'Novembro a dezembro', 'Fevereiro a março', 'Julho a agosto');
INSERT INTO Variedade_Permanente(variedade_id, fase_poda, fase_floracao, fase_colheita)
VALUES (16, 'Novembro a dezembro', 'Fevereiro a março', 'Julho a agosto');
INSERT INTO Variedade_Permanente(variedade_id, fase_poda, fase_floracao, fase_colheita)
VALUES (17, 'Novembro a dezembro', 'Fevereiro a março', 'Julho a agosto');
INSERT INTO Variedade_Permanente(variedade_id, fase_poda, fase_floracao, fase_colheita)
VALUES (18, 'Novembro a dezembro', 'Fevereiro a março', 'Julho a agosto');
INSERT INTO Variedade_Permanente(variedade_id, fase_poda, fase_floracao, fase_colheita)
VALUES (19, 'Novembro a dezembro', 'Fevereiro a março', 'Julho a agosto');
INSERT INTO Variedade_Permanente(variedade_id, fase_poda, fase_floracao, fase_colheita)
VALUES (20, 'Novembro a dezembro', 'Fevereiro a março', 'Julho a agosto');
INSERT INTO Variedade_Permanente(variedade_id, fase_poda, fase_floracao, fase_colheita)
VALUES (21, 'Novembro a dezembro', 'Fevereiro a março', 'Julho a agosto');
INSERT INTO Variedade_Permanente(variedade_id, fase_poda, fase_floracao, fase_colheita)
VALUES (22, 'Novembro a dezembro', 'Fevereiro a março', 'Julho a agosto');
INSERT INTO Variedade_Permanente(variedade_id, fase_poda, fase_floracao, fase_colheita)
VALUES (23, 'Novembro a dezembro', 'Fevereiro a março', 'Julho a agosto');
INSERT INTO Variedade_Permanente(variedade_id, fase_poda, fase_floracao, fase_colheita)
VALUES (24, 'Novembro a dezembro', 'Fevereiro a março', 'Julho a agosto');
INSERT INTO Variedade_Permanente(variedade_id, fase_poda, fase_floracao, fase_colheita)
VALUES (25, 'Novembro a dezembro', 'Fevereiro a março', 'Julho a agosto');
INSERT INTO Variedade_Permanente(variedade_id, fase_poda, fase_floracao, fase_colheita)
VALUES (26, 'Novembro a dezembro', 'Fevereiro a março', 'Julho a agosto');
INSERT INTO Variedade_Permanente(variedade_id, fase_poda, fase_floracao, fase_colheita)
VALUES (27, 'Novembro a dezembro', 'Fevereiro a março', 'Julho a agosto');
INSERT INTO Variedade_Permanente(variedade_id, fase_poda, fase_floracao, fase_colheita)
VALUES (28, 'Novembro a dezembro', 'Fevereiro a março', 'Julho a agosto');
INSERT INTO Variedade_Permanente(variedade_id, fase_poda, fase_floracao, fase_colheita)
VALUES (29, 'Novembro a dezembro', 'Fevereiro a março', 'Julho a agosto');
INSERT INTO Variedade_Permanente(variedade_id, fase_poda, fase_floracao, fase_colheita)
VALUES (30, 'Novembro a dezembro', 'Fevereiro a março', 'Julho a agosto');
INSERT INTO Variedade_Permanente(variedade_id, fase_poda, fase_floracao, fase_colheita)
VALUES (31, 'Novembro a dezembro', 'Fevereiro a março', 'Julho a agosto');
INSERT INTO Variedade_Permanente(variedade_id, fase_poda, fase_floracao, fase_colheita)
VALUES (32, 'Novembro a dezembro', 'Março a abril', 'Agosto a setembro');
INSERT INTO Variedade_Permanente(variedade_id, fase_poda, fase_floracao, fase_colheita)
VALUES (33, 'Novembro a dezembro', 'Março a abril', 'Agosto a setembro');
INSERT INTO Variedade_Permanente(variedade_id, fase_poda, fase_floracao, fase_colheita)
VALUES (34, 'Novembro a dezembro', 'Março a abril', 'Agosto a setembro');
INSERT INTO Variedade_Permanente(variedade_id, fase_poda, fase_floracao, fase_colheita)
VALUES (35, 'Novembro a dezembro', 'Março a abril', 'Agosto a setembro');
INSERT INTO Variedade_Permanente(variedade_id, fase_poda, fase_floracao, fase_colheita)
VALUES (36, 'Novembro a dezembro', 'Março a abril', 'Agosto a setembro');
INSERT INTO Variedade_Permanente(variedade_id, fase_poda, fase_floracao, fase_colheita)
VALUES (37, 'Novembro a dezembro', 'Março a abril', 'Agosto a setembro');
INSERT INTO Variedade_Permanente(variedade_id, fase_poda, fase_floracao, fase_colheita)
VALUES (38, 'Novembro a dezembro', 'Março a abril', 'Agosto a setembro');
INSERT INTO Variedade_Permanente(variedade_id, fase_poda, fase_floracao, fase_colheita)
VALUES (39, 'Novembro a dezembro', 'Março a abril', 'Agosto a setembro');
INSERT INTO Variedade_Permanente(variedade_id, fase_poda, fase_floracao, fase_colheita)
VALUES (40, 'Novembro a dezembro', 'Março a abril', 'Agosto a setembro');
INSERT INTO Variedade_Permanente(variedade_id, fase_poda, fase_floracao, fase_colheita)
VALUES (41, 'Novembro a dezembro', 'Março a abril', 'Agosto a setembro');
INSERT INTO Variedade_Permanente(variedade_id, fase_poda, fase_floracao, fase_colheita)
VALUES (42, 'Novembro a dezembro', 'Março a abril', 'Agosto a setembro');
INSERT INTO Variedade_Permanente(variedade_id, fase_poda, fase_floracao, fase_colheita)
VALUES (43, 'Novembro a dezembro', 'Março a abril', 'Agosto a setembro');
INSERT INTO Variedade_Permanente(variedade_id, fase_poda, fase_floracao, fase_colheita)
VALUES (44, 'Janeiro', 'Abril a maio', 'Novembro a dezembro');
INSERT INTO Variedade_Permanente(variedade_id, fase_poda, fase_floracao, fase_colheita)
VALUES (45, 'Novembro a dezembro', 'Março a abril', 'Agosto a setembro');
INSERT INTO Variedade_Permanente(variedade_id, fase_poda, fase_floracao, fase_colheita)
VALUES (46, 'Novembro a dezembro', 'Março a abril', 'Agosto a setembro');
INSERT INTO Variedade_Permanente(variedade_id, fase_poda, fase_floracao, fase_colheita)
VALUES (47, 'Novembro a dezembro', 'Março a abril', 'Agosto a setembro');
INSERT INTO Variedade_Permanente(variedade_id, fase_poda, fase_floracao, fase_colheita)
VALUES (48, 'Novembro a dezembro', 'Março a abril', 'Agosto a setembro');
INSERT INTO Variedade_Permanente(variedade_id, fase_poda, fase_floracao, fase_colheita)
VALUES (49, 'Novembro a dezembro', 'Março a abril', 'Agosto a setembro');
INSERT INTO Variedade_Permanente(variedade_id, fase_poda, fase_floracao, fase_colheita)
VALUES (50, 'Novembro a dezembro', 'Março a abril', 'Agosto a setembro');
INSERT INTO Variedade_Permanente(variedade_id, fase_poda, fase_floracao, fase_colheita)
VALUES (51, 'Novembro a dezembro', 'Março a abril', 'Agosto a setembro');
INSERT INTO Variedade_Permanente(variedade_id, fase_poda, fase_floracao, fase_colheita)
VALUES (52, 'Novembro a dezembro', 'Março a abril', 'Agosto a setembro');
INSERT INTO Variedade_Permanente(variedade_id, fase_poda, fase_floracao, fase_colheita)
VALUES (53, 'Novembro a dezembro', 'Março a abril', 'Agosto a setembro');
INSERT INTO Variedade_Permanente(variedade_id, fase_poda, fase_floracao, fase_colheita)
VALUES (54, 'Novembro a dezembro', 'Março a abril', 'Agosto a setembro');
INSERT INTO Variedade_Permanente(variedade_id, fase_poda, fase_floracao, fase_colheita)
VALUES (55, 'Novembro a dezembro', 'Março a abril', 'Agosto a setembro');
INSERT INTO Variedade_Permanente(variedade_id, fase_poda, fase_floracao, fase_colheita)
VALUES (56, 'Novembro a dezembro', 'Março a abril', 'Agosto a setembro');
INSERT INTO Variedade_Permanente(variedade_id, fase_poda, fase_floracao, fase_colheita)
VALUES (57, 'Novembro a dezembro', 'Março a abril', 'Agosto a setembro');
INSERT INTO Variedade_Permanente(variedade_id, fase_poda, fase_floracao, fase_colheita)
VALUES (58, 'Novembro a dezembro', 'Março a abril', 'Agosto a setembro');
INSERT INTO Variedade_Permanente(variedade_id, fase_poda, fase_floracao, fase_colheita)
VALUES (59, 'Novembro a dezembro', 'Março a abril', 'Agosto a setembro');
INSERT INTO Variedade_Permanente(variedade_id, fase_poda, fase_floracao, fase_colheita)
VALUES (60, 'Novembro a dezembro', 'Março a abril', 'Agosto a setembro');
INSERT INTO Variedade_Permanente(variedade_id, fase_poda, fase_floracao, fase_colheita)
VALUES (61, 'Novembro a dezembro', 'Março a abril', 'Agosto a setembro');
INSERT INTO Variedade_Permanente(variedade_id, fase_poda, fase_floracao, fase_colheita)
VALUES (62, 'Novembro a dezembro', 'Março a abril', 'Agosto a setembro');
INSERT INTO Variedade_Permanente(variedade_id, fase_poda, fase_floracao, fase_colheita)
VALUES (63, 'Novembro a dezembro', 'Março a abril', 'Agosto a setembro');
INSERT INTO Variedade_Permanente(variedade_id, fase_poda, fase_floracao, fase_colheita)
VALUES (64, 'Novembro a dezembro', 'Março a abril', 'Agosto a setembro');
INSERT INTO Variedade_Permanente(variedade_id, fase_poda, fase_floracao, fase_colheita)
VALUES (65, 'Novembro a dezembro', 'Março a abril', 'Agosto a setembro');
INSERT INTO Variedade_Permanente(variedade_id, fase_poda, fase_floracao, fase_colheita)
VALUES (66, 'Novembro a dezembro', 'Março a abril', 'Agosto a setembro');
INSERT INTO Variedade_Permanente(variedade_id, fase_poda, fase_floracao, fase_colheita)
VALUES (67, 'Novembro a dezembro', 'Março a abril', 'Agosto a setembro');
INSERT INTO Variedade_Permanente(variedade_id, fase_poda, fase_floracao, fase_colheita)
VALUES (68, 'Novembro a dezembro', 'Março a abril', 'Agosto a setembro');
INSERT INTO Variedade_Permanente(variedade_id, fase_poda, fase_floracao, fase_colheita)
VALUES (69, null, null, null);
INSERT INTO Variedade_Permanente(variedade_id, fase_poda, fase_floracao, fase_colheita)
VALUES (70, null, null, null);
INSERT INTO Variedade_Permanente(variedade_id, fase_poda, fase_floracao, fase_colheita)
VALUES (71, null, null, null);
INSERT INTO Variedade_Permanente(variedade_id, fase_poda, fase_floracao, fase_colheita)
VALUES (72, null, null, null);
INSERT INTO Variedade_Permanente(variedade_id, fase_poda, fase_floracao, fase_colheita)
VALUES (85, null, null, 'Outubro a novembro');
INSERT INTO Variedade_Permanente(variedade_id, fase_poda, fase_floracao, fase_colheita)
VALUES (86, null, null, 'Outubro a novembro');
INSERT INTO Variedade_Permanente(variedade_id, fase_poda, fase_floracao, fase_colheita)
VALUES (87, null, null, 'Outubro a novembro');
INSERT INTO Variedade_Permanente(variedade_id, fase_poda, fase_floracao, fase_colheita)
VALUES (88, null, null, 'Outubro a novembro');
INSERT INTO Variedade_Permanente(variedade_id, fase_poda, fase_floracao, fase_colheita)
VALUES (89, null, null, 'Outubro a novembro');
INSERT INTO Variedade_Permanente(variedade_id, fase_poda, fase_floracao, fase_colheita)
VALUES (90, null, null, 'Outubro a novembro');
INSERT INTO Variedade_Permanente(variedade_id, fase_poda, fase_floracao, fase_colheita)
VALUES (91, null, null, 'Outubro a novembro');
INSERT INTO Variedade_Permanente(variedade_id, fase_poda, fase_floracao, fase_colheita)
VALUES (92, null, null, 'Outubro a novembro');
INSERT INTO Variedade_Permanente(variedade_id, fase_poda, fase_floracao, fase_colheita)
VALUES (94, 'Dezembro a janeiro', 'Maio', 'Junho a agosto');
INSERT INTO Variedade_Permanente(variedade_id, fase_poda, fase_floracao, fase_colheita)
VALUES (95, 'Dezembro a janeiro', 'Maio', 'Junho a agosto');

INSERT INTO Variedade_Temporaria(variedade_id, fase_sementeira, fase_colheita)
VALUES (73, null, '80 dias');
INSERT INTO Variedade_Temporaria(variedade_id, fase_sementeira, fase_colheita)
VALUES (74, null, '80 dias');
INSERT INTO Variedade_Temporaria(variedade_id, fase_sementeira, fase_colheita)
VALUES (75, null, '80 dias');
INSERT INTO Variedade_Temporaria(variedade_id, fase_sementeira, fase_colheita)
VALUES (76, null, '80 dias');
INSERT INTO Variedade_Temporaria(variedade_id, fase_sementeira, fase_colheita)
VALUES (77, null, '80 dias');
INSERT INTO Variedade_Temporaria(variedade_id, fase_sementeira, fase_colheita)
VALUES (78, null, '80 dias');
INSERT INTO Variedade_Temporaria(variedade_id, fase_sementeira, fase_colheita)
VALUES (79, null, '80 dias');
INSERT INTO Variedade_Temporaria(variedade_id, fase_sementeira, fase_colheita)
VALUES (80, null, null);
INSERT INTO Variedade_Temporaria(variedade_id, fase_sementeira, fase_colheita)
VALUES (81, null, null);
INSERT INTO Variedade_Temporaria(variedade_id, fase_sementeira, fase_colheita)
VALUES (82, 'Abril a junho', 'Julho a setembro');
INSERT INTO Variedade_Temporaria(variedade_id, fase_sementeira, fase_colheita)
VALUES (83, 'Abril a junho', 'Julho a setembro');
INSERT INTO Variedade_Temporaria(variedade_id, fase_sementeira, fase_colheita)
VALUES (84, 'Março a setembro', 'Junho a fevereiro');
INSERT INTO Variedade_Temporaria(variedade_id, fase_sementeira, fase_colheita)
VALUES (93, 'Fevereiro a abril, agosto a outubro', '90 dias');

-- NOVOS DADOS ----------------------------------------------------------------------------------------------

-- Abóbora manteiga, designada por Cucurbita moschata var 'Butternut'
INSERT INTO Cultura(id, nome_comum, nome_cientifico)
VALUES (12, 'Abóbora', 'Cucurbita Moschata');
INSERT INTO Variedade(id, nome, cultura_id)
VALUES (96, 'Abóbora manteiga', 12);
INSERT INTO Variedade_Temporaria(variedade_id, fase_sementeira, fase_colheita)
VALUES (96, null, null);

-- Macieira Canada, 30 un, 01/05/2019, sem data fim
INSERT INTO Variedade(id, nome, cultura_id)
VALUES (97, 'Macieira Canada', 3);
INSERT INTO Variedade_Permanente(variedade_id, fase_plantacao, fase_poda, fase_floracao, fase_colheita)
VALUES (97, NULL, NULL, NULL, NULL);

-- Macieira Grand Fay, 40 un, 01/05/2019, sem data fim
INSERT INTO Variedade(id, nome, cultura_id)
VALUES (98, 'Macieira Grand Fay', 3);
INSERT INTO Variedade_Permanente(variedade_id, fase_plantacao, fase_poda, fase_floracao, fase_colheita)
VALUES (98, NULL, NULL, NULL, NULL);

INSERT INTO PRODUTO (ID, NOME, VARIEDADE_ID)
VALUES (1, 'Abóbora Manteiga', 96);
INSERT INTO PRODUTO (ID, NOME, VARIEDADE_ID)
VALUES (2, 'Maçã Royal Gala', 48);
INSERT INTO PRODUTO (ID, NOME, VARIEDADE_ID)
VALUES (3, 'Maçã Jonagored', 41);
INSERT INTO PRODUTO (ID, NOME, VARIEDADE_ID)
VALUES (4, 'Maçã Fuji', 37);
INSERT INTO PRODUTO (ID, NOME, VARIEDADE_ID)
VALUES (5, 'Maçã Canada', 97);
INSERT INTO PRODUTO (ID, NOME, VARIEDADE_ID)
VALUES (6, 'Maçã Grand Fay', 98);
INSERT INTO PRODUTO (ID, NOME, VARIEDADE_ID)
VALUES (7, 'Maçã Pipo de Basto', 61);
INSERT INTO PRODUTO (ID, NOME, VARIEDADE_ID)
VALUES (8, 'Maçã Gronho Doce', 57);
INSERT INTO PRODUTO (ID, NOME, VARIEDADE_ID)
VALUES (9, 'Maçã Malápio', 56);
INSERT INTO PRODUTO (ID, NOME, VARIEDADE_ID)
VALUES (10, 'Maçã Porta da Loja', 44);
INSERT INTO PRODUTO (ID, NOME, VARIEDADE_ID)
VALUES (11, 'Azeitona Arbequina', 86);
INSERT INTO PRODUTO (ID, NOME, VARIEDADE_ID)
VALUES (12, 'Azeitona Picual', 89);
INSERT INTO PRODUTO (ID, NOME, VARIEDADE_ID)
VALUES (13, 'Azeitona Galega', 92);
INSERT INTO PRODUTO (ID, NOME, VARIEDADE_ID)
VALUES (14, 'Cenoura Sugarsnax Hybrid', 77);
INSERT INTO PRODUTO (ID, NOME, VARIEDADE_ID)
VALUES (15, 'Cenoura Danvers Half Long', 75);

/*INSERT INTO Cultura(id, nome_comum, nome_cientifico) VALUES (1, 'Cultura1', 'NULL');

INSERT INTO Variedade(id, nome, cultura_id) VALUES (1, 'Variedade1', 1);

INSERT INTO Parcela(id, nome, area) VALUES (1, 'Campo Novo', 1.1);

INSERT INTO Variedade_Temporaria(variedade_id, fase_sementeira, fase_colheita) VALUES (1, NULL, NULL);

INSERT INTO Variedade_Permanente(variedade_id, fase_plantacao, fase_poda, fase_floracao, fase_colheita) VALUES (1, NULL, NULL, NULL, NULL);
*/

INSERT INTO Plantacao(id, parcela_id)
VALUES (1, 101);
INSERT INTO Plantacao(id, parcela_id)
VALUES (2, 101);
INSERT INTO Plantacao(id, parcela_id)
VALUES (3, 101);
INSERT INTO Plantacao(id, parcela_id)
VALUES (4, 101);
INSERT INTO Plantacao(id, parcela_id)
VALUES (5, 103);
INSERT INTO Plantacao(id, parcela_id)
VALUES (6, 103);
INSERT INTO Plantacao(id, parcela_id)
VALUES (7, 103);
INSERT INTO Plantacao(id, parcela_id)
VALUES (8, 103);
INSERT INTO Plantacao(id, parcela_id)
VALUES (9, 103);
INSERT INTO Plantacao(id, parcela_id)
VALUES (10, 103);
INSERT INTO Plantacao(id, parcela_id)
VALUES (11, 102);
INSERT INTO Plantacao(id, parcela_id)
VALUES (12, 102);
INSERT INTO Plantacao(id, parcela_id)
VALUES (13, 106);
INSERT INTO Plantacao(id, parcela_id)
VALUES (14, 106);
INSERT INTO Plantacao(id, parcela_id)
VALUES (15, 106);
INSERT INTO Plantacao(id, parcela_id)
VALUES (16, 106);
INSERT INTO Plantacao(id, parcela_id)
VALUES (17, 106);
INSERT INTO Plantacao(id, parcela_id)
VALUES (18, 106);
INSERT INTO Plantacao(id, parcela_id)
VALUES (19, 106);
INSERT INTO Plantacao(id, parcela_id)
VALUES (20, 106);
INSERT INTO Plantacao(id, parcela_id)
VALUES (21, 106);
INSERT INTO Plantacao(id, parcela_id)
VALUES (22, 104);
INSERT INTO Plantacao(id, parcela_id)
VALUES (23, 104);
INSERT INTO Plantacao(id, parcela_id)
VALUES (24, 104);
INSERT INTO Plantacao(id, parcela_id)
VALUES (25, 104);
INSERT INTO Plantacao(id, parcela_id)
VALUES (26, 107);
INSERT INTO Plantacao(id, parcela_id)
VALUES (27, 107);

INSERT INTO Plantacao_Permanente(plantacao_id, variedade_perm_id, quantidade, data_inicio, data_fim)
VALUES (11, 92, 30, TO_DATE('06/10/2016', 'dd/mm/yyyy'), null);
INSERT INTO Plantacao_Permanente(plantacao_id, variedade_perm_id, quantidade, data_inicio, data_fim)
VALUES (12, 89, 20, TO_DATE('10/10/2016', 'dd/mm/yyyy'), null);
INSERT INTO Plantacao_Permanente(plantacao_id, variedade_perm_id, quantidade, data_inicio, data_fim)
VALUES (22, 41, 90, TO_DATE('07/01/2017', 'dd/mm/yyyy'), null);
INSERT INTO Plantacao_Permanente(plantacao_id, variedade_perm_id, quantidade, data_inicio, data_fim)
VALUES (23, 37, 60, TO_DATE('08/01/2017', 'dd/mm/yyyy'), null);
INSERT INTO Plantacao_Permanente(plantacao_id, variedade_perm_id, quantidade, data_inicio, data_fim)
VALUES (24, 48, 40, TO_DATE('08/01/2017', 'dd/mm/yyyy'), null);
INSERT INTO Plantacao_Permanente(plantacao_id, variedade_perm_id, quantidade, data_inicio, data_fim)
VALUES (25, 48, 30, TO_DATE('10/12/2018', 'dd/mm/yyyy'), null);
INSERT INTO Plantacao_Permanente(plantacao_id, variedade_perm_id, quantidade, data_inicio, data_fim)
VALUES (26, 94, 500, TO_DATE('10/01/2018', 'dd/mm/yyyy'), null);
INSERT INTO Plantacao_Permanente(plantacao_id, variedade_perm_id, quantidade, data_inicio, data_fim)
VALUES (27, 95, 700, TO_DATE('11/01/2018', 'dd/mm/yyyy'), null);

INSERT INTO Plantacao_Temporaria(plantacao_id, variedade_temp_id, area, data_início, data_fim)
VALUES (1, 80, 1.1, TO_DATE('10/10/2020', 'dd/mm/yyyy'), TO_DATE('30/03/2021', 'dd/mm/yyyy'));
INSERT INTO Plantacao_Temporaria(plantacao_id, variedade_temp_id, area, data_início, data_fim)
VALUES (2, 83, 0.9, TO_DATE('10/04/2021', 'dd/mm/yyyy'), TO_DATE('12/08/2021', 'dd/mm/yyyy'));
INSERT INTO Plantacao_Temporaria(plantacao_id, variedade_temp_id, area, data_início, data_fim)
VALUES (3, 80, 1.1, TO_DATE('03/10/2021', 'dd/mm/yyyy'), TO_DATE('05/04/2022', 'dd/mm/yyyy'));
INSERT INTO Plantacao_Temporaria(plantacao_id, variedade_temp_id, area, data_início, data_fim)
VALUES (4, 83, 0.9, TO_DATE('15/04/2022', 'dd/mm/yyyy'), TO_DATE('21/08/2022', 'dd/mm/yyyy'));
INSERT INTO Plantacao_Temporaria(plantacao_id, variedade_temp_id, area, data_início, data_fim)
VALUES (5, 82, 1.2, TO_DATE('05/04/2020', 'dd/mm/yyyy'), TO_DATE('20/08/2020', 'dd/mm/yyyy'));
INSERT INTO Plantacao_Temporaria(plantacao_id, variedade_temp_id, area, data_início, data_fim)
VALUES (6, 80, 1.3, TO_DATE('12/10/2020', 'dd/mm/yyyy'), TO_DATE('15/03/2021', 'dd/mm/yyyy'));
INSERT INTO Plantacao_Temporaria(plantacao_id, variedade_temp_id, area, data_início, data_fim)
VALUES (7, 82, 1.2, TO_DATE('03/04/2021', 'dd/mm/yyyy'), TO_DATE('25/08/2021', 'dd/mm/yyyy'));
INSERT INTO Plantacao_Temporaria(plantacao_id, variedade_temp_id, area, data_início, data_fim)
VALUES (8, 80, 1.3, TO_DATE('06/10/2021', 'dd/mm/yyyy'), TO_DATE('19/03/2022', 'dd/mm/yyyy'));
INSERT INTO Plantacao_Temporaria(plantacao_id, variedade_temp_id, area, data_início, data_fim)
VALUES (9, 82, 1.2, TO_DATE('08/04/2022', 'dd/mm/yyyy'), TO_DATE('18/08/2022', 'dd/mm/yyyy'));
INSERT INTO Plantacao_Temporaria(plantacao_id, variedade_temp_id, area, data_início, data_fim)
VALUES (10, 80, 1.3, TO_DATE('12/10/2022', 'dd/mm/yyyy'), TO_DATE('20/03/2023', 'dd/mm/yyyy'));
INSERT INTO Plantacao_Temporaria(plantacao_id, variedade_temp_id, area, data_início, data_fim)
VALUES (13, 79, 0.15, TO_DATE('10/03/2020', 'dd/mm/yyyy'), TO_DATE('15/05/2020', 'dd/mm/yyyy'));
INSERT INTO Plantacao_Temporaria(plantacao_id, variedade_temp_id, area, data_início, data_fim)
VALUES (14, 78, 0.1, TO_DATE('02/06/2020', 'dd/mm/yyyy'), TO_DATE('08/09/2020', 'dd/mm/yyyy'));
INSERT INTO Plantacao_Temporaria(plantacao_id, variedade_temp_id, area, data_início, data_fim)
VALUES (15, 93, 0.2, TO_DATE('20/09/2020', 'dd/mm/yyyy'), TO_DATE('10/01/2021', 'dd/mm/yyyy'));
INSERT INTO Plantacao_Temporaria(plantacao_id, variedade_temp_id, area, data_início, data_fim)
VALUES (16, 77, 0.15, TO_DATE('10/03/2021', 'dd/mm/yyyy'), TO_DATE('15/05/2021', 'dd/mm/yyyy'));
INSERT INTO Plantacao_Temporaria(plantacao_id, variedade_temp_id, area, data_início, data_fim)
VALUES (17, 75, 0.1, TO_DATE('02/06/2021', 'dd/mm/yyyy'), TO_DATE('08/09/2021', 'dd/mm/yyyy'));
INSERT INTO Plantacao_Temporaria(plantacao_id, variedade_temp_id, area, data_início, data_fim)
VALUES (18, 93, 0.2, TO_DATE('20/09/2021', 'dd/mm/yyyy'), TO_DATE('10/01/2022', 'dd/mm/yyyy'));
INSERT INTO Plantacao_Temporaria(plantacao_id, variedade_temp_id, area, data_início, data_fim)
VALUES (19, 77, 0.15, TO_DATE('06/03/2022', 'dd/mm/yyyy'), TO_DATE('16/05/2022', 'dd/mm/yyyy'));
INSERT INTO Plantacao_Temporaria(plantacao_id, variedade_temp_id, area, data_início, data_fim)
VALUES (20, 78, 0.15, TO_DATE('30/05/2022', 'dd/mm/yyyy'), TO_DATE('05/09/2022', 'dd/mm/yyyy'));
INSERT INTO Plantacao_Temporaria(plantacao_id, variedade_temp_id, area, data_início, data_fim)
VALUES (21, 84, 0.25, TO_DATE('20/09/2022', 'dd/mm/yyyy'), TO_DATE('14/01/2023', 'dd/mm/yyyy'));

-- NOVOS DADOS ----------------------------------------------------------------------------------------------

-- Oliveira Arbequina, 40 un, 01/05/2017, sem data fim
-- inserir em Campo Grande
INSERT INTO Plantacao(id, parcela_id)
VALUES (28, 102);
INSERT INTO Plantacao_Permanente(plantacao_id, variedade_perm_id, quantidade, data_inicio, data_fim)
VALUES (28, 86, 40, TO_DATE('01/05/2017', 'DD/MM/YYYY'), NULL);

-- Macieira Pipo de Basto, 40 un, 01/05/2019, sem data fim
-- inserir em Lameiro do Moinho
INSERT INTO Plantacao(id, parcela_id)
VALUES (29, 105);
INSERT INTO Plantacao_Permanente(plantacao_id, variedade_perm_id, quantidade, data_inicio, data_fim)
VALUES (29, 61, 40, TO_DATE('01/05/2019', 'DD/MM/YYYY'), NULL);

-- Macieira Porta da Loja, 50 un, 01/05/2019, sem data fim
-- inserir em Lameiro do Moinho
INSERT INTO Plantacao(id, parcela_id)
VALUES (30, 105);
INSERT INTO Plantacao_Permanente(plantacao_id, variedade_perm_id, quantidade, data_inicio, data_fim)
VALUES (30, 44, 50, TO_DATE('01/05/2019', 'DD/MM/YYYY'), NULL);

-- Macieira Malápio, 20 un, 01/05/2019, sem data fim
INSERT INTO Plantacao(id, parcela_id)
VALUES (31, 105);
INSERT INTO Plantacao_Permanente(plantacao_id, variedade_perm_id, quantidade, data_inicio, data_fim)
VALUES (31, 56, 20, TO_DATE('01/05/2019', 'DD/MM/YYYY'), NULL);

-- Macieira Canada, 30 un, 01/05/2019, sem data fim
INSERT INTO Plantacao(id, parcela_id)
VALUES (32, 105);
INSERT INTO Plantacao_Permanente(plantacao_id, variedade_perm_id, quantidade, data_inicio, data_fim)
VALUES (32, 97, 30, TO_DATE('01/05/2019', 'DD/MM/YYYY'), NULL);

-- Macieira Grand Fay, 40 un, 01/05/2019, sem data fim
INSERT INTO Plantacao(id, parcela_id)
VALUES (33, 105);
INSERT INTO Plantacao_Permanente(plantacao_id, variedade_perm_id, quantidade, data_inicio, data_fim)
VALUES (33, 98, 40, TO_DATE('01/05/2019', 'DD/MM/YYYY'), NULL);

-- Macieira Gronho Doce, 50 un, 01/05/2019, sem data fim
INSERT INTO Plantacao(id, parcela_id)
VALUES (34, 105);
INSERT INTO Plantacao_Permanente(plantacao_id, variedade_perm_id, quantidade, data_inicio, data_fim)
VALUES (34, 57, 50, TO_DATE('01/05/2019', 'DD/MM/YYYY'), NULL);

-- Cenoura Sugarsnax Hybrid, 05/04/2023 a 31/05/2023
INSERT INTO Plantacao(id, parcela_id)
VALUES (35, 108);
INSERT INTO Plantacao_Temporaria(plantacao_id, variedade_temp_id, area, data_início, data_fim)
VALUES (35, 77, 1, TO_DATE('05/04/2023', 'DD/MM/YYYY'), NULL);

-- Cenoura Danvers Half Long, 05/07/2023 a 08/10/2023
INSERT INTO Plantacao(id, parcela_id)
VALUES (36, 108);
INSERT INTO Plantacao_Temporaria(plantacao_id, variedade_temp_id, area, data_início, data_fim)
VALUES (36, 75, 1, TO_DATE('05/07/2023', 'DD/MM/YYYY'), NULL);

-- Abóbora Manteiga, 06/04/2023 a 10/09/2023
INSERT INTO Plantacao(id, parcela_id)
VALUES (37, 108);
INSERT INTO Plantacao_Temporaria(plantacao_id, variedade_temp_id, area, data_início, data_fim)
VALUES (37, 96, 1, TO_DATE('06/04/2023', 'DD/MM/YYYY'), NULL);

-- tabela Tipo_FP
INSERT INTO Tipo_FP(id, tipo)
VALUES (1, 'Fitofármaco');
INSERT INTO Tipo_FP(id, tipo)
VALUES (2, 'Adubo');
INSERT INTO Tipo_FP(id, tipo)
VALUES (3, 'Corretor');

-- tabela Formulacao_FP
INSERT INTO Formulacao_FP(id, tipo)
VALUES (1, 'Pó molhável');
INSERT INTO Formulacao_FP(id, tipo)
VALUES (2, 'Granulado');
INSERT INTO Formulacao_FP(id, tipo)
VALUES (3, 'Pó');
INSERT INTO Formulacao_FP(id, tipo)
VALUES (4, 'Líquido');
INSERT INTO Formulacao_FP(id, tipo)
VALUES (5, 'Emulsão de óleo em água');

-- tabela Metodo_Aplicacao
INSERT INTO Metodo_Aplicacao(id, tipo)
VALUES (1, 'Fungicida');
INSERT INTO Metodo_Aplicacao(id, tipo)
VALUES (2, 'Adubo solo');
INSERT INTO Metodo_Aplicacao(id, tipo)
VALUES (3, 'Adubo foliar');
INSERT INTO Metodo_Aplicacao(id, tipo)
VALUES (4, 'Fertirrega');
INSERT INTO Metodo_Aplicacao(id, tipo)
VALUES (5, 'Correção solo');
INSERT INTO Metodo_Aplicacao(id, tipo)
VALUES (6, 'Insecticida');
INSERT INTO Metodo_Aplicacao(id, tipo)
VALUES (7, 'Solo');
INSERT INTO Metodo_Aplicacao(id, tipo)
VALUES (8, 'Foliar');


-- tabela Composto_Quimico
INSERT INTO Composto_Quimico(id, nome)
VALUES (1, 'CU');
INSERT INTO Composto_Quimico(id, nome)
VALUES (2, 'S');
INSERT INTO Composto_Quimico(id, nome)
VALUES (3, 'K');
INSERT INTO Composto_Quimico(id, nome)
VALUES (4, 'Mg');
INSERT INTO Composto_Quimico(id, nome)
VALUES (5, 'B');
INSERT INTO Composto_Quimico(id, nome)
VALUES (6, 'Mn');
INSERT INTO Composto_Quimico(id, nome)
VALUES (7, 'CaCO3');
INSERT INTO Composto_Quimico(id, nome)
VALUES (8, 'MgCO3');
INSERT INTO Composto_Quimico(id, nome)
VALUES (9, 'MgO');
INSERT INTO Composto_Quimico(id, nome)
VALUES (10, 'Bacillus pumilus');
INSERT INTO Composto_Quimico(id, nome)
VALUES (11, 'Ácidos gordos (na forma de sais de potássio)');
INSERT INTO Composto_Quimico(id, nome)
VALUES (12, 'Terpenóides');

-- tabela Fator_Producao
INSERT INTO Fator_Producao(id, nome, tipo_id, formulacao_id)
VALUES (1, 'Calda Bordalesa ASCENZA', 1, 1);
INSERT INTO Fator_Producao(id, nome, tipo_id, formulacao_id)
VALUES (2, 'Enxofre Bayer 80 WG', 1, 1);
INSERT INTO Fator_Producao(id, nome, tipo_id, formulacao_id)
VALUES (3, 'Patentkali', 2, 2);
INSERT INTO Fator_Producao(id, nome, tipo_id, formulacao_id)
VALUES (4, 'ESTA Kieserit', 2, 2);
INSERT INTO Fator_Producao(id, nome, tipo_id, formulacao_id)
VALUES (5, 'EPSO Microtop', 2, 2);
INSERT INTO Fator_Producao(id, nome, tipo_id, formulacao_id)
VALUES (6, 'EPSO Top', 2, 2);
INSERT INTO Fator_Producao(id, nome, tipo_id, formulacao_id)
VALUES (7, 'Biocal CaCo3', 3, 2);
INSERT INTO Fator_Producao(id, nome, tipo_id, formulacao_id)
VALUES (8, 'Biocal Composto', 3, 3);
INSERT INTO Fator_Producao(id, nome, tipo_id, formulacao_id)
VALUES (9, 'Sonata', 1, 4);
INSERT INTO Fator_Producao(id, nome, tipo_id, formulacao_id)
VALUES (10, 'FLiPPER ', 1, 5);
INSERT INTO Fator_Producao(id, nome, tipo_id, formulacao_id)
VALUES (11, 'Requiem Prime', 1, 4);

-- tabela FP_Metodo_Aplicacao
INSERT INTO FP_Metodo_Aplicacao(fator_producao_id, metodo_aplicacao_id)
VALUES (1, 1);
INSERT INTO FP_Metodo_Aplicacao(fator_producao_id, metodo_aplicacao_id)
VALUES (2, 1);
INSERT INTO FP_Metodo_Aplicacao(fator_producao_id, metodo_aplicacao_id)
VALUES (3, 2);
INSERT INTO FP_Metodo_Aplicacao(fator_producao_id, metodo_aplicacao_id)
VALUES (4, 2);
INSERT INTO FP_Metodo_Aplicacao(fator_producao_id, metodo_aplicacao_id)
VALUES (5, 3);
INSERT INTO FP_Metodo_Aplicacao(fator_producao_id, metodo_aplicacao_id)
VALUES (5, 4);
INSERT INTO FP_Metodo_Aplicacao(fator_producao_id, metodo_aplicacao_id)
VALUES (6, 3);
INSERT INTO FP_Metodo_Aplicacao(fator_producao_id, metodo_aplicacao_id)
VALUES (7, 5);
INSERT INTO FP_Metodo_Aplicacao(fator_producao_id, metodo_aplicacao_id)
VALUES (8, 5);
INSERT INTO FP_Metodo_Aplicacao(fator_producao_id, metodo_aplicacao_id)
VALUES (9, 1);
INSERT INTO FP_Metodo_Aplicacao(fator_producao_id, metodo_aplicacao_id)
VALUES (10, 6);
INSERT INTO FP_Metodo_Aplicacao(fator_producao_id, metodo_aplicacao_id)
VALUES (11, 6);


-- tabela Ficha_Tecnica
INSERT INTO Ficha_Tecnica(fator_producao_id, composto_quimico_id, quantidade)
VALUES (1, 1, 0.2);
INSERT INTO Ficha_Tecnica(fator_producao_id, composto_quimico_id, quantidade)
VALUES (2, 2, 0.8);
INSERT INTO Ficha_Tecnica(fator_producao_id, composto_quimico_id, quantidade)
VALUES (3, 3, 0.249);
INSERT INTO Ficha_Tecnica(fator_producao_id, composto_quimico_id, quantidade)
VALUES (3, 4, 0.06);
INSERT INTO Ficha_Tecnica(fator_producao_id, composto_quimico_id, quantidade)
VALUES (3, 2, 0.176);
INSERT INTO Ficha_Tecnica(fator_producao_id, composto_quimico_id, quantidade)
VALUES (4, 4, 0.151);
INSERT INTO Ficha_Tecnica(fator_producao_id, composto_quimico_id, quantidade)
VALUES (4, 2, 0.208);
INSERT INTO Ficha_Tecnica(fator_producao_id, composto_quimico_id, quantidade)
VALUES (5, 4, 0.09);
INSERT INTO Ficha_Tecnica(fator_producao_id, composto_quimico_id, quantidade)
VALUES (5, 2, 0.124);
INSERT INTO Ficha_Tecnica(fator_producao_id, composto_quimico_id, quantidade)
VALUES (5, 5, 0.009);
INSERT INTO Ficha_Tecnica(fator_producao_id, composto_quimico_id, quantidade)
VALUES (5, 6, 0.01);
INSERT INTO Ficha_Tecnica(fator_producao_id, composto_quimico_id, quantidade)
VALUES (6, 4, 0.096);
INSERT INTO Ficha_Tecnica(fator_producao_id, composto_quimico_id, quantidade)
VALUES (6, 2, 0.13);
INSERT INTO Ficha_Tecnica(fator_producao_id, composto_quimico_id, quantidade)
VALUES (7, 7, 0.882);
INSERT INTO Ficha_Tecnica(fator_producao_id, composto_quimico_id, quantidade)
VALUES (7, 8, 0.019);
INSERT INTO Ficha_Tecnica(fator_producao_id, composto_quimico_id, quantidade)
VALUES (8, 7, 0.717);
INSERT INTO Ficha_Tecnica(fator_producao_id, composto_quimico_id, quantidade)
VALUES (8, 8, 0.148);
INSERT INTO Ficha_Tecnica(fator_producao_id, composto_quimico_id, quantidade)
VALUES (8, 9, 0.079);
INSERT INTO Ficha_Tecnica(fator_producao_id, composto_quimico_id, quantidade)
VALUES (9, 10, 0.9774);
INSERT INTO Ficha_Tecnica(fator_producao_id, composto_quimico_id, quantidade)
VALUES (10, 11, 0.478);
INSERT INTO Ficha_Tecnica(fator_producao_id, composto_quimico_id, quantidade)
VALUES (11, 12, 0.1442);

-- NOVOS DADOS ----------------------------------------------------------------------------------------------

--compostos químicos que faltavam em relação ao legacy
INSERT INTO Composto_Quimico(id, nome)
VALUES (13, 'N');
INSERT INTO Composto_Quimico(id, nome)
VALUES (14, 'P2O5');
INSERT INTO Composto_Quimico(id, nome)
VALUES (15, 'K2O');
INSERT INTO Composto_Quimico(id, nome)
VALUES (16, 'Ca');
INSERT INTO Composto_Quimico(id, nome)
VALUES (17, 'MgO');
INSERT INTO Composto_Quimico(id, nome)
VALUES (18, 'Materia Organica');

--Fatores de procução --tipo_id = 2: Adubo
INSERT INTO Fator_Producao(id, nome, tipo_id, formulacao_id)
VALUES (12, 'Fertimax Extrume de Cavalo', 2, 2);
INSERT INTO Fator_Producao(id, nome, tipo_id, formulacao_id)
VALUES (13, 'BIOFERTIL N6', 2, 2);

INSERT INTO FP_Metodo_Aplicacao(fator_producao_id, metodo_aplicacao_id)
VALUES (12, 7);
INSERT INTO FP_Metodo_Aplicacao(fator_producao_id, metodo_aplicacao_id)
VALUES (13, 7);

--ficha tecnica Fertimax Extrume de Cavalo
INSERT INTO Ficha_Tecnica(fator_producao_id, composto_quimico_id, quantidade)
VALUES (12, 18, 0.5);
INSERT INTO Ficha_Tecnica(fator_producao_id, composto_quimico_id, quantidade)
VALUES (12, 13, 0.03);
INSERT INTO Ficha_Tecnica(fator_producao_id, composto_quimico_id, quantidade)
VALUES (12, 14, 0.008);
INSERT INTO Ficha_Tecnica(fator_producao_id, composto_quimico_id, quantidade)
VALUES (12, 15, 0.004);
INSERT INTO Ficha_Tecnica(fator_producao_id, composto_quimico_id, quantidade)
VALUES (12, 16, 0.016);
INSERT INTO Ficha_Tecnica(fator_producao_id, composto_quimico_id, quantidade)
VALUES (12, 17, 0.003);
INSERT INTO Ficha_Tecnica(fator_producao_id, composto_quimico_id, quantidade)
VALUES (12, 5, 0.00004);

--ficha tecnica BIOFERTIL N6
INSERT INTO Ficha_Tecnica(fator_producao_id, composto_quimico_id, quantidade)
VALUES (13, 18, 0.53);
INSERT INTO Ficha_Tecnica(fator_producao_id, composto_quimico_id, quantidade)
VALUES (13, 13, 0.03);
INSERT INTO Ficha_Tecnica(fator_producao_id, composto_quimico_id, quantidade)
VALUES (13, 14, 0.025);
INSERT INTO Ficha_Tecnica(fator_producao_id, composto_quimico_id, quantidade)
VALUES (13, 15, 0.024);
INSERT INTO Ficha_Tecnica(fator_producao_id, composto_quimico_id, quantidade)
VALUES (13, 16, 0.06);
INSERT INTO Ficha_Tecnica(fator_producao_id, composto_quimico_id, quantidade)
VALUES (13, 17, 0.003);
INSERT INTO Ficha_Tecnica(fator_producao_id, composto_quimico_id, quantidade)
VALUES (13, 5, 0.000020);

/*
 Setor 10
    Início a 01/05/2017, sem data fim
    Caudal máximo: 2500 l/h
    Parcelas: Campo grande
 */

INSERT INTO Setor_Rega(id, area, caudal_maximo, data_inicio, data_fim, metodo_dispensasao_id)
VALUES (10, NULL, 2500, TO_DATE('01/05/2017', 'DD/MM/YYYY'), NULL, NULL);

-- Oliveira Galega, 30 un, 01/05/2017, sem data fim
INSERT INTO SetorRega_Plantacao(id, setor_id, plantacao_id, data_inicio, data_fim)
VALUES (1, 10, 11, TO_DATE('01/05/2017', 'DD/MM/YYYY'), NULL);

-- Oliveira Picual, 20 un, 01/05/2017, sem data fim
INSERT INTO SetorRega_Plantacao(id, setor_id, plantacao_id, data_inicio, data_fim)
VALUES (2, 10, 12, TO_DATE('01/05/2017', 'DD/MM/YYYY'), NULL);

-----------------------------------------------------------------------------------------------------------------------------------------------------

/*
Setor 11
Início a 01/05/2017, sem data fim
Caudal máximo: 1500 l/h
Parcelas: Campo grande
 */
INSERT INTO Setor_Rega(id, area, caudal_maximo, data_inicio, data_fim, metodo_dispensasao_id)
VALUES (11, NULL, 1500, TO_DATE('01/05/2017', 'DD/MM/YYYY'), NULL, NULL);

-- Oliveira Arbequina, 40 un, 01/05/2017, sem data fim
INSERT INTO SetorRega_Plantacao(id, setor_id, plantacao_id, data_inicio, data_fim)
VALUES (3, 11, 27, TO_DATE('01/05/2017', 'DD/MM/YYYY'), NULL);

-----------------------------------------------------------------------------------------------------------------------------------------------------

/*
Setor 21
Início a 01/05/2017, sem data fim
Caudal máximo: 3500 l/h
Parcelas: Lameiro da ponte, Lameiro do Moinho
 */
INSERT INTO Setor_Rega(id, area, caudal_maximo, data_inicio, data_fim, metodo_dispensasao_id)
VALUES (21, NULL, 3500, TO_DATE('01/05/2017', 'DD/MM/YYYY'), NULL, NULL);

-- Macieira Jonagored, 90 un, 01/05/2017, sem data fim
INSERT INTO SetorRega_Plantacao(id, setor_id, plantacao_id, data_inicio, data_fim)
VALUES (4, 21, 22, TO_DATE('01/05/2017', 'DD/MM/YYYY'), NULL);

-- Macieira Fuji, 60 un, 01/05/2017, sem data fim
INSERT INTO SetorRega_Plantacao(id, setor_id, plantacao_id, data_inicio, data_fim)
VALUES (5, 21, 23, TO_DATE('01/05/2017', 'DD/MM/YYYY'), NULL);

-- Macieira Royal Gala, 40 un, 01/05/2017, sem data fim
INSERT INTO SetorRega_Plantacao(id, setor_id, plantacao_id, data_inicio, data_fim)
VALUES (6, 21, 24, TO_DATE('01/05/2017', 'DD/MM/YYYY'), NULL);

-- Macieira Royal Gala, 30 un, 01/05/2019, sem data fim
INSERT INTO SetorRega_Plantacao(id, setor_id, plantacao_id, data_inicio, data_fim)
VALUES (7, 21, 25, TO_DATE('01/05/2019', 'DD/MM/YYYY'), NULL);

-- Macieira Pipo de Basto, 40 un, 01/05/2019, sem data fim
-- inserir em Lameiro do Moinho
INSERT INTO SetorRega_Plantacao(id, setor_id, plantacao_id, data_inicio, data_fim)
VALUES (8, 21, 28, TO_DATE('01/05/2019', 'DD/MM/YYYY'), NULL);

-----------------------------------------------------------------------------------------------------------------------------------------------------

/*
Setor 22
Início a 01/05/2019, sem data fim
Caudal máximo: 3500 l/h
Parcelas: Lameiro do Moinho
 */
INSERT INTO Setor_Rega(id, area, caudal_maximo, data_inicio, data_fim, metodo_dispensasao_id)
VALUES (22, NULL, 3500, TO_DATE('01/05/2019', 'DD/MM/YYYY'), NULL, NULL);

-- Macieira Porta da Loja, 50 un, 01/05/2019, sem data fim
INSERT INTO SetorRega_Plantacao(id, setor_id, plantacao_id, data_inicio, data_fim)
VALUES (9, 22, 29, TO_DATE('01/05/2019', 'DD/MM/YYYY'), NULL);

-- Macieira Malápio, 20 un, 01/05/2019, sem data fim
INSERT INTO SetorRega_Plantacao(id, setor_id, plantacao_id, data_inicio, data_fim)
VALUES (10, 22, 30, TO_DATE('01/05/2019', 'DD/MM/YYYY'), NULL);

-- Macieira Canada, 30 un, 01/05/2019, sem data fim
INSERT INTO SetorRega_Plantacao(id, setor_id, plantacao_id, data_inicio, data_fim)
VALUES (11, 22, 31, TO_DATE('01/05/2019', 'DD/MM/YYYY'), NULL);

-- Macieira Grand Fay, 40 un, 01/05/2019, sem data fim
INSERT INTO SetorRega_Plantacao(id, setor_id, plantacao_id, data_inicio, data_fim)
VALUES (12, 22, 32, TO_DATE('01/05/2019', 'DD/MM/YYYY'), NULL);

-- Macieira Gronho Doce, 50 un, 01/05/2019, sem data fim
INSERT INTO SetorRega_Plantacao(id, setor_id, plantacao_id, data_inicio, data_fim)
VALUES (13, 22, 33, TO_DATE('01/05/2019', 'DD/MM/YYYY'), NULL);

-----------------------------------------------------------------------------------------------------------------------------------------------------

/*
Setor 41
Início a 01/04/2023, 10/10/2023
Caudal máximo: 2500 l/h
Parcelas: Campo Novo
 */

INSERT INTO Setor_Rega(id, area, caudal_maximo, data_inicio, data_fim, metodo_dispensasao_id)
VALUES (41, NULL, 2500, TO_DATE('01/04/2023', 'DD/MM/YYYY'), TO_DATE('10/10/2023', 'DD/MM/YYYY'), NULL);

-- Cenoura Sugarsnax Hybrid, 05/04/2023 a 31/05/2023
INSERT INTO SetorRega_Plantacao(id, setor_id, plantacao_id, data_inicio, data_fim)
VALUES (14, 41, 34, TO_DATE('05/04/2023', 'DD/MM/YYYY'), TO_DATE('31/05/2023', 'DD/MM/YYYY'));

-- Cenoura Danvers Half Long, 05/07/2023 a 08/10/2023
INSERT INTO SetorRega_Plantacao(id, setor_id, plantacao_id, data_inicio, data_fim)
VALUES (15, 41, 35, TO_DATE('05/07/2023', 'DD/MM/YYYY'), TO_DATE('08/10/2023', 'DD/MM/YYYY'));

-----------------------------------------------------------------------------------------------------------------------------------------------------

/*
Setor 42
Início a 01/04/2023, 10/10/2023
Caudal máximo: 3500 l/h
Parcelas: Campo Novo
 */

INSERT INTO Setor_Rega(id, area, caudal_maximo, data_inicio, data_fim, metodo_dispensasao_id)
VALUES (42, NULL, 3500, TO_DATE('01/04/2023', 'DD/MM/YYYY'), TO_DATE('10/10/2023', 'DD/MM/YYYY'), NULL);

-- Abóbora Manteiga, 06/04/2023 a 10/09/2023
INSERT INTO SetorRega_Plantacao(id, setor_id, plantacao_id, data_inicio, data_fim)
VALUES (16, 42, 36, TO_DATE('06/04/2023', 'DD/MM/YYYY'), TO_DATE('10/09/2023', 'DD/MM/YYYY'));


INSERT INTO Operacao_Agricola (id, data)
VALUES (101, TO_DATE('06-10-2016', 'dd-mm-yyyy'));
INSERT INTO Op_Plantacao(operacao_id, parcela_id, variedade_id, metodo_execucao_id, quantidade)
VALUES (101, 102, 92, null, 30);
INSERT INTO Operacao_Agricola (id, data)
VALUES (102, TO_DATE('10-10-2016', 'dd-mm-yyyy'));
INSERT INTO Op_Plantacao(operacao_id, parcela_id, variedade_id, metodo_execucao_id, quantidade)
VALUES (102, 102, 89, null, 20);
INSERT INTO Operacao_Agricola (id, data)
VALUES (103, TO_DATE('07-01-2017', 'dd-mm-yyyy'));
INSERT INTO Op_Plantacao(operacao_id, parcela_id, variedade_id, metodo_execucao_id, quantidade)
VALUES (103, 104, 41, null, 90);
INSERT INTO Operacao_Agricola (id, data)
VALUES (104, TO_DATE('08-01-2017', 'dd-mm-yyyy'));
INSERT INTO Op_Plantacao(operacao_id, parcela_id, variedade_id, metodo_execucao_id, quantidade)
VALUES (104, 104, 37, null, 60);
INSERT INTO Operacao_Agricola (id, data)
VALUES (105, TO_DATE('08-01-2017', 'dd-mm-yyyy'));
INSERT INTO Op_Plantacao(operacao_id, parcela_id, variedade_id, metodo_execucao_id, quantidade)
VALUES (105, 104, 48, null, 40);



INSERT INTO Operacao_Agricola (id, data)
VALUES (113, TO_DATE('04-11-2017', 'dd-mm-yyyy'));
INSERT INTO Poda(operacao_id, parcela_id, variedade_id, quantidade, metodo_execucao_id)
VALUES (113, 102, 92, 30, null);
INSERT INTO Operacao_Agricola (id, data)
VALUES (114, TO_DATE('04-11-2017', 'dd-mm-yyyy'));
INSERT INTO Poda(operacao_id, parcela_id, variedade_id, quantidade, metodo_execucao_id)
VALUES (114, 102, 89, 20, null);
INSERT INTO Operacao_Agricola (id, data)
VALUES (115, TO_DATE('10-12-2017', 'dd-mm-yyyy'));
INSERT INTO Aplicacao_FP(operacao_id, parcela_id, variedade_id, fator_producao_id, metodo_aplicacao_id, quantidade,
                         area)
VALUES (115, 102, 92, 3, 7, 15, null);
INSERT INTO Operacao_Agricola (id, data)
VALUES (116, TO_DATE('10-12-2017', 'dd-mm-yyyy'));
INSERT INTO Aplicacao_FP(operacao_id, parcela_id, variedade_id, fator_producao_id, metodo_aplicacao_id, quantidade,
                         area)
VALUES (116, 102, 89, 3, 7, 10, null);
INSERT INTO Operacao_Agricola (id, data)
VALUES (117, TO_DATE('07-01-2018', 'dd-mm-yyyy'));
INSERT INTO Poda(operacao_id, parcela_id, variedade_id, quantidade, metodo_execucao_id)
VALUES (117, 104, 41, 90, null);
INSERT INTO Operacao_Agricola (id, data)
VALUES (118, TO_DATE('08-01-2018', 'dd-mm-yyyy'));
INSERT INTO Poda(operacao_id, parcela_id, variedade_id, quantidade, metodo_execucao_id)
VALUES (118, 104, 37, 60, null);
INSERT INTO Operacao_Agricola (id, data)
VALUES (119, TO_DATE('08-01-2018', 'dd-mm-yyyy'));
INSERT INTO Poda(operacao_id, parcela_id, variedade_id, quantidade, metodo_execucao_id)
VALUES (119, 104, 48, 40, null);
INSERT INTO Operacao_Agricola (id, data)
VALUES (120, TO_DATE('10-01-2018', 'dd-mm-yyyy'));
INSERT INTO Op_Plantacao(operacao_id, parcela_id, variedade_id, metodo_execucao_id, quantidade)
VALUES (120, 107, 94, null, 500);
INSERT INTO Operacao_Agricola (id, data)
VALUES (121, TO_DATE('11-01-2018', 'dd-mm-yyyy'));
INSERT INTO Op_Plantacao(operacao_id, parcela_id, variedade_id, metodo_execucao_id, quantidade)
VALUES (121, 107, 95, null, 700);
INSERT INTO Operacao_Agricola (id, data)
VALUES (122, TO_DATE('06-02-2018', 'dd-mm-yyyy'));
INSERT INTO Aplicacao_FP(operacao_id, parcela_id, variedade_id, fator_producao_id, metodo_aplicacao_id, quantidade,
                         area)
VALUES (122, 104, 41, 4, 7, 10, null);
INSERT INTO Operacao_Agricola (id, data)
VALUES (123, TO_DATE('06-02-2018', 'dd-mm-yyyy'));
INSERT INTO Aplicacao_FP(operacao_id, parcela_id, variedade_id, fator_producao_id, metodo_aplicacao_id, quantidade,
                         area)
VALUES (123, 104, 37, 4, 7, 6, null);
INSERT INTO Operacao_Agricola (id, data)
VALUES (124, TO_DATE('06-02-2018', 'dd-mm-yyyy'));
INSERT INTO Aplicacao_FP(operacao_id, parcela_id, variedade_id, fator_producao_id, metodo_aplicacao_id, quantidade,
                         area)
VALUES (124, 104, 48, 4, 7, 5, null);



INSERT INTO Operacao_Agricola (id, data)
VALUES (135, TO_DATE('17-11-2018', 'dd-mm-yyyy'));
INSERT INTO Poda(operacao_id, parcela_id, variedade_id, quantidade, metodo_execucao_id)
VALUES (135, 102, 92, 30, null);
INSERT INTO Operacao_Agricola (id, data)
VALUES (136, TO_DATE('17-11-2018', 'dd-mm-yyyy'));
INSERT INTO Poda(operacao_id, parcela_id, variedade_id, quantidade, metodo_execucao_id)
VALUES (136, 102, 89, 20, null);
INSERT INTO Operacao_Agricola (id, data)
VALUES (137, TO_DATE('10-12-2018', 'dd-mm-yyyy'));
INSERT INTO Op_Plantacao(operacao_id, parcela_id, variedade_id, metodo_execucao_id, quantidade)
VALUES (137, 104, 48, null, 30);
INSERT INTO Operacao_Agricola (id, data)
VALUES (138, TO_DATE('16-12-2018', 'dd-mm-yyyy'));
INSERT INTO Poda(operacao_id, parcela_id, variedade_id, quantidade, metodo_execucao_id)
VALUES (138, 107, 94, 500, null);
INSERT INTO Operacao_Agricola (id, data)
VALUES (139, TO_DATE('18-12-2018', 'dd-mm-yyyy'));
INSERT INTO Poda(operacao_id, parcela_id, variedade_id, quantidade, metodo_execucao_id)
VALUES (139, 107, 95, 700, null);
INSERT INTO Operacao_Agricola (id, data)
VALUES (140, TO_DATE('07-01-2019', 'dd-mm-yyyy'));
INSERT INTO Poda(operacao_id, parcela_id, variedade_id, quantidade, metodo_execucao_id)
VALUES (140, 104, 41, 90, null);
INSERT INTO Operacao_Agricola (id, data)
VALUES (141, TO_DATE('08-01-2019', 'dd-mm-yyyy'));
INSERT INTO Poda(operacao_id, parcela_id, variedade_id, quantidade, metodo_execucao_id)
VALUES (141, 104, 37, 60, null);
INSERT INTO Operacao_Agricola (id, data)
VALUES (142, TO_DATE('08-01-2019', 'dd-mm-yyyy'));
INSERT INTO Poda(operacao_id, parcela_id, variedade_id, quantidade, metodo_execucao_id)
VALUES (142, 104, 48, 40, null);
INSERT INTO Operacao_Agricola (id, data)
VALUES (143, TO_DATE('20-01-2019', 'dd-mm-yyyy'));
INSERT INTO Aplicacao_FP(operacao_id, parcela_id, variedade_id, fator_producao_id, metodo_aplicacao_id, quantidade,
                         area)
VALUES (143, 107, 94, 1, null, 2, null);
INSERT INTO Operacao_Agricola (id, data)
VALUES (144, TO_DATE('20-01-2019', 'dd-mm-yyyy'));
INSERT INTO Aplicacao_FP(operacao_id, parcela_id, variedade_id, fator_producao_id, metodo_aplicacao_id, quantidade,
                         area)
VALUES (144, 107, 95, 1, null, 2.5, null);
INSERT INTO Operacao_Agricola (id, data)
VALUES (145, TO_DATE('06-02-2019', 'dd-mm-yyyy'));
INSERT INTO Aplicacao_FP(operacao_id, parcela_id, variedade_id, fator_producao_id, metodo_aplicacao_id, quantidade,
                         area)
VALUES (145, 104, 41, 4, 7, 10, null);
INSERT INTO Operacao_Agricola (id, data)
VALUES (146, TO_DATE('06-02-2019', 'dd-mm-yyyy'));
INSERT INTO Aplicacao_FP(operacao_id, parcela_id, variedade_id, fator_producao_id, metodo_aplicacao_id, quantidade,
                         area)
VALUES (146, 104, 37, 4, 7, 5, null);
INSERT INTO Operacao_Agricola (id, data)
VALUES (147, TO_DATE('06-02-2019', 'dd-mm-yyyy'));
INSERT INTO Aplicacao_FP(operacao_id, parcela_id, variedade_id, fator_producao_id, metodo_aplicacao_id, quantidade,
                         area)
VALUES (147, 104, 48, 4, 7, 7, null);



INSERT INTO Operacao_Agricola (id, data)
VALUES (156, TO_DATE('15-11-2019', 'dd-mm-yyyy'));
INSERT INTO Poda(operacao_id, parcela_id, variedade_id, quantidade, metodo_execucao_id)
VALUES (156, 102, 92, 30, null);
INSERT INTO Operacao_Agricola (id, data)
VALUES (157, TO_DATE('15-11-2019', 'dd-mm-yyyy'));
INSERT INTO Poda(operacao_id, parcela_id, variedade_id, quantidade, metodo_execucao_id)
VALUES (157, 102, 89, 20, null);
INSERT INTO Operacao_Agricola (id, data)
VALUES (158, TO_DATE('16-12-2019', 'dd-mm-yyyy'));
INSERT INTO Poda(operacao_id, parcela_id, variedade_id, quantidade, metodo_execucao_id)
VALUES (158, 107, 94, 500, null);
INSERT INTO Operacao_Agricola (id, data)
VALUES (159, TO_DATE('18-12-2019', 'dd-mm-yyyy'));
INSERT INTO Poda(operacao_id, parcela_id, variedade_id, quantidade, metodo_execucao_id)
VALUES (159, 107, 95, 700, null);
INSERT INTO Operacao_Agricola (id, data)
VALUES (160, TO_DATE('20-01-2020', 'dd-mm-yyyy'));
INSERT INTO Aplicacao_FP(operacao_id, parcela_id, variedade_id, fator_producao_id, metodo_aplicacao_id, quantidade,
                         area)
VALUES (160, 107, 94, 1, null, 2, null);
INSERT INTO Operacao_Agricola (id, data)
VALUES (161, TO_DATE('20-01-2020', 'dd-mm-yyyy'));
INSERT INTO Aplicacao_FP(operacao_id, parcela_id, variedade_id, fator_producao_id, metodo_aplicacao_id, quantidade,
                         area)
VALUES (161, 107, 95, 1, null, 2.5, null);
INSERT INTO Operacao_Agricola (id, data)
VALUES (162, TO_DATE('12-03-2020', 'dd-mm-yyyy'));
INSERT INTO Operacao_Agricola (id, data)
VALUES (163, TO_DATE('30-03-2020', 'dd-mm-yyyy'));
INSERT INTO Aplicacao_FP(operacao_id, parcela_id, variedade_id, fator_producao_id, metodo_aplicacao_id, quantidade,
                         area)
VALUES (163, 103, null, 8, 7, 600, null);
INSERT INTO Operacao_Agricola (id, data)
VALUES (164, TO_DATE('05-04-2020', 'dd-mm-yyyy'));


INSERT INTO Operacao_Agricola (id, data)
VALUES (167, TO_DATE('02-06-2020', 'dd-mm-yyyy'));



INSERT INTO Operacao_Agricola (id, data)
VALUES (182, TO_DATE('20-09-2020', 'dd-mm-yyyy'));
INSERT INTO Operacao_Agricola (id, data)
VALUES (183, TO_DATE('10-10-2020', 'dd-mm-yyyy'));
INSERT INTO Operacao_Agricola (id, data)
VALUES (184, TO_DATE('12-10-2020', 'dd-mm-yyyy'));
INSERT INTO Operacao_Agricola (id, data)
VALUES (185, TO_DATE('10-11-2020', 'dd-mm-yyyy'));
INSERT INTO Poda(operacao_id, parcela_id, variedade_id, quantidade, metodo_execucao_id)
VALUES (185, 102, 92, 30, null);
INSERT INTO Operacao_Agricola (id, data)
VALUES (186, TO_DATE('10-11-2020', 'dd-mm-yyyy'));
INSERT INTO Poda(operacao_id, parcela_id, variedade_id, quantidade, metodo_execucao_id)
VALUES (186, 102, 89, 20, null);

INSERT INTO Operacao_Agricola (id, data)
VALUES (188, TO_DATE('05-12-2020', 'dd-mm-yyyy'));
INSERT INTO Poda(operacao_id, parcela_id, variedade_id, quantidade, metodo_execucao_id)
VALUES (188, 104, 48, 70, null);
INSERT INTO Operacao_Agricola (id, data)
VALUES (189, TO_DATE('05-12-2020', 'dd-mm-yyyy'));
INSERT INTO Poda(operacao_id, parcela_id, variedade_id, quantidade, metodo_execucao_id)
VALUES (189, 104, 41, 50, null);
INSERT INTO Operacao_Agricola (id, data)
VALUES (190, TO_DATE('10-12-2020', 'dd-mm-yyyy'));
INSERT INTO Aplicacao_FP(operacao_id, parcela_id, variedade_id, fator_producao_id, metodo_aplicacao_id, quantidade,
                         area)
VALUES (190, 102, 92, 3, 7, 10, null);
INSERT INTO Operacao_Agricola (id, data)
VALUES (191, TO_DATE('10-12-2020', 'dd-mm-yyyy'));
INSERT INTO Aplicacao_FP(operacao_id, parcela_id, variedade_id, fator_producao_id, metodo_aplicacao_id, quantidade,
                         area)
VALUES (191, 102, 89, 3, 7, 7, null);
INSERT INTO Operacao_Agricola (id, data)
VALUES (192, TO_DATE('15-12-2020', 'dd-mm-yyyy'));
INSERT INTO Poda(operacao_id, parcela_id, variedade_id, quantidade, metodo_execucao_id)
VALUES (192, 104, 41, 40, null);
INSERT INTO Operacao_Agricola (id, data)
VALUES (193, TO_DATE('15-12-2020', 'dd-mm-yyyy'));
INSERT INTO Poda(operacao_id, parcela_id, variedade_id, quantidade, metodo_execucao_id)
VALUES (193, 104, 37, 60, null);
INSERT INTO Operacao_Agricola (id, data)
VALUES (194, TO_DATE('16-12-2020', 'dd-mm-yyyy'));
INSERT INTO Poda(operacao_id, parcela_id, variedade_id, quantidade, metodo_execucao_id)
VALUES (194, 107, 94, 500, null);

INSERT INTO Operacao_Agricola (id, data)
VALUES (196, TO_DATE('18-12-2020', 'dd-mm-yyyy'));
INSERT INTO Poda(operacao_id, parcela_id, variedade_id, quantidade, metodo_execucao_id)
VALUES (196, 107, 95, 700, null);

INSERT INTO Operacao_Agricola (id, data)
VALUES (198, TO_DATE('20-01-2021', 'dd-mm-yyyy'));
INSERT INTO Aplicacao_FP(operacao_id, parcela_id, variedade_id, fator_producao_id, metodo_aplicacao_id, quantidade,
                         area)
VALUES (198, 107, 94, 1, null, 2, null);
INSERT INTO Operacao_Agricola (id, data)
VALUES (199, TO_DATE('20-01-2021', 'dd-mm-yyyy'));
INSERT INTO Aplicacao_FP(operacao_id, parcela_id, variedade_id, fator_producao_id, metodo_aplicacao_id, quantidade,
                         area)
VALUES (199, 107, 95, 1, null, 2.5, null);
INSERT INTO Operacao_Agricola (id, data)
VALUES (200, TO_DATE('10-03-2021', 'dd-mm-yyyy'));
INSERT INTO Operacao_Agricola (id, data)
VALUES (201, TO_DATE('14-03-2021', 'dd-mm-yyyy'));
INSERT INTO Incorporacao_Solo(operacao_id, parcela_id, variedade_id, quantidade)
VALUES (201, 103, 80, 1.3);
INSERT INTO Operacao_Agricola (id, data)
VALUES (202, TO_DATE('30-03-2021', 'dd-mm-yyyy'));
INSERT INTO Incorporacao_Solo(operacao_id, parcela_id, variedade_id, quantidade)
VALUES (202, 101, 80, 1.3);
INSERT INTO Operacao_Agricola (id, data)
VALUES (203, TO_DATE('03-04-2021', 'dd-mm-yyyy'));
INSERT INTO Operacao_Agricola (id, data)
VALUES (204, TO_DATE('15-04-2021', 'dd-mm-yyyy'));
INSERT INTO Operacao_Agricola (id, data)
VALUES (205, TO_DATE('02-05-2021', 'dd-mm-yyyy'));
INSERT INTO Aplicacao_FP(operacao_id, parcela_id, variedade_id, fator_producao_id, metodo_aplicacao_id, quantidade,
                         area)
VALUES (205, 104, null, 5, null, 10, null);


INSERT INTO Operacao_Agricola (id, data)
VALUES (208, TO_DATE('02-06-2021', 'dd-mm-yyyy'));



INSERT INTO Operacao_Agricola (id, data)
VALUES (232, TO_DATE('20-09-2021', 'dd-mm-yyyy'));

INSERT INTO Operacao_Agricola (id, data)
VALUES (234, TO_DATE('03-10-2021', 'dd-mm-yyyy'));
INSERT INTO Operacao_Agricola (id, data)
VALUES (235, TO_DATE('06-10-2021', 'dd-mm-yyyy'));



INSERT INTO Operacao_Agricola (id, data)
VALUES (241, TO_DATE('17-11-2021', 'dd-mm-yyyy'));
INSERT INTO Poda(operacao_id, parcela_id, variedade_id, quantidade, metodo_execucao_id)
VALUES (241, 102, 92, 30, null);
INSERT INTO Operacao_Agricola (id, data)
VALUES (242, TO_DATE('17-11-2021', 'dd-mm-yyyy'));
INSERT INTO Poda(operacao_id, parcela_id, variedade_id, quantidade, metodo_execucao_id)
VALUES (242, 102, 89, 20, null);
INSERT INTO Operacao_Agricola (id, data)
VALUES (243, TO_DATE('28-11-2021', 'dd-mm-yyyy'));
INSERT INTO Poda(operacao_id, parcela_id, variedade_id, quantidade, metodo_execucao_id)
VALUES (243, 104, 48, 70, null);
INSERT INTO Operacao_Agricola (id, data)
VALUES (244, TO_DATE('03-12-2021', 'dd-mm-yyyy'));
INSERT INTO Poda(operacao_id, parcela_id, variedade_id, quantidade, metodo_execucao_id)
VALUES (244, 104, 41, 90, null);
INSERT INTO Operacao_Agricola (id, data)
VALUES (245, TO_DATE('16-12-2021', 'dd-mm-yyyy'));
INSERT INTO Poda(operacao_id, parcela_id, variedade_id, quantidade, metodo_execucao_id)
VALUES (245, 107, 94, 500, null);
INSERT INTO Operacao_Agricola (id, data)
VALUES (246, TO_DATE('18-12-2021', 'dd-mm-yyyy'));
INSERT INTO Poda(operacao_id, parcela_id, variedade_id, quantidade, metodo_execucao_id)
VALUES (246, 104, 37, 60, null);

INSERT INTO Operacao_Agricola (id, data)
VALUES (248, TO_DATE('18-12-2021', 'dd-mm-yyyy'));
INSERT INTO Poda(operacao_id, parcela_id, variedade_id, quantidade, metodo_execucao_id)
VALUES (248, 107, 95, 700, null);

INSERT INTO Operacao_Agricola (id, data)
VALUES (250, TO_DATE('20-01-2022', 'dd-mm-yyyy'));
INSERT INTO Aplicacao_FP(operacao_id, parcela_id, variedade_id, fator_producao_id, metodo_aplicacao_id, quantidade,
                         area)
VALUES (250, 107, 94, 1, null, 3, null);
INSERT INTO Operacao_Agricola (id, data)
VALUES (251, TO_DATE('20-01-2022', 'dd-mm-yyyy'));
INSERT INTO Aplicacao_FP(operacao_id, parcela_id, variedade_id, fator_producao_id, metodo_aplicacao_id, quantidade,
                         area)
VALUES (251, 107, 95, 1, null, 3.5, null);
INSERT INTO Operacao_Agricola (id, data)
VALUES (252, TO_DATE('06-03-2022', 'dd-mm-yyyy'));
INSERT INTO Operacao_Agricola (id, data)
VALUES (253, TO_DATE('19-03-2022', 'dd-mm-yyyy'));
INSERT INTO Incorporacao_Solo(operacao_id, parcela_id, variedade_id, quantidade)
VALUES (253, 103, 80, 1.3);
INSERT INTO Operacao_Agricola (id, data)
VALUES (254, TO_DATE('05-04-2022', 'dd-mm-yyyy'));
INSERT INTO Incorporacao_Solo(operacao_id, parcela_id, variedade_id, quantidade)
VALUES (254, 101, 80, 1.3);
INSERT INTO Operacao_Agricola (id, data)
VALUES (255, TO_DATE('08-04-2022', 'dd-mm-yyyy'));
INSERT INTO Operacao_Agricola (id, data)
VALUES (256, TO_DATE('15-04-2022', 'dd-mm-yyyy'));

INSERT INTO Operacao_Agricola (id, data)
VALUES (258, TO_DATE('13-05-2022', 'dd-mm-yyyy'));
INSERT INTO Aplicacao_FP(operacao_id, parcela_id, variedade_id, fator_producao_id, metodo_aplicacao_id, quantidade,
                         area)
VALUES (258, 104, null, 5, null, 10, null);

INSERT INTO Operacao_Agricola (id, data)
VALUES (260, TO_DATE('30-05-2022', 'dd-mm-yyyy'));



INSERT INTO Operacao_Agricola (id, data)
VALUES (288, TO_DATE('20-09-2022', 'dd-mm-yyyy'));
INSERT INTO Operacao_Agricola (id, data)
VALUES (289, TO_DATE('12-10-2022', 'dd-mm-yyyy'));


INSERT INTO Operacao_Agricola (id, data)
VALUES (292, TO_DATE('10-11-2022', 'dd-mm-yyyy'));
INSERT INTO Poda(operacao_id, parcela_id, variedade_id, quantidade, metodo_execucao_id)
VALUES (292, 102, 92, 30, null);
INSERT INTO Operacao_Agricola (id, data)
VALUES (293, TO_DATE('10-11-2022', 'dd-mm-yyyy'));
INSERT INTO Poda(operacao_id, parcela_id, variedade_id, quantidade, metodo_execucao_id)
VALUES (293, 102, 89, 20, null);



INSERT INTO Operacao_Agricola (id, data)
VALUES (297, TO_DATE('04-12-2022', 'dd-mm-yyyy'));
INSERT INTO Poda(operacao_id, parcela_id, variedade_id, quantidade, metodo_execucao_id)
VALUES (297, 104, 48, 70, null);
INSERT INTO Operacao_Agricola (id, data)
VALUES (298, TO_DATE('07-12-2022', 'dd-mm-yyyy'));
INSERT INTO Poda(operacao_id, parcela_id, variedade_id, quantidade, metodo_execucao_id)
VALUES (298, 104, 41, 90, null);
INSERT INTO Operacao_Agricola (id, data)
VALUES (299, TO_DATE('11-12-2022', 'dd-mm-yyyy'));
INSERT INTO Aplicacao_FP(operacao_id, parcela_id, variedade_id, fator_producao_id, metodo_aplicacao_id, quantidade,
                         area)
VALUES (299, 102, 92, 3, 7, 15, null);
INSERT INTO Operacao_Agricola (id, data)
VALUES (300, TO_DATE('11-12-2022', 'dd-mm-yyyy'));
INSERT INTO Aplicacao_FP(operacao_id, parcela_id, variedade_id, fator_producao_id, metodo_aplicacao_id, quantidade,
                         area)
VALUES (300, 102, 89, 3, 7, 10, null);
INSERT INTO Operacao_Agricola (id, data)
VALUES (301, TO_DATE('16-12-2022', 'dd-mm-yyyy'));
INSERT INTO Poda(operacao_id, parcela_id, variedade_id, quantidade, metodo_execucao_id)
VALUES (301, 107, 94, 500, null);

INSERT INTO Operacao_Agricola (id, data)
VALUES (303, TO_DATE('18-12-2022', 'dd-mm-yyyy'));
INSERT INTO Poda(operacao_id, parcela_id, variedade_id, quantidade, metodo_execucao_id)
VALUES (303, 107, 95, 700, null);
INSERT INTO Operacao_Agricola (id, data)
VALUES (304, TO_DATE('12-01-2023', 'dd-mm-yyyy'));
INSERT INTO Poda(operacao_id, parcela_id, variedade_id, quantidade, metodo_execucao_id)
VALUES (304, 104, 37, 60, null);

INSERT INTO Operacao_Agricola (id, data)
VALUES (306, TO_DATE('20-01-2023', 'dd-mm-yyyy'));
INSERT INTO Aplicacao_FP(operacao_id, parcela_id, variedade_id, fator_producao_id, metodo_aplicacao_id, quantidade,
                         area)
VALUES (306, 107, 94, 1, null, 4, null);
INSERT INTO Operacao_Agricola (id, data)
VALUES (307, TO_DATE('20-01-2023', 'dd-mm-yyyy'));
INSERT INTO Aplicacao_FP(operacao_id, parcela_id, variedade_id, fator_producao_id, metodo_aplicacao_id, quantidade,
                         area)
VALUES (307, 107, 95, 1, null, 5, null);
INSERT INTO Operacao_Agricola (id, data)
VALUES (308, TO_DATE('20-03-2023', 'dd-mm-yyyy'));
INSERT INTO Incorporacao_Solo(operacao_id, parcela_id, variedade_id, quantidade)
VALUES (308, 103, 80, 1.3);



---------------------------------------------------------------------------------

-- OPERAÇOES LAMEIRO DA PONTE

-- 14/05/2023 operação de rega, setor 21, 120 min, 07:00
INSERT INTO Operacao_Agricola(id, data)
VALUES (309, to_date('14-05-2023', 'dd-mm-yyyy'));
INSERT INTO Rega(operacao_id, setor_id, duracao, hora)
VALUES (309, 21, 120, '07:00');

--01/06/2023 operação de rega, setor 21, 120 min, 07:00
INSERT INTO Operacao_Agricola(id, data)
VALUES (310, to_date('01-06-2023', 'dd-mm-yyyy'));
INSERT INTO Rega(operacao_id, setor_id, duracao, hora)
VALUES (310, 21, 120, '07:00');

--15/06/2023 operação de rega, setor 21, 120 min, 07:00
INSERT INTO Operacao_Agricola(id, data)
VALUES (311, to_date('15-06-2023', 'dd-mm-yyyy'));
INSERT INTO Rega(operacao_id, setor_id, duracao, hora)
VALUES (311, 21, 120, '07:00');

--30/06/2023 operação de rega, setor 21, 120 min, 07:00
INSERT INTO Operacao_Agricola(id, data)
VALUES (312, to_date('30-06-2023', 'dd-mm-yyyy'));
INSERT INTO Rega(operacao_id, setor_id, duracao, hora)
VALUES (312, 21, 120, '07:00');

--07/07/2023 operação de rega, setor 21, 180 min, 07:00
INSERT INTO Operacao_Agricola(id, data)
VALUES (313, to_date('07-07-2023', 'dd-mm-yyyy'));
INSERT INTO Rega(operacao_id, setor_id, duracao, hora)
VALUES (313, 21, 180, '07:00');

--14/07/2023 operação de rega, setor 21, 180 min, 22:00
INSERT INTO Operacao_Agricola(id, data)
VALUES (314, to_date('14-07-2023', 'dd-mm-yyyy'));
INSERT INTO Rega(operacao_id, setor_id, duracao, hora)
VALUES (314, 21, 180, '22:00');

--21/07/2023 operação de rega, setor 21, 180 min, 22:00
INSERT INTO Operacao_Agricola(id, data)
VALUES (315, to_date('21-07-2023', 'dd-mm-yyyy'));
INSERT INTO Rega(operacao_id, setor_id, duracao, hora)
VALUES (315, 21, 180, '22:00');

--28/07/2023 operação de rega, setor 21, 180 min, 22:00
INSERT INTO Operacao_Agricola(id, data)
VALUES (316, to_date('28-07-2023', 'dd-mm-yyyy'));
INSERT INTO Rega(operacao_id, setor_id, duracao, hora)
VALUES (316, 21, 180, '22:00');

--04/08/2023 operação de rega, setor 21, 150 min, 22:00
INSERT INTO Operacao_Agricola(id, data)
VALUES (317, to_date('04-08-2023', 'dd-mm-yyyy'));
INSERT INTO Rega(operacao_id, setor_id, duracao, hora)
VALUES (317, 21, 150, '22:00');

--11/08/2023 operação de rega, setor 21, 150 min, 22:00
INSERT INTO Operacao_Agricola(id, data)
VALUES (318, to_date('11-08-2023', 'dd-mm-yyyy'));
INSERT INTO Rega(operacao_id, setor_id, duracao, hora)
VALUES (318, 21, 150, '22:00');

--18/08/2023 operação de rega, setor 21, 150 min, 22:00
INSERT INTO Operacao_Agricola(id, data)
VALUES (319, to_date('19-08-2023', 'dd-mm-yyyy'));
INSERT INTO Rega(operacao_id, setor_id, duracao, hora)
VALUES (319, 21, 150, '22:00');

--25/08/2023 operação de rega, setor 21, 120 min, 22:00
INSERT INTO Operacao_Agricola(id, data)
VALUES (320, to_date('25-08-2023', 'dd-mm-yyyy'));
INSERT INTO Rega(operacao_id, setor_id, duracao, hora)
VALUES (320, 21, 120, '22:00');

--01/09/2023 operação de rega, setor 21, 120 min, 22:00
INSERT INTO Operacao_Agricola(id, data)
VALUES (321, to_date('01-09-2023', 'dd-mm-yyyy'));
INSERT INTO Rega(operacao_id, setor_id, duracao, hora)
VALUES (321, 21, 120, '22:00');

--08/09/2023 operação de rega, setor 21, 120 min, 22:00
INSERT INTO Operacao_Agricola(id, data)
VALUES (322, to_date('08-09-2023', 'dd-mm-yyyy'));
INSERT INTO Rega(operacao_id, setor_id, duracao, hora)
VALUES (322, 21, 120, '22:00');

--15/09/2023 operação de rega, setor 21, 120 min, 22:00
INSERT INTO Operacao_Agricola(id, data)
VALUES (323, to_date('15-09-2023', 'dd-mm-yyyy'));
INSERT INTO Rega(operacao_id, setor_id, duracao, hora)
VALUES (323, 21, 120, '22:00');

--18/08/2023 operação de colheita de maçã Royal Gala, 700 kg
-- Lameiro da Ponte
INSERT INTO Operacao_Agricola(id, data)
VALUES (324, to_date('18-08-2023', 'dd-mm-yyyy'));
INSERT INTO Colheita(operacao_id, parcela_id, produto_id, metodo_execucao_id, quantidade)
VALUES (324, 104, 2, null, 700);


--30/08/2023 operação de colheita de maçã Royal Gala, 900 kg
-- Lameiro da Ponte
INSERT INTO Operacao_Agricola(id, data)
VALUES (325, to_date('30-08-2023', 'dd-mm-yyyy'));
INSERT INTO Colheita(operacao_id, parcela_id, produto_id, metodo_execucao_id, quantidade)
VALUES (325, 104, 2, null, 900);

--05/09/2023 operação de colheita de maçã Jonagored, 900 kg
-- Lameiro da Ponte
INSERT INTO Operacao_Agricola(id, data)
VALUES (326, to_date('05-09-2023', 'dd-mm-yyyy'));
INSERT INTO Colheita(operacao_id, parcela_id, produto_id, metodo_execucao_id, quantidade)
VALUES (326, 104, 3, null, 900);

--08/09/2023 operação de colheita de maçã Jonagored, 1050 kg
-- Lameiro da Ponte
INSERT INTO Operacao_Agricola(id, data)
VALUES (327, to_date('08-09-2023', 'dd-mm-yyyy'));
INSERT INTO Colheita(operacao_id, parcela_id, produto_id, metodo_execucao_id, quantidade)
VALUES (327, 104, 3, null, 1050);

--28/09/2023 operação de colheita de maçã Fuji, 950 kg
-- Lameiro da Ponte
INSERT INTO Operacao_Agricola(id, data)
VALUES (328, to_date('28-09-2023', 'dd-mm-yyyy'));
INSERT INTO Colheita(operacao_id, parcela_id, produto_id, metodo_execucao_id, quantidade)
VALUES (328, 104, 4, null, 950);

--03/10/2023 operação de colheita de maçã Fuji, 800 kgº
-- Lameiro da Ponte
INSERT INTO Operacao_Agricola(id, data)
VALUES (329, to_date('03-10-2023', 'dd-mm-yyyy'));
INSERT INTO Colheita(operacao_id, parcela_id, produto_id, metodo_execucao_id, quantidade)
VALUES (329, 104, 4, null, 800);

---------------------------------------------------------------------------------

-- OPERAÇOES LAMEIRO DO MOINHO

-- 04/01/2019 operação de aplicação de fator de produção BIOFERTIL N6, no solo, 1.1 ha, 3200 kg
INSERT INTO OPERACAO_AGRICOLA(ID, DATA)
VALUES (330, TO_DATE('04/01/2019', 'DD/MM/YYYY'));
INSERT INTO APLICACAO_FP(OPERACAO_ID, PARCELA_ID, VARIEDADE_ID, FATOR_PRODUCAO_ID, METODO_APLICACAO_ID, QUANTIDADE,
                         AREA)
VALUES (330, 105, null, 13, 7, 3200, 1.1);

-- 09/01/2019 operação de plantação de Macieira Porta da Loja, 50 un
INSERT INTO OPERACAO_AGRICOLA(ID, DATA)
VALUES (331, TO_DATE('09/01/2019', 'DD/MM/YYYY'));
INSERT INTO OP_PLANTACAO(OPERACAO_ID, PARCELA_ID, VARIEDADE_ID, METODO_EXECUCAO_ID, QUANTIDADE)
VALUES (331, 105, 44, NULL, 50);

-- 09/01/2019 operação de plantação de Macieira Malápio, 20 un
INSERT INTO OPERACAO_AGRICOLA(ID, DATA)
VALUES (332, TO_DATE('09/01/2019', 'DD/MM/YYYY'));
INSERT INTO OP_PLANTACAO(OPERACAO_ID, PARCELA_ID, VARIEDADE_ID, METODO_EXECUCAO_ID, QUANTIDADE)
VALUES (332, 105, 56, NULL, 20);

-- 10/01/2019 operação de plantação de Macieira Pipo de Basto, 40 un
INSERT INTO OPERACAO_AGRICOLA(ID, DATA)
VALUES (333, TO_DATE('10/01/2019', 'DD/MM/YYYY'));
INSERT INTO OP_PLANTACAO(OPERACAO_ID, PARCELA_ID, VARIEDADE_ID, METODO_EXECUCAO_ID, QUANTIDADE)
VALUES (333, 105, 61, NULL, 40);

-- 10/01/2019 operação de plantação de Macieira Canada, 30 un
INSERT INTO OPERACAO_AGRICOLA(ID, DATA)
VALUES (334, TO_DATE('10/01/2019', 'DD/MM/YYYY'));
INSERT INTO OP_PLANTACAO(OPERACAO_ID, PARCELA_ID, VARIEDADE_ID, METODO_EXECUCAO_ID, QUANTIDADE)
VALUES (334, 105, 97, NULL, 30);

-- 11/01/2019 operação de plantação de Macieira Grand Fay, 40 un
INSERT INTO OPERACAO_AGRICOLA(ID, DATA)
VALUES (335, TO_DATE('11/01/2019', 'DD/MM/YYYY'));
INSERT INTO OP_PLANTACAO(OPERACAO_ID, PARCELA_ID, VARIEDADE_ID, METODO_EXECUCAO_ID, QUANTIDADE)
VALUES (335, 105, 98, NULL, 40);

-- 11/01/2019 operação de plantação de Macieira Gronho Doce, 50 un
INSERT INTO OPERACAO_AGRICOLA(ID, DATA)
VALUES (336, TO_DATE('11/01/2019', 'DD/MM/YYYY'));
INSERT INTO OP_PLANTACAO(OPERACAO_ID, PARCELA_ID, VARIEDADE_ID, METODO_EXECUCAO_ID, QUANTIDADE)
VALUES (336, 105, 57, NULL, 50);

-- 06/01/2020 operação de aplicação de fator de produção Fertimax Extrume de Cavalo, no solo, Macieira Porta da Loja, 100 kg
INSERT INTO OPERACAO_AGRICOLA(ID, DATA)
VALUES (337, TO_DATE('06/01/2020', 'DD/MM/YYYY'));
INSERT INTO APLICACAO_FP(OPERACAO_ID, PARCELA_ID, VARIEDADE_ID, FATOR_PRODUCAO_ID, METODO_APLICACAO_ID, QUANTIDADE,
                         AREA)
VALUES (337, 105, 44, 12, 7, 100, null);

-- 06/01/2020 operação de aplicação de fator de produção Fertimax Extrume de Cavalo, no solo, Macieira Malápio, 40 kg
INSERT INTO OPERACAO_AGRICOLA(ID, DATA)
VALUES (338, TO_DATE('06/01/2020', 'DD/MM/YYYY'));
INSERT INTO APLICACAO_FP(OPERACAO_ID, PARCELA_ID, VARIEDADE_ID, FATOR_PRODUCAO_ID, METODO_APLICACAO_ID, QUANTIDADE,
                         AREA)
VALUES (338, 105, 56, 12, 7, 40, null);

-- 06/01/2020 operação de aplicação de fator de produção Fertimax Extrume de Cavalo, no solo, Macieira Pipo de Basto, 80 kg
INSERT INTO OPERACAO_AGRICOLA(ID, DATA)
VALUES (339, TO_DATE('06/01/2020', 'DD/MM/YYYY'));
INSERT INTO APLICACAO_FP(OPERACAO_ID, PARCELA_ID, VARIEDADE_ID, FATOR_PRODUCAO_ID, METODO_APLICACAO_ID, QUANTIDADE,
                         AREA)
VALUES (339, 105, 61, 12, 7, 80, null);

-- 06/01/2020 operação de aplicação de fator de produção Fertimax Extrume de Cavalo, no solo, Macieira Canada, 60 kg
INSERT INTO OPERACAO_AGRICOLA(ID, DATA)
VALUES (340, TO_DATE('06/01/2020', 'DD/MM/YYYY'));
INSERT INTO APLICACAO_FP(OPERACAO_ID, PARCELA_ID, VARIEDADE_ID, FATOR_PRODUCAO_ID, METODO_APLICACAO_ID, QUANTIDADE,
                         AREA)
VALUES (340, 105, 97, 12, 7, 60, null);

-- 07/01/2020 operação de aplicação de fator de produção Fertimax Extrume de Cavalo, no solo, Macieira Grand Fay, 80 kg
INSERT INTO OPERACAO_AGRICOLA(ID, DATA)
VALUES (341, TO_DATE('07/01/2020', 'DD/MM/YYYY'));
INSERT INTO APLICACAO_FP(OPERACAO_ID, PARCELA_ID, VARIEDADE_ID, FATOR_PRODUCAO_ID, METODO_APLICACAO_ID, QUANTIDADE,
                         AREA)
VALUES (341, 105, 98, 12, 7, 80, null);

-- 07/01/2020 operação de aplicação de fator de produção Fertimax Extrume de Cavalo, no solo, Macieira Gronho Doce, 100 kg
INSERT INTO OPERACAO_AGRICOLA(ID, DATA)
VALUES (342, TO_DATE('07/01/2020', 'DD/MM/YYYY'));
INSERT INTO APLICACAO_FP(OPERACAO_ID, PARCELA_ID, VARIEDADE_ID, FATOR_PRODUCAO_ID, METODO_APLICACAO_ID, QUANTIDADE,
                         AREA)
VALUES (342, 105, 57, 12, 7, 100, null);

-- 07/01/2021 operação de aplicação de fator de produção Fertimax Extrume de Cavalo, no solo, Macieira Porta da Loja, 150 kg
INSERT INTO OPERACAO_AGRICOLA(ID, DATA)
VALUES (343, TO_DATE('07/01/2021', 'DD/MM/YYYY'));
INSERT INTO APLICACAO_FP(OPERACAO_ID, PARCELA_ID, VARIEDADE_ID, FATOR_PRODUCAO_ID, METODO_APLICACAO_ID, QUANTIDADE,
                         AREA)
VALUES (343, 105, 44, 12, 7, 150, null);

-- 07/01/2021 operação de aplicação de fator de produção Fertimax Extrume de Cavalo, no solo, Macieira Malápio, 60 kg
INSERT INTO OPERACAO_AGRICOLA(ID, DATA)
VALUES (344, TO_DATE('07/01/2021', 'DD/MM/YYYY'));
INSERT INTO APLICACAO_FP(OPERACAO_ID, PARCELA_ID, VARIEDADE_ID, FATOR_PRODUCAO_ID, METODO_APLICACAO_ID, QUANTIDADE,
                         AREA)
VALUES (344, 105, 56, 12, 7, 60, null);

-- 08/01/2021 operação de aplicação de fator de produção Fertimax Extrume de Cavalo, no solo, Macieira Pipo de Basto, 120 kg
INSERT INTO OPERACAO_AGRICOLA(ID, DATA)
VALUES (345, TO_DATE('08/01/2021', 'DD/MM/YYYY'));
INSERT INTO APLICACAO_FP(OPERACAO_ID, PARCELA_ID, VARIEDADE_ID, FATOR_PRODUCAO_ID, METODO_APLICACAO_ID, QUANTIDADE,
                         AREA)
VALUES (345, 105, 61, 12, 7, 120, null);

-- 07/01/2021 operação de aplicação de fator de produção Fertimax Extrume de Cavalo, no solo, Macieira Canada, 90 kg
INSERT INTO OPERACAO_AGRICOLA(ID, DATA)
VALUES (346, TO_DATE('07/01/2021', 'DD/MM/YYYY'));
INSERT INTO APLICACAO_FP(OPERACAO_ID, PARCELA_ID, VARIEDADE_ID, FATOR_PRODUCAO_ID, METODO_APLICACAO_ID, QUANTIDADE,
                         AREA)
VALUES (346, 105, 97, 12, 7, 90, null);

-- 07/01/2021 operação de aplicação de fator de produção Fertimax Extrume de Cavalo, no solo, Macieira Grand Fay, 120 kg
INSERT INTO OPERACAO_AGRICOLA(ID, DATA)
VALUES (347, TO_DATE('07/01/2021', 'DD/MM/YYYY'));
INSERT INTO APLICACAO_FP(OPERACAO_ID, PARCELA_ID, VARIEDADE_ID, FATOR_PRODUCAO_ID, METODO_APLICACAO_ID, QUANTIDADE,
                         AREA)
VALUES (347, 105, 98, 12, 7, 120, null);

-- 08/01/2021 operação de aplicação de fator de produção Fertimax Extrume de Cavalo, no solo, Macieira Gronho Doce, 150 kg
INSERT INTO OPERACAO_AGRICOLA(ID, DATA)
VALUES (348, TO_DATE('08/01/2021', 'DD/MM/YYYY'));
INSERT INTO APLICACAO_FP(OPERACAO_ID, PARCELA_ID, VARIEDADE_ID, FATOR_PRODUCAO_ID, METODO_APLICACAO_ID, QUANTIDADE,
                         AREA)
VALUES (348, 105, 57, 12, 7, 150, null);

-- 15/01/2022 operação de aplicação de fator de produção BIOFERTIL N6, no solo, Macieira Porta da Loja, 150 kg
INSERT INTO OPERACAO_AGRICOLA(ID, DATA)
VALUES (349, TO_DATE('15/01/2022', 'DD/MM/YYYY'));
INSERT INTO APLICACAO_FP(OPERACAO_ID, PARCELA_ID, VARIEDADE_ID, FATOR_PRODUCAO_ID, METODO_APLICACAO_ID, QUANTIDADE,
                         AREA)
VALUES (349, 105, 44, 13, 7, 150, null);

-- 15/01/2022 operação de aplicação de fator de produção BIOFERTIL N6, no solo, Macieira Malápio, 60 kg
INSERT INTO OPERACAO_AGRICOLA(ID, DATA)
VALUES (350, TO_DATE('15/01/2022', 'DD/MM/YYYY'));
INSERT INTO APLICACAO_FP(OPERACAO_ID, PARCELA_ID, VARIEDADE_ID, FATOR_PRODUCAO_ID, METODO_APLICACAO_ID, QUANTIDADE,
                         AREA)
VALUES (350, 105, 56, 13, 7, 60, null);

-- 15/01/2022 operação de aplicação de fator de produção BIOFERTIL N6, no solo, Macieira Pipo de Basto, 120 kg
INSERT INTO OPERACAO_AGRICOLA(ID, DATA)
VALUES (351, TO_DATE('15/01/2022', 'DD/MM/YYYY'));
INSERT INTO APLICACAO_FP(OPERACAO_ID, PARCELA_ID, VARIEDADE_ID, FATOR_PRODUCAO_ID, METODO_APLICACAO_ID, QUANTIDADE,
                         AREA)
VALUES (351, 105, 61, 13, 7, 120, null);

-- 16/01/2022 operação de aplicação de fator de produção BIOFERTIL N6, no solo, Macieira Canada, 90 kg
INSERT INTO OPERACAO_AGRICOLA(ID, DATA)
VALUES (352, TO_DATE('16/01/2022', 'DD/MM/YYYY'));
INSERT INTO APLICACAO_FP(OPERACAO_ID, PARCELA_ID, VARIEDADE_ID, FATOR_PRODUCAO_ID, METODO_APLICACAO_ID, QUANTIDADE,
                         AREA)
VALUES (352, 105, 97, 13, 7, 90, null);

-- 16/01/2022 operação de aplicação de fator de produção BIOFERTIL N6, no solo, Macieira Grand Fay, 120 kg
INSERT INTO OPERACAO_AGRICOLA(ID, DATA)
VALUES (353, TO_DATE('16/01/2022', 'DD/MM/YYYY'));
INSERT INTO APLICACAO_FP(OPERACAO_ID, PARCELA_ID, VARIEDADE_ID, FATOR_PRODUCAO_ID, METODO_APLICACAO_ID, QUANTIDADE,
                         AREA)
VALUES (353, 105, 98, 13, 7, 120, null);

-- 16/01/2022 operação de aplicação de fator de produção BIOFERTIL N6, no solo, Macieira Gronho Doce, 150 kg
INSERT INTO OPERACAO_AGRICOLA(ID, DATA)
VALUES (354, TO_DATE('16/01/2022', 'DD/MM/YYYY'));
INSERT INTO APLICACAO_FP(OPERACAO_ID, PARCELA_ID, VARIEDADE_ID, FATOR_PRODUCAO_ID, METODO_APLICACAO_ID, QUANTIDADE,
                         AREA)
VALUES (354, 105, 57, 13, 7, 150, null);

-- 15/05/2023 operação de aplicação de fator de produção EPSO Microtop, foliar, Macieira Porta da Loja, 5 kg
INSERT INTO OPERACAO_AGRICOLA(ID, DATA)
VALUES (355, TO_DATE('15/05/2023', 'DD/MM/YYYY'));
INSERT INTO APLICACAO_FP(OPERACAO_ID, PARCELA_ID, VARIEDADE_ID, FATOR_PRODUCAO_ID, METODO_APLICACAO_ID, QUANTIDADE,
                         AREA)
VALUES (355, 105, 44, 5, 8, 5, null);

-- 15/05/2023 operação de aplicação de fator de produção EPSO Microtop, foliar, Macieira Malápio, 2 kg
INSERT INTO OPERACAO_AGRICOLA(ID, DATA)
VALUES (356, TO_DATE('15/05/2023', 'DD/MM/YYYY'));
INSERT INTO APLICACAO_FP(OPERACAO_ID, PARCELA_ID, VARIEDADE_ID, FATOR_PRODUCAO_ID, METODO_APLICACAO_ID, QUANTIDADE,
                         AREA)
VALUES (356, 105, 56, 5, 8, 2, null);

-- 15/05/2023 operação de aplicação de fator de produção EPSO Microtop, foliar, Macieira Pipo de Basto, 4 kg
INSERT INTO OPERACAO_AGRICOLA(ID, DATA)
VALUES (357, TO_DATE('15/05/2023', 'DD/MM/YYYY'));
INSERT INTO APLICACAO_FP(OPERACAO_ID, PARCELA_ID, VARIEDADE_ID, FATOR_PRODUCAO_ID, METODO_APLICACAO_ID, QUANTIDADE,
                         AREA)
VALUES (357, 105, 61, 5, 8, 4, null);

-- 15/05/2023 operação de aplicação de fator de produção EPSO Microtop, foliar, Macieira Canada, 3 kg
INSERT INTO OPERACAO_AGRICOLA(ID, DATA)
VALUES (358, TO_DATE('15/05/2023', 'DD/MM/YYYY'));
INSERT INTO APLICACAO_FP(OPERACAO_ID, PARCELA_ID, VARIEDADE_ID, FATOR_PRODUCAO_ID, METODO_APLICACAO_ID, QUANTIDADE,
                         AREA)
VALUES (358, 105, 97, 5, 8, 3, null);

-- 15/05/2023 operação de aplicação de fator de produção EPSO Microtop, foliar, Macieira Grand Fay, 4 kg
INSERT INTO OPERACAO_AGRICOLA(ID, DATA)
VALUES (359, TO_DATE('15/05/2023', 'DD/MM/YYYY'));
INSERT INTO APLICACAO_FP(OPERACAO_ID, PARCELA_ID, VARIEDADE_ID, FATOR_PRODUCAO_ID, METODO_APLICACAO_ID, QUANTIDADE,
                         AREA)
VALUES (359, 105, 98, 5, 8, 4, null);

-- 15/05/2023 operação de aplicação de fator de produção EPSO Microtop, foliar, Macieira Gronho Doce, 5 kg
INSERT INTO OPERACAO_AGRICOLA(ID, DATA)
VALUES (360, TO_DATE('15/05/2023', 'DD/MM/YYYY'));
INSERT INTO APLICACAO_FP(OPERACAO_ID, PARCELA_ID, VARIEDADE_ID, FATOR_PRODUCAO_ID, METODO_APLICACAO_ID, QUANTIDADE,
                         AREA)
VALUES (360, 105, 57, 5, 8, 5, null);


-- 15/09/2023 operação de colheita de maçã Canada, 700 kg
INSERT INTO OPERACAO_AGRICOLA(ID, DATA)
VALUES (361, TO_DATE('15/09/2023', 'DD/MM/YYYY'));
INSERT INTO COLHEITA(OPERACAO_ID, PARCELA_ID, PRODUTO_ID, METODO_EXECUCAO_ID, QUANTIDADE)
VALUES (361, 105, 5, NULL, 700);

-- 16/09/2023 operação de colheita de maçã Grand Fay, 600 kg
INSERT INTO OPERACAO_AGRICOLA(ID, DATA)
VALUES (362, TO_DATE('16/09/2023', 'DD/MM/YYYY'));
INSERT INTO COLHEITA(OPERACAO_ID, PARCELA_ID, PRODUTO_ID, METODO_EXECUCAO_ID, QUANTIDADE)
VALUES (362, 105, 6, NULL, 600);

-- 20/09/2023 operação de colheita de maçã Grand Fay, 700 kg
INSERT INTO OPERACAO_AGRICOLA(ID, DATA)
VALUES (363, TO_DATE('20/09/2023', 'DD/MM/YYYY'));
INSERT INTO COLHEITA(OPERACAO_ID, PARCELA_ID, PRODUTO_ID, METODO_EXECUCAO_ID, QUANTIDADE)
VALUES (363, 105, 6, NULL, 700);

-- 27/09/2023 operação de colheita de maçã Pipo de Basto, 600 kg
INSERT INTO OPERACAO_AGRICOLA(ID, DATA)
VALUES (364, TO_DATE('27/09/2023', 'DD/MM/YYYY'));
INSERT INTO COLHEITA(OPERACAO_ID, PARCELA_ID, PRODUTO_ID, METODO_EXECUCAO_ID, QUANTIDADE)
VALUES (364, 105, 7, NULL, 600);

-- 05/10/2023 operação de colheita de maçã Pipo de Basto, 700 kg
INSERT INTO OPERACAO_AGRICOLA(ID, DATA)
VALUES (365, TO_DATE('05/10/2023', 'DD/MM/YYYY'));
INSERT INTO COLHEITA(OPERACAO_ID, PARCELA_ID, PRODUTO_ID, METODO_EXECUCAO_ID, QUANTIDADE)
VALUES (365, 105, 7, NULL, 700);

-- 15/10/2023 operação de colheita de maçã Gronho Doce, 1200 kg
INSERT INTO OPERACAO_AGRICOLA(ID, DATA)
VALUES (366, TO_DATE('15/10/2023', 'DD/MM/YYYY'));
INSERT INTO COLHEITA(OPERACAO_ID, PARCELA_ID, PRODUTO_ID, METODO_EXECUCAO_ID, QUANTIDADE)
VALUES (366, 105, 8, NULL, 1200);

-- 15/10/2023 operação de colheita de maçã Malápio, 700 kg
INSERT INTO OPERACAO_AGRICOLA(ID, DATA)
VALUES (367, TO_DATE('15/10/2023', 'DD/MM/YYYY'));
INSERT INTO COLHEITA(OPERACAO_ID, PARCELA_ID, PRODUTO_ID, METODO_EXECUCAO_ID, QUANTIDADE)
VALUES (367, 105, 9, NULL, 700);

-- 12/11/2023 operação de colheita de maçã Porta da Loja, 700 kg
INSERT INTO OPERACAO_AGRICOLA(ID, DATA)
VALUES (368, TO_DATE('12/11/2023', 'DD/MM/YYYY'));
INSERT INTO COLHEITA(OPERACAO_ID, PARCELA_ID, PRODUTO_ID, METODO_EXECUCAO_ID, QUANTIDADE)
VALUES (368, 105, 10, NULL, 700);

-- 15/11/2023 operação de colheita de maçã Porta da Loja, 800 kg
INSERT INTO OPERACAO_AGRICOLA(ID, DATA)
VALUES (369, TO_DATE('15/11/2023', 'DD/MM/YYYY'));
INSERT INTO COLHEITA(OPERACAO_ID, PARCELA_ID, PRODUTO_ID, METODO_EXECUCAO_ID, QUANTIDADE)
VALUES (369, 105, 10, NULL, 800);


-- 13/05/2023 operação de rega, setor 22, 120 min, 23:00
INSERT INTO OPERACAO_AGRICOLA(ID, DATA)
VALUES (370, TO_DATE('13/05/2023', 'DD/MM/YYYY'));
INSERT INTO Rega(operacao_id, setor_id, duracao, hora)
VALUES (370, 22, 120, '23:00');

-- 02/06/2023 operação de rega, setor 22, 120 min, 23:00
INSERT INTO OPERACAO_AGRICOLA(ID, DATA)
VALUES (371, TO_DATE('02/06/2023', 'DD/MM/YYYY'));
INSERT INTO Rega(operacao_id, setor_id, duracao, hora)
VALUES (371, 22, 120, '23:00');

-- 16/06/2023 operação de rega, setor 22, 120 min, 23:00
INSERT INTO OPERACAO_AGRICOLA(ID, DATA)
VALUES (372, TO_DATE('16/06/2023', 'DD/MM/YYYY'));
INSERT INTO Rega(operacao_id, setor_id, duracao, hora)
VALUES (372, 22, 120, '23:00');

-- 01/07/2023 operação de rega, setor 22, 120 min, 23:00
INSERT INTO OPERACAO_AGRICOLA(ID, DATA)
VALUES (373, TO_DATE('01/07/2023', 'DD/MM/YYYY'));
INSERT INTO Rega(operacao_id, setor_id, duracao, hora)
VALUES (373, 22, 120, '23:00');

-- 08/07/2023 operação de rega, setor 22, 180 min, 23:00
INSERT INTO OPERACAO_AGRICOLA(ID, DATA)
VALUES (375, TO_DATE('08/07/2023', 'DD/MM/YYYY'));
INSERT INTO Rega(operacao_id, setor_id, duracao, hora)
VALUES (375, 22, 180, '23:00');

-- 15/07/2023 operação de rega, setor 22, 180 min, 23:00
INSERT INTO OPERACAO_AGRICOLA(ID, DATA)
VALUES (376, TO_DATE('15/07/2023', 'DD/MM/YYYY'));
INSERT INTO Rega(operacao_id, setor_id, duracao, hora)
VALUES (376, 22, 180, '23:00');

-- 22/07/2023 operação de rega, setor 22, 180 min, 23:00
INSERT INTO OPERACAO_AGRICOLA(ID, DATA)
VALUES (377, TO_DATE('22/07/2023', 'DD/MM/YYYY'));
INSERT INTO Rega(operacao_id, setor_id, duracao, hora)
VALUES (377, 22, 180, '23:00');

-- 29/07/2023 operação de rega, setor 22, 180 min, 23:00
INSERT INTO OPERACAO_AGRICOLA(ID, DATA)
VALUES (378, TO_DATE('29/07/2023', 'DD/MM/YYYY'));
INSERT INTO Rega(operacao_id, setor_id, duracao, hora)
VALUES (378, 22, 180, '23:00');

-- 05/08/2023 operação de rega, setor 22, 150 min, 23:00
INSERT INTO OPERACAO_AGRICOLA(ID, DATA)
VALUES (379, TO_DATE('05/08/2023', 'DD/MM/YYYY'));
INSERT INTO Rega(operacao_id, setor_id, duracao, hora)
VALUES (379, 22, 150, '23:00');

-- 10/08/2023 operação de rega, setor 22, 150 min, 23:00
INSERT INTO OPERACAO_AGRICOLA(ID, DATA)
VALUES (380, TO_DATE('10/08/2023', 'DD/MM/YYYY'));
INSERT INTO Rega(operacao_id, setor_id, duracao, hora)
VALUES (380, 22, 150, '23:00');

-- 17/08/2023 operação de rega, setor 22, 150 min, 23:00
INSERT INTO OPERACAO_AGRICOLA(ID, DATA)
VALUES (381, TO_DATE('17/08/2023', 'DD/MM/YYYY'));
INSERT INTO Rega(operacao_id, setor_id, duracao, hora)
VALUES (381, 22, 150, '23:00');

-- 24/08/2023 operação de rega, setor 22, 120 min, 23:00
INSERT INTO OPERACAO_AGRICOLA(ID, DATA)
VALUES (382, TO_DATE('24/08/2023', 'DD/MM/YYYY'));
INSERT INTO Rega(operacao_id, setor_id, duracao, hora)
VALUES (382, 22, 120, '23:00');

-- 02/09/2023 operação de rega, setor 22, 120 min, 23:00
INSERT INTO OPERACAO_AGRICOLA(ID, DATA)
VALUES (383, TO_DATE('02/09/2023', 'DD/MM/YYYY'));
INSERT INTO Rega(operacao_id, setor_id, duracao, hora)
VALUES (383, 22, 120, '23:00');

-- 09/09/2023 operação de rega, setor 22, 120 min, 23:00
INSERT INTO OPERACAO_AGRICOLA(ID, DATA)
VALUES (384, TO_DATE('09/09/2023', 'DD/MM/YYYY'));
INSERT INTO Rega(operacao_id, setor_id, duracao, hora)
VALUES (384, 22, 120, '23:00');

-- 18/09/2023 operação de rega, setor 22, 120 min, 23:00
INSERT INTO OPERACAO_AGRICOLA(ID, DATA)
VALUES (385, TO_DATE('18/09/2023', 'DD/MM/YYYY'));
INSERT INTO Rega(operacao_id, setor_id, duracao, hora)
VALUES (385, 22, 120, '23:00');

---------------------------------------------------------------------------------

-- OPERAÇOES CAMPO GRANDE

-- 12/10/2016 operação de plantação de Oliveira Arbequina, 40 un
INSERT INTO Operacao_Agricola(id, data)
VALUES (386, TO_DATE('2016-10-12', 'YYYY-MM-DD'));
INSERT INTO Op_Plantacao(operacao_id, parcela_id, VARIEDADE_ID, quantidade)
values (386, 102, 86, 40);

-- 13/01/2021 operação de aplicação de fator de produção BIOFERTIL N6, Oliveira Picual, 120 kg
INSERT INTO Operacao_Agricola(id, data)
VALUES (387, TO_DATE('2021-01-13', 'YYYY-MM-DD'));
INSERT INTO Aplicacao_FP(operacao_id, parcela_id, variedade_id, fator_producao_id, metodo_aplicacao_id, quantidade,
                         area)
VALUES (387, 102, 89, 13, null, 120, null);

-- 12/01/2021 operação de aplicação de fator de produção BIOFERTIL N6, Oliveira Galega, 180 kg
INSERT INTO Operacao_Agricola(id, data)
VALUES (388, TO_DATE('2021-01-12', 'YYYY-MM-DD'));
INSERT INTO Aplicacao_FP(operacao_id, parcela_id, variedade_id, fator_producao_id, metodo_aplicacao_id, quantidade,
                         area)
VALUES (388, 102, 92, 13, null, 180, null);

-- 12/01/2021 operação de aplicação de fator de produção BIOFERTIL N6, Oliveira Arbequina, 240 kg
INSERT INTO Operacao_Agricola(id, data)
VALUES (389, TO_DATE('2021-01-12', 'YYYY-MM-DD'));
INSERT INTO Aplicacao_FP(operacao_id, parcela_id, variedade_id, fator_producao_id, metodo_aplicacao_id, quantidade,
                         area)
VALUES (389, 102, 86, 13, null, 240, null);

-- 12/01/2022 operação de aplicação de fator de produção BIOFERTIL N6, Oliveira Picual, 120 kg
INSERT INTO Operacao_Agricola(id, data)
VALUES (390, TO_DATE('2022-01-12', 'YYYY-MM-DD'));
INSERT INTO Aplicacao_FP(operacao_id, parcela_id, variedade_id, fator_producao_id, metodo_aplicacao_id, quantidade,
                         area)
VALUES (390, 102, 89, 13, null, 120, null);

-- 12/01/2022 operação de aplicação de fator de produção BIOFERTIL N6, Oliveira Galega, 180 kg
INSERT INTO Operacao_Agricola(id, data)
VALUES (391, TO_DATE('2022-01-12', 'YYYY-MM-DD'));
INSERT INTO Aplicacao_FP(operacao_id, parcela_id, variedade_id, fator_producao_id, metodo_aplicacao_id, quantidade,
                         area)
VALUES (391, 102, 92, 13, null, 180, null);

-- 13/01/2022 operação de aplicação de fator de produção BIOFERTIL N6, Oliveira Arbequina, 240 kg
INSERT INTO Operacao_Agricola(id, data)
VALUES (392, TO_DATE('2022-01-13', 'YYYY-MM-DD'));
INSERT INTO Aplicacao_FP(operacao_id, parcela_id, variedade_id, fator_producao_id, metodo_aplicacao_id, quantidade,
                         area)
VALUES (392, 102, 86, 13, null, 240, null);

-- 12/01/2023 operação de aplicação de fator de produção BIOFERTIL N6, Oliveira Picual, 120 kg
INSERT INTO Operacao_Agricola(id, data)
VALUES (393, TO_DATE('2023-01-12', 'YYYY-MM-DD'));
INSERT INTO Aplicacao_FP(operacao_id, parcela_id, variedade_id, fator_producao_id, metodo_aplicacao_id, quantidade,
                         area)
VALUES (393, 102, 89, 13, null, 120, null);

-- 12/01/2023 operação de aplicação de fator de produção BIOFERTIL N6, Oliveira Galega, 180 kg
INSERT INTO Operacao_Agricola(id, data)
VALUES (394, TO_DATE('2023-01-12', 'YYYY-MM-DD'));
INSERT INTO Aplicacao_FP(operacao_id, parcela_id, variedade_id, fator_producao_id, metodo_aplicacao_id, quantidade,
                         area)
VALUES (394, 102, 92, 13, null, 180, null);

-- 12/01/2023 operação de aplicação de fator de produção BIOFERTIL N6, Oliveira Arbequina, 240 kg
INSERT INTO Operacao_Agricola(id, data)
VALUES (395, TO_DATE('2023-01-12', 'YYYY-MM-DD'));
INSERT INTO Aplicacao_FP(operacao_id, parcela_id, variedade_id, fator_producao_id, metodo_aplicacao_id, quantidade,
                         area)
VALUES (395, 102, 86, 13, null, 240, null);
--
-- 02/11/2023 operação de colheita de azeitona Arbequina, 400 kg
INSERT INTO Operacao_Agricola(id, data)
VALUES (396, TO_DATE('2023-11-02', 'YYYY-MM-DD'));
INSERT INTO Colheita(operacao_id, parcela_id, produto_id, quantidade)
values (396, 102, 11, 400);

-- 05/11/2023 operação de colheita de azeitona Picual, 300 kg
INSERT INTO Operacao_Agricola(id, data)
VALUES (397, TO_DATE('2023-11-05', 'YYYY-MM-DD'));
INSERT INTO Colheita(operacao_id, parcela_id, produto_id, quantidade)
values (397, 102, 12, 300);

-- 08/11/2023 operação de colheita de azeitona Galega, 350 kg
INSERT INTO Operacao_Agricola(id, data)
VALUES (398, TO_DATE('2023-11-08', 'YYYY-MM-DD'));
INSERT INTO Colheita(operacao_id, parcela_id, produto_id, quantidade)
values (398, 102, 13, 350);
--
-- 02/06/2023 operação de rega, setor 10, 60 min, 06:00
INSERT INTO Operacao_Agricola(id, data)
VALUES (399, TO_DATE('2023-06-02', 'YYYY-MM-DD'));
INSERT INTO Rega(operacao_id, setor_id, duracao, hora)
VALUES (399, 10, 60, '06:00');

-- 02/07/2023 operação de rega, setor 10, 120 min, 06:00
INSERT INTO Operacao_Agricola(id, data)
VALUES (400, TO_DATE('2023-07-02', 'YYYY-MM-DD'));
INSERT INTO Rega(operacao_id, setor_id, duracao, hora)
VALUES (400, 10, 120, '06:00');

-- 02/08/2023 operação de rega, setor 10, 180 min, 05:00
INSERT INTO Operacao_Agricola(id, data)
VALUES (401, TO_DATE('2023-08-02', 'YYYY-MM-DD'));
INSERT INTO Rega(operacao_id, setor_id, duracao, hora)
VALUES (401, 10, 180, '05:00');

-- 04/09/2023 operação de rega, setor 10, 120 min, 06:00
INSERT INTO Operacao_Agricola(id, data)
VALUES (402, TO_DATE('2023-09-04', 'YYYY-MM-DD'));
INSERT INTO Rega(operacao_id, setor_id, duracao, hora)
VALUES (402, 10, 120, '06:00');

-- 02/10/2023 operação de rega, setor 10, 60 min, 06:00
INSERT INTO Operacao_Agricola(id, data)
VALUES (403, TO_DATE('2023-10-02', 'YYYY-MM-DD'));
INSERT INTO Rega(operacao_id, setor_id, duracao, hora)
VALUES (403, 10, 60, '06:00');

---------------------------------------------------------------------------------

-- OPERAÇOES CAMPO NOVO

-- 01/04/2023 operação de aplicação de fator de produção Biocal Composto, no solo, 1.1 ha, 500 kg
INSERT INTO Operacao_Agricola(id, data)
VALUES (404, TO_DATE('01/04/2023', 'DD/MM/YYYY'));
INSERT INTO Aplicacao_FP(operacao_id, parcela_id, variedade_id, fator_producao_id, metodo_aplicacao_id, quantidade,
                         area)
VALUES (404, 108, null, 8, 7, 500, 1.1);


-- 05/04/2023 operação de semeadura de cenouras Sugarsnax Hybrid, 0.5 ha, 1.2 kg
INSERT INTO Operacao_Agricola(id, data)
VALUES (405, TO_DATE('05/04/2023', 'DD/MM/YYYY'));
INSERT INTO Sementeira(operacao_id, parcela_id, variedade_id, quantidade, area, metodo_execucao_id)
VALUES (405, 108, 77, 1.2, 0.5, null);


-- 06/04/2023 operação de semeadura de abóbora manteiga, 0.6 ha, 1.5 kg
INSERT INTO Operacao_Agricola(id, data)
VALUES (406, TO_DATE('06/04/2023', 'DD/MM/YYYY'));
INSERT INTO Sementeira(operacao_id, parcela_id, variedade_id, quantidade, area, metodo_execucao_id)
VALUES (406, 108, 96, 1.5, 0.6, null);

-- 08/05/2023 operação de monda de plantação de cenouras Sugarsnax Hybrid, 0.5 ha
INSERT INTO Operacao_Agricola(id, data)
VALUES (407, TO_DATE('08/05/2023', 'DD/MM/YYYY'));
INSERT INTO Monda(operacao_id, parcela_id, variedade_id, quantidade, metodo_execucao_id, fator_producao_id)
VALUES (407, 108, 77, 0.5, null, null);

-- 20/05/2023 operação de monda de plantação de abóbora manteiga, 0.6 ha
INSERT INTO Operacao_Agricola(id, data)
VALUES (408, TO_DATE('20/05/2023', 'DD/MM/YYYY'));
INSERT INTO Monda(operacao_id, parcela_id, variedade_id, quantidade, metodo_execucao_id, fator_producao_id)
VALUES (408, 108, 96, 0.6, null, null);

-- 14/06/2023 operação de colheita de cenouras Sugarsnax Hybrid, 1500 kg
INSERT INTO Operacao_Agricola(id, data)
VALUES (409, TO_DATE('14/06/2023', 'DD/MM/YYYY'));
INSERT INTO Colheita(operacao_id, parcela_id, produto_id, metodo_execucao_id, quantidade)
values (409, 108, 14, null, 1500);

-- 20/06/2023 operação de monda de plantação de abóbora manteiga, 0.6 ha
INSERT INTO Operacao_Agricola(id, data)
VALUES (410, TO_DATE('20/06/2023', 'DD/MM/YYYY'));
INSERT INTO Monda(operacao_id, parcela_id, variedade_id, quantidade, metodo_execucao_id, fator_producao_id)
VALUES (410, 108, 96, 0.6, null, null);

-- 28/06/2023 operação de colheita de cenouras Sugarsnax Hybrid, 2500 kg
INSERT INTO Operacao_Agricola(id, data)
VALUES (411, TO_DATE('28/06/2023', 'DD/MM/YYYY'));
INSERT INTO Colheita(operacao_id, parcela_id, produto_id, metodo_execucao_id, quantidade)
values (411, 108, 14, null, 2500);

-- 03/07/2023 operação de aplicação de fator de produção Fertimax Extrume de Cavalo, no solo, 0.5 ha, 1800 kg
INSERT INTO Operacao_Agricola(id, data)
VALUES (412, TO_DATE('03/07/2023', 'DD/MM/YYYY'));
INSERT INTO Aplicacao_FP(operacao_id, parcela_id, variedade_id, fator_producao_id, metodo_aplicacao_id, quantidade,
                         area)
VALUES (412, 108, null, 12, 7, 1800, 0.5);


-- 04/07/2023 operação de mobilização do solo, 0.5 ha
INSERT INTO Operacao_Agricola(id, data)
VALUES (413, TO_DATE('04/07/2023', 'DD/MM/YYYY'));
INSERT INTO Mobilizacao_Solo(operacao_id, parcela_id, area)
VALUES (413, 108, 0.5);


-- 05/07/2023 operação de semeadura de cenouras Danvers Half Long, 0.5 ha, 1.2 kg
INSERT INTO Operacao_Agricola(id, data)
VALUES (414, TO_DATE('05/07/2023', 'DD/MM/YYYY'));
INSERT INTO Sementeira(operacao_id, parcela_id, variedade_id, quantidade, area, metodo_execucao_id)
VALUES (414, 108, 75, 1.2, 0.5, null);

-- 08/08/2023 operação de monda de plantação de cenouras Danvers Half Long, 0.5 ha
INSERT INTO Operacao_Agricola(id, data)
VALUES (415, TO_DATE('08/08/2023', 'DD/MM/YYYY'));
INSERT INTO Monda(operacao_id, parcela_id, variedade_id, quantidade, metodo_execucao_id, fator_producao_id)
VALUES (415, 108, 75, 0.5, null, null);

-- 15/09/2023 operação de colheita de abóbora manteiga, 8000 kg
INSERT INTO Operacao_Agricola(id, data)
VALUES (416, TO_DATE('15/09/2023', 'DD/MM/YYYY'));
INSERT INTO Colheita(operacao_id, parcela_id, produto_id, metodo_execucao_id, quantidade)
values (416, 108, 1, null, 8000);

-- 25/09/2023 operação de colheita de abóbora manteiga, 5000 kg
INSERT INTO Operacao_Agricola(id, data)
VALUES (417, TO_DATE('25/09/2023', 'DD/MM/YYYY'));
INSERT INTO Colheita(operacao_id, parcela_id, produto_id, metodo_execucao_id, quantidade)
values (417, 108, 1, null, 5000);

-- 18/09/2023 operação de colheita de cenouras Danvers Half Long, 900 kg
INSERT INTO Operacao_Agricola(id, data)
VALUES (418, TO_DATE('18/09/2023', 'DD/MM/YYYY'));
INSERT INTO Colheita(operacao_id, parcela_id, produto_id, metodo_execucao_id, quantidade)
values (418, 108, 15, null, 900);

-- 22/09/2023 operação de colheita de cenouras Danvers Half Long, 1500 kg
INSERT INTO Operacao_Agricola(id, data)
VALUES (419, TO_DATE('22/09/2023', 'DD/MM/YYYY'));
INSERT INTO Colheita(operacao_id, parcela_id, produto_id, metodo_execucao_id, quantidade)
values (419, 108, 15, null, 1500);

-- 05/10/2023 operação de colheita de cenouras Danvers Half Long, 1200 kg
INSERT INTO Operacao_Agricola(id, data)
VALUES (420, TO_DATE('05/10/2023', 'DD/MM/YYYY'));
INSERT INTO Colheita(operacao_id, parcela_id, produto_id, metodo_execucao_id, quantidade)
values (420, 108, 15, null, 1200);

-- 10/10/2023 operação de mobilização do solo, 1.1 ha
INSERT INTO Operacao_Agricola(id, data)
VALUES (421, TO_DATE('10/10/2023', 'DD/MM/YYYY'));
INSERT INTO Mobilizacao_Solo(operacao_id, parcela_id, area)
VALUES (421, 108, 1.1);

-- 12/10/2023 operação de semeadura de Tremoço Amarelo, 1.1 ha, 32 kg
INSERT INTO Operacao_Agricola(id, data)
VALUES (422, TO_DATE('12/10/2023', 'DD/MM/YYYY'));
INSERT INTO Sementeira(operacao_id, parcela_id, variedade_id, quantidade, area, metodo_execucao_id)
VALUES (422, 108, 80, 32, 1.1, null);


-- 12/06/2023 operação de rega, setor 42, 60 min, 06:00
INSERT INTO Operacao_Agricola(id, data)
VALUES (423, TO_DATE('12/06/2023', 'DD/MM/YYYY'));
INSERT INTO Rega(operacao_id, setor_id, duracao, hora)
VALUES (423, 42, 60, '06:00');

-- 19/06/2023 operação de rega, setor 42, 60 min, 06:00
INSERT INTO Operacao_Agricola(id, data)
VALUES (424, TO_DATE('19/06/2023', 'DD/MM/YYYY'));
INSERT INTO Rega(operacao_id, setor_id, duracao, hora)
VALUES (424, 42, 60, '06:00');

-- 30/06/2023 operação de rega, setor 42, 120 min, 04:00
INSERT INTO Operacao_Agricola(id, data)
VALUES (425, TO_DATE('30/06/2023', 'DD/MM/YYYY'));
INSERT INTO Rega(operacao_id, setor_id, duracao, hora)
VALUES (425, 42, 120, '04:00');

-- 08/07/2023 operação de rega, setor 42, 120 min, 04:00
INSERT INTO Operacao_Agricola(id, data)
VALUES (426, TO_DATE('08/07/2023', 'DD/MM/YYYY'));
INSERT INTO Rega(operacao_id, setor_id, duracao, hora)
VALUES (426, 42, 120, '04:00');

-- 15/07/2023 operação de rega, setor 42, 120 min, 04:00
INSERT INTO Operacao_Agricola(id, data)
VALUES (427, TO_DATE('15/07/2023', 'DD/MM/YYYY'));
INSERT INTO Rega(operacao_id, setor_id, duracao, hora)
VALUES (427, 42, 120, '04:00');

-- 22/07/2023 operação de rega, setor 42, 150 min, 04:00
INSERT INTO Operacao_Agricola(id, data)
VALUES (428, TO_DATE('22/07/2023', 'DD/MM/YYYY'));
INSERT INTO Rega(operacao_id, setor_id, duracao, hora)
VALUES (428, 42, 150, '04:00');

-- 29/07/2023 operação de rega, setor 42, 150 min, 04:00
INSERT INTO Operacao_Agricola(id, data)
VALUES (429, TO_DATE('29/07/2023', 'DD/MM/YYYY'));
INSERT INTO Rega(operacao_id, setor_id, duracao, hora)
VALUES (429, 42, 150, '04:00');

-- 05/08/2023 operação de rega, setor 42, 120 min, 21:30
INSERT INTO Operacao_Agricola(id, data)
VALUES (430, TO_DATE('05/08/2023', 'DD/MM/YYYY'));
INSERT INTO Rega(operacao_id, setor_id, duracao, hora)
VALUES (430, 42, 120, '21:30');

-- 12/08/2023 operação de rega, setor 42, 120 min, 21:30
INSERT INTO Operacao_Agricola(id, data)
VALUES (431, TO_DATE('12/08/2023', 'DD/MM/YYYY'));
INSERT INTO Rega(operacao_id, setor_id, duracao, hora)
VALUES (431, 42, 120, '21:30');

-- 19/08/2023 operação de rega, setor 42, 120 min, 21:30
INSERT INTO Operacao_Agricola(id, data)
VALUES (432, TO_DATE('19/08/2023', 'DD/MM/YYYY'));
INSERT INTO Rega(operacao_id, setor_id, duracao, hora)
VALUES (432, 42, 120, '21:30');

-- 26/08/2023 operação de rega, setor 42, 120 min, 21:30
INSERT INTO Operacao_Agricola(id, data)
VALUES (433, TO_DATE('26/08/2023', 'DD/MM/YYYY'));
INSERT INTO Rega(operacao_id, setor_id, duracao, hora)
VALUES (433, 42, 120, '21:30');

-- 31/08/2023 operação de rega, setor 42, 120 min, 21:30
INSERT INTO Operacao_Agricola(id, data)
VALUES (434, TO_DATE('31/08/2023', 'DD/MM/YYYY'));
INSERT INTO Rega(operacao_id, setor_id, duracao, hora)
VALUES (434, 42, 120, '21:30');

-- 05/09/2023 operação de rega, setor 42, 120 min, 21:30
INSERT INTO Operacao_Agricola(id, data)
VALUES (435, TO_DATE('05/09/2023', 'DD/MM/YYYY'));
INSERT INTO Rega(operacao_id, setor_id, duracao, hora)
VALUES (435, 42, 120, '21:30');


-- 20/05/2023 operação de rega, setor 41, 120 min, 07:30
INSERT INTO Operacao_Agricola(id, data)
VALUES (436, TO_DATE('20/05/2023', 'DD/MM/YYYY'));
INSERT INTO Rega(operacao_id, setor_id, duracao, hora)
VALUES (436, 41, 120, '07.30');

-- 02/06/2023 operação de rega, setor 41, 120 min, 07:30
INSERT INTO Operacao_Agricola(id, data)
VALUES (437, TO_DATE('02/06/2023', 'DD/MM/YYYY'));
INSERT INTO Rega(operacao_id, setor_id, duracao, hora)
VALUES (437, 41, 120, '07.30');

-- 09/06/2023 operação de rega, setor 41, 120 min, 06:20
INSERT INTO Operacao_Agricola(id, data)
VALUES (438, TO_DATE('09/06/2023', 'DD/MM/YYYY'));
INSERT INTO Rega(operacao_id, setor_id, duracao, hora)
VALUES (438, 41, 120, '06:20');

-- 09/07/2023 operação de rega, setor 41, 120 min, 06:20
INSERT INTO Operacao_Agricola(id, data)
VALUES (439, TO_DATE('09/07/2023', 'DD/MM/YYYY'));
INSERT INTO Rega(operacao_id, setor_id, duracao, hora)
VALUES (439, 41, 120, '06:20');

-- 16/07/2023 operação de rega, setor 41, 120 min, 06:20
INSERT INTO Operacao_Agricola(id, data)
VALUES (440, TO_DATE('16/07/2023', 'DD/MM/YYYY'));
INSERT INTO Rega(operacao_id, setor_id, duracao, hora)
VALUES (440, 41, 120, '06:20');

-- 23/07/2023 operação de rega, setor 41, 120 min, 06:20
INSERT INTO Operacao_Agricola(id, data)
VALUES (441, TO_DATE('23/07/2023', 'DD/MM/YYYY'));
INSERT INTO Rega(operacao_id, setor_id, duracao, hora)
VALUES (441, 41, 120, '06:20');

-- 30/07/2023 operação de rega, setor 41, 120 min, 06:20
INSERT INTO Operacao_Agricola(id, data)
VALUES (442, TO_DATE('30/07/2023', 'DD/MM/YYYY'));
INSERT INTO Rega(operacao_id, setor_id, duracao, hora)
VALUES (442, 41, 120, '06:20');

-- 07/08/2023 operação de rega, setor 41, 120 min, 06:20
INSERT INTO Operacao_Agricola(id, data)
VALUES (443, TO_DATE('07/08/2023', 'DD/MM/YYYY'));
INSERT INTO Rega(operacao_id, setor_id, duracao, hora)
VALUES (443, 41, 120, '06:20');

-- 14/08/2023 operação de rega, setor 41, 120 min, 06:20
INSERT INTO Operacao_Agricola(id, data)
VALUES (444, TO_DATE('14/08/2023', 'DD/MM/YYYY'));
INSERT INTO Rega(operacao_id, setor_id, duracao, hora)
VALUES (444, 41, 120, '06:20');

-- 21/08/2023 operação de rega, setor 41, 120 min, 06:20
INSERT INTO Operacao_Agricola(id, data)
VALUES (445, TO_DATE('21/08/2023', 'DD/MM/YYYY'));
INSERT INTO Rega(operacao_id, setor_id, duracao, hora)
VALUES (445, 41, 120, '06:20');

-- 28/08/2023 operação de rega, setor 41, 120 min, 06:20
INSERT INTO Operacao_Agricola(id, data)
VALUES (446, TO_DATE('28/08/2023', 'DD/MM/YYYY'));
INSERT INTO Rega(operacao_id, setor_id, duracao, hora)
VALUES (446, 41, 120, '06:20');

-- 06/09/2023 operação de rega, setor 41, 120 min, 06:20
INSERT INTO Operacao_Agricola(id, data)
VALUES (447, TO_DATE('06/09/2023', 'DD/MM/YYYY'));
INSERT INTO Rega(operacao_id, setor_id, duracao, hora)
VALUES (447, 41, 120, '06:20');

-- 13/09/2023 operação de rega, setor 41, 120 min, 07:00
INSERT INTO Operacao_Agricola(id, data)
VALUES (448, TO_DATE('13/09/2023', 'DD/MM/YYYY'));
INSERT INTO Rega(operacao_id, setor_id, duracao, hora)
VALUES (448, 41, 120, '07:00');

-- 20/09/2023 operação de rega, setor 41, 120 min, 07:00
INSERT INTO Operacao_Agricola(id, data)
VALUES (449, TO_DATE('20/09/2023', 'DD/MM/YYYY'));
INSERT INTO Rega(operacao_id, setor_id, duracao, hora)
VALUES (449, 41, 120, '07:00');

commit;