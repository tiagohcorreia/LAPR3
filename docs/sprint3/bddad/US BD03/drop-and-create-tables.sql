DROP TABLE Aplicacao_FP CASCADE CONSTRAINTS;
DROP TABLE Aplicacao_FP_Solo CASCADE CONSTRAINTS;
DROP TABLE APLICACAO_FP_VARIEDADE CASCADE CONSTRAINTS;
DROP TABLE Colheita CASCADE CONSTRAINTS;
DROP TABLE Composto_Quimico CASCADE CONSTRAINTS;
DROP TABLE Cultura CASCADE CONSTRAINTS;
DROP TABLE Edificio CASCADE CONSTRAINTS;
DROP TABLE Fator_Producao CASCADE CONSTRAINTS;
DROP TABLE Ficha_Tecnica CASCADE CONSTRAINTS;
DROP TABLE Formulacao_FP CASCADE CONSTRAINTS;
DROP TABLE FP_APLICADOS CASCADE CONSTRAINTS;
DROP TABLE FP_Metodo_Aplicacao CASCADE CONSTRAINTS;
DROP TABLE Incorporacao_Solo CASCADE CONSTRAINTS;
DROP TABLE LOG_OPERACAO CASCADE CONSTRAINTS;
DROP TABLE Metodo_Aplicacao CASCADE CONSTRAINTS;
DROP TABLE Metodo_Dispensasao CASCADE CONSTRAINTS;
DROP TABLE Metodo_Execucao CASCADE CONSTRAINTS;
DROP TABLE Mobilizacao_Solo CASCADE CONSTRAINTS;
DROP TABLE Monda CASCADE CONSTRAINTS;
DROP TABLE Op_Plantacao CASCADE CONSTRAINTS;
DROP TABLE Operacao_Agricola CASCADE CONSTRAINTS;
DROP TABLE Parcela CASCADE CONSTRAINTS;
DROP TABLE Parcelas_Variedades_Aplicadas CASCADE CONSTRAINTS;
DROP TABLE Plantacao CASCADE CONSTRAINTS;
DROP TABLE Plantacao_Permanente CASCADE CONSTRAINTS;
DROP TABLE Plantacao_Temporaria CASCADE CONSTRAINTS;
DROP TABLE Poda CASCADE CONSTRAINTS;
DROP TABLE Produto CASCADE CONSTRAINTS;
DROP TABLE Receita_Fertirrega CASCADE CONSTRAINTS;
DROP TABLE Receita_FP CASCADE CONSTRAINTS;
DROP TABLE Rega CASCADE CONSTRAINTS;
DROP TABLE Registro_Sensor CASCADE CONSTRAINTS;
DROP TABLE Sementeira CASCADE CONSTRAINTS;
DROP TABLE Sensor CASCADE CONSTRAINTS;
DROP TABLE Setor_Rega CASCADE CONSTRAINTS;
DROP TABLE SetorRega_Plantacao CASCADE CONSTRAINTS;
DROP TABLE Tipo_Edificio CASCADE CONSTRAINTS;
DROP TABLE Tipo_FP CASCADE CONSTRAINTS;
DROP TABLE Tipo_Sensor CASCADE CONSTRAINTS;
DROP TABLE Variedade CASCADE CONSTRAINTS;
DROP TABLE Variedade_Permanente CASCADE CONSTRAINTS;
DROP TABLE Variedade_Temporaria CASCADE CONSTRAINTS;



