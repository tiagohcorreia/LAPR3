# US BD24

## 1. Engenharia de Requsitos

### 1.1 Descrição da User Story

> Como Gestor Agrícola, pretendo que não seja possível alterar ou apagar os logs.

### 1.2. Especificações e Clarificações

Clarificações do Cliente:

*

Clarificações dos Professores:

*

### 1.3. Critérios de Aceitação

* N/A

### 1.4. Dependedências

* Tem que exister logs registados na tabela "Log_Operacao"


### 1.7 Outros Pontos Importantes

* N/A

## 2. Analise

### 2.1. Excerto Modelo Domínio



### 2.2. Outros Pontos

* N/A

# 3. Implementação

### register_moment.sql

```sql

CREATE OR REPLACE TRIGGER log_operacao_update_trigger
    BEFORE UPDATE ON LOG_OPERACAO
    FOR EACH ROW
BEGIN
    RAISE_APPLICATION_ERROR(-20001, 'Updates are not allowed on the LOG_OPERACAO table.');
END;
/

CREATE OR REPLACE TRIGGER log_operacao_delete_trigger
    BEFORE DELETE ON LOG_OPERACAO
    FOR EACH ROW
BEGIN
    RAISE_APPLICATION_ERROR(-20002, 'Deletions are not allowed on the LOG_OPERACAO table.');
END;
/
```