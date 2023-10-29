CREATE TABLE Aplicacao_FP (operacao_id number(10) NOT NULL, fator_producao_id number(10), PRIMARY KEY (operacao_id));
CREATE TABLE Ciclo (id number(10) NOT NULL, PRIMARY KEY (id));
CREATE TABLE Ciclo_Permanente (ciclo_id number(10) NOT NULL, fase_poda nvarchar2(255), fase_floracao nvarchar2(255), fase_colheita nvarchar2(255), PRIMARY KEY (ciclo_id));
CREATE TABLE Ciclo_Temporaria (ciclo_id number(10) NOT NULL, fase_sementeira nvarchar2(255), fase_colheita nvarchar2(255), PRIMARY KEY (ciclo_id));
CREATE TABLE Colheita (operacao_id number(10) NOT NULL, previsao_colheita_id number(10), PRIMARY KEY (operacao_id));
CREATE TABLE Composto_Quimico (id number(10) NOT NULL, nome nvarchar2(255), PRIMARY KEY (id));
CREATE TABLE Cultura (id number(10) NOT NULL, variedade_id number(10), plantacao_id number(10), PRIMARY KEY (id));
CREATE TABLE Edificio (id number(10) NOT NULL, nome nvarchar2(255), dimensao number(10), exploracao_agricola_id number(10), tipo_edificio_id number(10), PRIMARY KEY (id));
CREATE TABLE Especie (id number(10) NOT NULL, nome_comum nvarchar2(255), nome_cientifico nvarchar2(255), tipo_consumo_id number(10), PRIMARY KEY (id));
CREATE TABLE Exploracao_Agricola (id number(10) NOT NULL, nome nvarchar2(255), PRIMARY KEY (id));
CREATE TABLE Fator_Producao (id number(10) NOT NULL, nome nvarchar2(255), tipo_id number(10), formulacao_id number(10), PRIMARY KEY (id));
CREATE TABLE Ficha_Tecnica (fator_producao_id number(10) NOT NULL, composto_quimico_id number(10) NOT NULL, quantidade float(10), PRIMARY KEY (fator_producao_id, composto_quimico_id));
CREATE TABLE Formulacao_FP (id number(10) NOT NULL, tipo nvarchar2(255), PRIMARY KEY (id));
CREATE TABLE FP_Metodo_Aplicacao (fator_producao_id number(10) NOT NULL, metodo_aplicacao_id number(10) NOT NULL, PRIMARY KEY (fator_producao_id, metodo_aplicacao_id));
CREATE TABLE Metodo_Aplicacao (id number(10) NOT NULL, tipo nvarchar2(255), PRIMARY KEY (id));
CREATE TABLE Operacao (id number(10) NOT NULL, plantacao_id number(10), tipo_operacao_id number(10), data date, quantidade number(10), PRIMARY KEY (id));
CREATE TABLE Parcela (id number(10) NOT NULL, nome nvarchar2(255), area float(10), exploracao_agricola_id number(10), PRIMARY KEY (id));
CREATE TABLE Plantacao (id number(10) NOT NULL, parcela_id number(10), data_inicio date, PRIMARY KEY (id));
CREATE TABLE Plantacao_Permanente (plantacao_id number(10) NOT NULL, PRIMARY KEY (plantacao_id));
CREATE TABLE Plantacao_Temporaria (plantacao_id number(10) NOT NULL, data_fim date, quantidade float(10), PRIMARY KEY (plantacao_id));
CREATE TABLE Previsao_Colheita (id number(10) NOT NULL, data_inicio date, semana number(10), quantidade number(10), plantacao_id number(10), PRIMARY KEY (id));
CREATE TABLE Registro_EM (operacao_id number(10) NOT NULL, velocidade_vento number(10), direcao_vento number(10), temperatura_solo number(10), humidade_solo number(10), radiação number(10), pressão_atmosferica number(10), temperatura_ar number(10), humidade_ar number(10), pluviosidade number(10), data date, estacao_id number(10), PRIMARY KEY (operacao_id));
CREATE TABLE Tipo_Consumo (id number(10) NOT NULL, tipo nvarchar2(255), PRIMARY KEY (id));
CREATE TABLE Tipo_Edificio (id number(10) NOT NULL, tipo nvarchar2(255), unidade nvarchar2(255), PRIMARY KEY (id));
CREATE TABLE Tipo_FP (id number(10) NOT NULL, tipo nvarchar2(255), PRIMARY KEY (id));
CREATE TABLE Tipo_Operacao (id number(10) NOT NULL, nome nvarchar2(255), unidade nvarchar2(255), PRIMARY KEY (id));
CREATE TABLE Variedade (id number(10) NOT NULL, nome nvarchar2(255), especie_id number(10), ciclo_id number(10), PRIMARY KEY (id));