CREATE TABLE Aplicacao_FP
(
    Operacao_id number(10) NOT NULL,
    PRIMARY KEY (Operacao_id)
);
CREATE TABLE Aplicacao_FP_Solo
(
    Operacao_id number(10) NOT NULL,
    Parcela_id  number(10) NOT NULL,
    area        float(10),
    PRIMARY KEY (Operacao_id)
);
CREATE TABLE APLICACAO_FP_VARIEDADE
(
    Operacao_id         number(10) NOT NULL,
    Metodo_Aplicacao_id number(10),
    PRIMARY KEY (Operacao_id)
);
CREATE TABLE Colheita
(
    operacao_id        number(10) NOT NULL,
    parcela_id         number(10) NOT NULL,
    produto_id         number(10) NOT NULL,
    metodo_execucao_id number(10),
    quantidade         float(10)  NOT NULL,
    PRIMARY KEY (operacao_id)
);
CREATE TABLE Composto_Quimico
(
    id   number(10)     NOT NULL,
    nome nvarchar2(255) NOT NULL,
    PRIMARY KEY (id)
);
CREATE TABLE Cultura
(
    id              number(10)     NOT NULL,
    nome_comum      nvarchar2(255) NOT NULL,
    nome_cientifico nvarchar2(255),
    PRIMARY KEY (id)
);
CREATE TABLE Edificio
(
    id               number(10)     NOT NULL,
    nome             nvarchar2(255) NOT NULL,
    dimensao         number(10),
    tipo_edificio_id number(10)     NOT NULL,
    PRIMARY KEY (id)
);
CREATE TABLE Fator_Producao
(
    id            number(10)     NOT NULL,
    nome          nvarchar2(255) NOT NULL,
    tipo_id       number(10)     NOT NULL,
    formulacao_id number(10)     NOT NULL,
    ph            float(10),
    densidade     nvarchar2(255),
    PRIMARY KEY (id)
);
CREATE TABLE Ficha_Tecnica
(
    fator_producao_id   number(10) NOT NULL,
    composto_quimico_id number(10) NOT NULL,
    quantidade          float(10)  NOT NULL,
    PRIMARY KEY (fator_producao_id, composto_quimico_id)
);
CREATE TABLE Formulacao_FP
(
    id   number(10)     NOT NULL,
    tipo nvarchar2(255) NOT NULL,
    PRIMARY KEY (id)
);
CREATE TABLE FP_APLICADOS
(
    Operacao_id number(10) NOT NULL,
    fp_id       number(10) NOT NULL,
    quantidade  float(10),
    unidade     nvarchar2(255),
    PRIMARY KEY (Operacao_id, fp_id)
);
CREATE TABLE FP_Metodo_Aplicacao
(
    fator_producao_id   number(10) NOT NULL,
    metodo_aplicacao_id number(10) NOT NULL,
    PRIMARY KEY (fator_producao_id, metodo_aplicacao_id)
);
CREATE TABLE Incorporacao_Solo
(
    operacao_id  number(10) NOT NULL,
    parcela_id   number(10) NOT NULL,
    variedade_id number(10) NOT NULL,
    quantidade   float(10)  NOT NULL,
    PRIMARY KEY (operacao_id)
);
CREATE TABLE LOG_OPERACAO
(
    id          number(10)     NOT NULL,
    operacao_id number(10)     NOT NULL,
    log         nvarchar2(255) NOT NULL,
    PRIMARY KEY (id)
);
CREATE TABLE Metodo_Aplicacao
(
    id   number(10)     NOT NULL,
    tipo nvarchar2(255) NOT NULL,
    PRIMARY KEY (id)
);
CREATE TABLE Metodo_Dispensasao
(
    id   number(10)     NOT NULL,
    nome nvarchar2(255) NOT NULL,
    PRIMARY KEY (id)
);
CREATE TABLE Metodo_Execucao
(
    id   number(10)     NOT NULL,
    nome nvarchar2(255) NOT NULL,
    PRIMARY KEY (id)
);
CREATE TABLE Mobilizacao_Solo
(
    operacao_id number(10) NOT NULL,
    parcela_id  number(10) NOT NULL,
    area        float(10)  NOT NULL,
    PRIMARY KEY (operacao_id)
);
CREATE TABLE Monda
(
    operacao_id        number(10) NOT NULL,
    parcela_id         number(10) NOT NULL,
    variedade_id       number(10) NOT NULL,
    quantidade         float(10)  NOT NULL,
    metodo_execucao_id number(10),
    PRIMARY KEY (operacao_id)
);
CREATE TABLE Op_Plantacao
(
    operacao_id        number(10) NOT NULL,
    parcela_id         number(10) NOT NULL,
    variedade_id       number(10) NOT NULL,
    metodo_execucao_id number(10),
    quantidade         float(10)  NOT NULL,
    compasso           float(10),
    distancia_filas    float(10),
    PRIMARY KEY (operacao_id)
);
CREATE TABLE Operacao_Agricola
(
    id               number(10) NOT NULL,
    data             date       NOT NULL,
    instante_registo timestamp(0),
    validade         number(10) NOT NULL,
    PRIMARY KEY (id)
);
CREATE TABLE Parcela
(
    id   number(10)     NOT NULL,
    nome nvarchar2(255) NOT NULL,
    area float(10)      NOT NULL,
    PRIMARY KEY (id)
);
CREATE TABLE Parcelas_Variedades_Aplicadas
(
    Operacao_id  number(10) NOT NULL,
    Parcela_id   number(10) NOT NULL,
    Variedade_id number(10) NOT NULL,
    PRIMARY KEY (Operacao_id, Parcela_id, Variedade_id)
);
CREATE TABLE Plantacao
(
    id         number(10) NOT NULL,
    parcela_id number(10) NOT NULL,
    PRIMARY KEY (id)
);
CREATE TABLE Plantacao_Permanente
(
    plantacao_id      number(10) NOT NULL,
    variedade_perm_id number(10) NOT NULL,
    compasso          float(10)  NOT NULL,
    distancia_filas   float(10)  NOT NULL,
    quantidade        number(10) NOT NULL,
    data_inicio       date       NOT NULL,
    data_fim          date,
    PRIMARY KEY (plantacao_id)
);
CREATE TABLE Plantacao_Temporaria
(
    plantacao_id      number(10) NOT NULL,
    variedade_temp_id number(10) NOT NULL,
    area              float(10)  NOT NULL,
    data_início       date       NOT NULL,
    data_fim          date,
    PRIMARY KEY (plantacao_id)
);
CREATE TABLE Poda
(
    operacao_id        number(10) NOT NULL,
    parcela_id         number(10) NOT NULL,
    variedade_id       number(10) NOT NULL,
    quantidade         float(10)  NOT NULL,
    metodo_execucao_id number(10),
    PRIMARY KEY (operacao_id)
);
CREATE TABLE Produto
(
    id           number(10)     NOT NULL,
    nome         nvarchar2(255) NOT NULL,
    variedade_id number(10)     NOT NULL,
    PRIMARY KEY (id)
);
CREATE TABLE Receita_Fertirrega
(
    id   number(10)     NOT NULL,
    nome nvarchar2(255) NOT NULL UNIQUE,
    PRIMARY KEY (id)
);
CREATE TABLE Receita_FP
(
    receita_id number(10)     NOT NULL,
    fp_id      number(10)     NOT NULL,
    proporcao  number(10)     NOT NULL,
    unidade    nvarchar2(255) NOT NULL,
    PRIMARY KEY (receita_id, fp_id)
);
CREATE TABLE Rega
(
    operacao_id number(10)    NOT NULL,
    setor_id    number(10),
    duracao     number(10)    NOT NULL,
    hora        varchar2(255) NOT NULL,
    PRIMARY KEY (operacao_id)
);
CREATE TABLE Registro_Sensor
(
    id        number(10) NOT NULL,
    sensor_id number(10) NOT NULL,
    valor     float(10)  NOT NULL,
    PRIMARY KEY (id)
);
CREATE TABLE Sementeira
(
    operacao_id        number(10) NOT NULL,
    parcela_id         number(10) NOT NULL,
    variedade_id       number(10) NOT NULL,
    quantidade         float(10)  NOT NULL,
    area               float(10)  NOT NULL,
    metodo_execucao_id number(10),
    PRIMARY KEY (operacao_id)
);
CREATE TABLE Sensor
(
    id             number(10) NOT NULL,
    parcela_id     number(10) NOT NULL,
    tipo_sensor_id number(10) NOT NULL,
    PRIMARY KEY (id)
);
CREATE TABLE Setor_Rega
(
    id                    number(10)     NOT NULL,
    nome                  nvarchar2(255) NOT NULL UNIQUE,
    area                  float(10),
    caudal_maximo         float(10)      NOT NULL,
    data_inicio           date           NOT NULL,
    data_fim              date,
    metodo_dispensasao_id number(10),
    PRIMARY KEY (id)
);
CREATE TABLE SetorRega_Plantacao
(
    id           number(10) NOT NULL,
    setor_id     number(10),
    plantacao_id number(10) NOT NULL,
    data_inicio  date       NOT NULL,
    data_fim     date,
    PRIMARY KEY (id)
);
CREATE TABLE Tipo_Edificio
(
    id      number(10)     NOT NULL,
    tipo    nvarchar2(255) NOT NULL,
    unidade nvarchar2(255),
    PRIMARY KEY (id)
);
CREATE TABLE Tipo_FP
(
    id   number(10)     NOT NULL,
    tipo nvarchar2(255) NOT NULL,
    PRIMARY KEY (id)
);
CREATE TABLE Tipo_Sensor
(
    id      number(10)     NOT NULL,
    nome    nvarchar2(255) NOT NULL,
    unidade nvarchar2(255),
    PRIMARY KEY (id)
);
CREATE TABLE Variedade
(
    id         number(10)     NOT NULL,
    nome       nvarchar2(255) NOT NULL,
    cultura_id number(10)     NOT NULL,
    PRIMARY KEY (id)
);
CREATE TABLE Variedade_Permanente
(
    variedade_id   number(10) NOT NULL,
    fase_plantacao nvarchar2(255),
    fase_poda      nvarchar2(255),
    fase_floracao  nvarchar2(255),
    fase_colheita  nvarchar2(255),
    PRIMARY KEY (variedade_id)
);
CREATE TABLE Variedade_Temporaria
(
    variedade_id    number(10) NOT NULL,
    fase_sementeira nvarchar2(255),
    fase_colheita   nvarchar2(255),
    PRIMARY KEY (variedade_id)
);


ALTER TABLE Edificio
    ADD CONSTRAINT FKEdificio633992 FOREIGN KEY (tipo_edificio_id) REFERENCES Tipo_Edificio (id);
ALTER TABLE Plantacao
    ADD CONSTRAINT FKPlantacao800350 FOREIGN KEY (parcela_id) REFERENCES Parcela (id);
ALTER TABLE Fator_Producao
    ADD CONSTRAINT FKFator_Prod464638 FOREIGN KEY (tipo_id) REFERENCES Tipo_FP (id);
ALTER TABLE Fator_Producao
    ADD CONSTRAINT FKFator_Prod882534 FOREIGN KEY (formulacao_id) REFERENCES Formulacao_FP (id);
ALTER TABLE FP_Metodo_Aplicacao
    ADD CONSTRAINT FKFP_Metodo_165080 FOREIGN KEY (fator_producao_id) REFERENCES Fator_Producao (id);
ALTER TABLE FP_Metodo_Aplicacao
    ADD CONSTRAINT FKFP_Metodo_683093 FOREIGN KEY (metodo_aplicacao_id) REFERENCES Metodo_Aplicacao (id);
ALTER TABLE Plantacao_Permanente
    ADD CONSTRAINT FKPlantacao_614284 FOREIGN KEY (plantacao_id) REFERENCES Plantacao (id);