ALTER TABLE Edificio ADD CONSTRAINT FKEdificio580456 FOREIGN KEY (exploracao_agricola_id) REFERENCES Exploracao_Agricola (id);
ALTER TABLE Edificio ADD CONSTRAINT FKEdificio4079 FOREIGN KEY (tipo_edifício_id) REFERENCES Tipo_Edificio (id);
ALTER TABLE Parcela ADD CONSTRAINT FKParcela742203 FOREIGN KEY (exploracao_agricola_id) REFERENCES Exploracao_Agricola (id);
ALTER TABLE Plantacao ADD CONSTRAINT FKPlantacao800350 FOREIGN KEY (parcela_id) REFERENCES Parcela (id);
ALTER TABLE Fator_Producao ADD CONSTRAINT FKFator_Prod464638 FOREIGN KEY (tipo_id) REFERENCES Tipo_FP (id);
ALTER TABLE Fator_Producao ADD CONSTRAINT FKFator_Prod882534 FOREIGN KEY (formulacao_id) REFERENCES Formulacao_FP (id);
ALTER TABLE Previsao_Colheita ADD CONSTRAINT FKPrevisao_C37654 FOREIGN KEY (plantacao_id) REFERENCES Plantacao (id);
ALTER TABLE Aplicacao_FP ADD CONSTRAINT FKAplicacao_767975 FOREIGN KEY (fator_producao_id) REFERENCES Fator_Producao (id);
ALTER TABLE Colheita ADD CONSTRAINT FKColheita123488 FOREIGN KEY (previsao_colheita_id) REFERENCES Previsao_Colheita (id);
ALTER TABLE Registro_EM ADD CONSTRAINT FKRegistro_E358059 FOREIGN KEY (estacao_id) REFERENCES Edificio (id);
ALTER TABLE Especie ADD CONSTRAINT FKEspecie165193 FOREIGN KEY (tipo_consumo_id) REFERENCES Tipo_Consumo (id);
ALTER TABLE Variedade ADD CONSTRAINT FKVariedade696491 FOREIGN KEY (especie_id) REFERENCES Especie (id);
ALTER TABLE Cultura ADD CONSTRAINT FKCultura472340 FOREIGN KEY (variedade_id) REFERENCES Variedade (id);
ALTER TABLE FP_Metodo_Aplicacao ADD CONSTRAINT FKFP_Metodo_165080 FOREIGN KEY (fator_producao_id) REFERENCES Fator_Producao (id);
ALTER TABLE FP_Metodo_Aplicacao ADD CONSTRAINT FKFP_Metodo_683093 FOREIGN KEY (metodo_aplicacao_id) REFERENCES Metodo_Aplicacao (id);
ALTER TABLE Plantacao_Permanente ADD CONSTRAINT FKPlantacao_614284 FOREIGN KEY (plantacao_id) REFERENCES Plantacao (id);
ALTER TABLE Plantacao_Temporaria ADD CONSTRAINT FKPlantacao_628676 FOREIGN KEY (plantacao_id) REFERENCES Plantacao (id);
ALTER TABLE Operacao ADD CONSTRAINT FKOperacao454745 FOREIGN KEY (plantacao_id) REFERENCES Plantacao (id);
ALTER TABLE Operacao ADD CONSTRAINT FKOperacao457761 FOREIGN KEY (tipo_operacao_id) REFERENCES Tipo_Operacao (id);
ALTER TABLE Colheita ADD CONSTRAINT FKColheita340301 FOREIGN KEY (operacao_id) REFERENCES Operacao (id);
ALTER TABLE Aplicacao_FP ADD CONSTRAINT FKAplicacao_401044 FOREIGN KEY (operacao_id) REFERENCES Operacao (id);
ALTER TABLE Ciclo_Permanente ADD CONSTRAINT FKCiclo_Perm729777 FOREIGN KEY (ciclo_id) REFERENCES Ciclo (id);
ALTER TABLE Ciclo_Temporaria ADD CONSTRAINT FKCiclo_Temp513183 FOREIGN KEY (ciclo_id) REFERENCES Ciclo (id);
ALTER TABLE Variedade ADD CONSTRAINT FKVariedade936988 FOREIGN KEY (ciclo_id) REFERENCES Ciclo (id);
ALTER TABLE Cultura ADD CONSTRAINT FKCultura460171 FOREIGN KEY (plantacao_id) REFERENCES Plantacao (id);
ALTER TABLE Registro_EM ADD CONSTRAINT FKRegistro_E821084 FOREIGN KEY (operacao_id) REFERENCES Operacao (id);
ALTER TABLE Ficha_Tecnica ADD CONSTRAINT FKFicha_Tecn282238 FOREIGN KEY (fator_producao_id) REFERENCES Fator_Producao (id);
ALTER TABLE Ficha_Tecnica ADD CONSTRAINT FKFicha_Tecn211506 FOREIGN KEY (composto_quimico_id) REFERENCES Composto_Quimico (id);