ALTER TABLE Plantacao_Temporaria
    ADD CONSTRAINT FKPlantacao_628676 FOREIGN KEY (plantacao_id) REFERENCES Plantacao (id);
ALTER TABLE Ficha_Tecnica
    ADD CONSTRAINT FKFicha_Tecn282238 FOREIGN KEY (fator_producao_id) REFERENCES Fator_Producao (id);
ALTER TABLE Ficha_Tecnica
    ADD CONSTRAINT FKFicha_Tecn211506 FOREIGN KEY (composto_quimico_id) REFERENCES Composto_Quimico (id);
ALTER TABLE Sementeira
    ADD CONSTRAINT FKSementeira762506 FOREIGN KEY (operacao_id) REFERENCES Operacao_Agricola (id);
ALTER TABLE Monda
    ADD CONSTRAINT FKMonda459456 FOREIGN KEY (operacao_id) REFERENCES Operacao_Agricola (id);
ALTER TABLE Colheita
    ADD CONSTRAINT FKColheita10006 FOREIGN KEY (operacao_id) REFERENCES Operacao_Agricola (id);
ALTER TABLE Colheita
    ADD CONSTRAINT FKColheita249376 FOREIGN KEY (produto_id) REFERENCES Produto (id);
ALTER TABLE Sensor
    ADD CONSTRAINT FKSensor735474 FOREIGN KEY (parcela_id) REFERENCES Parcela (id);
ALTER TABLE Setor_Rega
    ADD CONSTRAINT FKSetor_Rega1754 FOREIGN KEY (metodo_dispensasao_id) REFERENCES Metodo_Dispensasao (id);
ALTER TABLE Sensor
    ADD CONSTRAINT FKSensor444441 FOREIGN KEY (tipo_sensor_id) REFERENCES Tipo_Sensor (id);
ALTER TABLE Registro_Sensor
    ADD CONSTRAINT FKRegistro_S64594 FOREIGN KEY (sensor_id) REFERENCES Sensor (id);
ALTER TABLE Poda
    ADD CONSTRAINT FKPoda493205 FOREIGN KEY (operacao_id) REFERENCES Operacao_Agricola (id);
ALTER TABLE Rega
    ADD CONSTRAINT FKRega443140 FOREIGN KEY (operacao_id) REFERENCES Operacao_Agricola (id);
ALTER TABLE Monda
    ADD CONSTRAINT FKMonda310596 FOREIGN KEY (metodo_execucao_id) REFERENCES Metodo_Execucao (id);
ALTER TABLE Op_Plantacao
    ADD CONSTRAINT FKOp_Plantac734423 FOREIGN KEY (metodo_execucao_id) REFERENCES Metodo_Execucao (id);
ALTER TABLE Plantacao_Permanente
    ADD CONSTRAINT FKPlantacao_860094 FOREIGN KEY (variedade_perm_id) REFERENCES Variedade_Permanente (variedade_id);
ALTER TABLE Variedade_Permanente
    ADD CONSTRAINT FKVariedade_783712 FOREIGN KEY (variedade_id) REFERENCES Variedade (id);
ALTER TABLE Variedade_Temporaria
    ADD CONSTRAINT FKVariedade_459248 FOREIGN KEY (variedade_id) REFERENCES Variedade (id);
ALTER TABLE Produto
    ADD CONSTRAINT FKProduto421276 FOREIGN KEY (variedade_id) REFERENCES Variedade (id);
ALTER TABLE Sementeira
    ADD CONSTRAINT FKSementeira595630 FOREIGN KEY (parcela_id) REFERENCES Parcela (id);
ALTER TABLE Rega
    ADD CONSTRAINT FKRega982559 FOREIGN KEY (setor_id) REFERENCES Setor_Rega (id);
ALTER TABLE Colheita
    ADD CONSTRAINT FKColheita176882 FOREIGN KEY (parcela_id) REFERENCES Parcela (id);
ALTER TABLE Op_Plantacao
    ADD CONSTRAINT FKOp_Plantac202505 FOREIGN KEY (parcela_id) REFERENCES Parcela (id);
ALTER TABLE Colheita
    ADD CONSTRAINT FKColheita239953 FOREIGN KEY (metodo_execucao_id) REFERENCES Metodo_Execucao (id);
ALTER TABLE Variedade
    ADD CONSTRAINT FKVariedade302681 FOREIGN KEY (cultura_id) REFERENCES Cultura (id);
ALTER TABLE Mobilizacao_Solo
    ADD CONSTRAINT FKMobilizaca875076 FOREIGN KEY (operacao_id) REFERENCES Operacao_Agricola (id);
ALTER TABLE Mobilizacao_Solo
    ADD CONSTRAINT FKMobilizaca41953 FOREIGN KEY (parcela_id) REFERENCES Parcela (id);
ALTER TABLE Monda
    ADD CONSTRAINT FKMonda896121 FOREIGN KEY (variedade_id) REFERENCES Variedade (id);
ALTER TABLE Poda
    ADD CONSTRAINT FKPoda660081 FOREIGN KEY (parcela_id) REFERENCES Parcela (id);
ALTER TABLE Monda
    ADD CONSTRAINT FKMonda626332 FOREIGN KEY (parcela_id) REFERENCES Parcela (id);
ALTER TABLE Poda
    ADD CONSTRAINT FKPoda862372 FOREIGN KEY (variedade_id) REFERENCES Variedade (id);
ALTER TABLE Plantacao_Temporaria
    ADD CONSTRAINT FKPlantacao_855979 FOREIGN KEY (variedade_temp_id) REFERENCES Variedade_Temporaria (variedade_id);
ALTER TABLE Poda
    ADD CONSTRAINT FKPoda276847 FOREIGN KEY (metodo_execucao_id) REFERENCES Metodo_Execucao (id);
ALTER TABLE Sementeira
    ADD CONSTRAINT FKSementeira439031 FOREIGN KEY (metodo_execucao_id) REFERENCES Metodo_Execucao (id);
ALTER TABLE SetorRega_Plantacao
    ADD CONSTRAINT FKSetorRega_599356 FOREIGN KEY (plantacao_id) REFERENCES Plantacao (id);
ALTER TABLE SetorRega_Plantacao
    ADD CONSTRAINT FKSetorRega_307810 FOREIGN KEY (setor_id) REFERENCES Setor_Rega (id);
ALTER TABLE Sementeira
    ADD CONSTRAINT FKSementeira853505 FOREIGN KEY (variedade_id) REFERENCES Variedade (id);
ALTER TABLE Op_Plantacao
    ADD CONSTRAINT FKOp_Plantac319949 FOREIGN KEY (variedade_id) REFERENCES Variedade (id);
ALTER TABLE Incorporacao_Solo
    ADD CONSTRAINT FKIncorporac654866 FOREIGN KEY (operacao_id) REFERENCES Operacao_Agricola (id);
ALTER TABLE Incorporacao_Solo
    ADD CONSTRAINT FKIncorporac487990 FOREIGN KEY (parcela_id) REFERENCES Parcela (id);
ALTER TABLE Incorporacao_Solo
    ADD CONSTRAINT FKIncorporac38854 FOREIGN KEY (variedade_id) REFERENCES Variedade (id);
ALTER TABLE Op_Plantacao
    ADD CONSTRAINT FKOp_Plantac35629 FOREIGN KEY (operacao_id) REFERENCES Operacao_Agricola (id);
ALTER TABLE Receita_FP
    ADD CONSTRAINT FKReceita_FP437299 FOREIGN KEY (receita_id) REFERENCES Receita_Fertirrega (id);
ALTER TABLE Receita_FP
    ADD CONSTRAINT FKReceita_FP984213 FOREIGN KEY (fp_id) REFERENCES Fator_Producao (id);
ALTER TABLE FP_APLICADOS
    ADD CONSTRAINT FKFP_APLICAD683251 FOREIGN KEY (Operacao_id) REFERENCES Aplicacao_FP (Operacao_id);
ALTER TABLE FP_APLICADOS
    ADD CONSTRAINT FKFP_APLICAD17458 FOREIGN KEY (fp_id) REFERENCES Fator_Producao (id);
ALTER TABLE LOG_OPERACAO
    ADD CONSTRAINT FKLOG_OPERAC853230 FOREIGN KEY (operacao_id) REFERENCES Operacao_Agricola (id);
ALTER TABLE Parcelas_Variedades_Aplicadas
    ADD CONSTRAINT FKParcelas_V663684 FOREIGN KEY (Parcela_id) REFERENCES Parcela (id);
ALTER TABLE Parcelas_Variedades_Aplicadas
    ADD CONSTRAINT FKParcelas_V39734 FOREIGN KEY (Variedade_id) REFERENCES Variedade (id);
ALTER TABLE APLICACAO_FP_VARIEDADE
    ADD CONSTRAINT FKAPLICACAO_687965 FOREIGN KEY (Operacao_id) REFERENCES Aplicacao_FP (Operacao_id);
ALTER TABLE Parcelas_Variedades_Aplicadas
    ADD CONSTRAINT FKParcelas_V746486 FOREIGN KEY (Operacao_id) REFERENCES APLICACAO_FP_VARIEDADE (Operacao_id);
ALTER TABLE APLICACAO_FP_VARIEDADE
    ADD CONSTRAINT FKAPLICACAO_224925 FOREIGN KEY (Metodo_Aplicacao_id) REFERENCES Metodo_Aplicacao (id);
ALTER TABLE Aplicacao_FP
    ADD CONSTRAINT FKAplicacao_200441 FOREIGN KEY (Operacao_id) REFERENCES Operacao_Agricola (id);
ALTER TABLE Aplicacao_FP_Solo
    ADD CONSTRAINT FKAplicacao_359100 FOREIGN KEY (Operacao_id) REFERENCES Aplicacao_FP (Operacao_id);
ALTER TABLE Aplicacao_FP_Solo
    ADD CONSTRAINT FKAplicacao_803223 FOREIGN KEY (Parcela_id) REFERENCES Parcela (id);
