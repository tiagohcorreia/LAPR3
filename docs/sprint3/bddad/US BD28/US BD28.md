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
-- USBD28 - Anular, não apagar Operação Agrícola

CREATE OR REPLACE FUNCTION anular_operacao(p_operacao_id NUMBER)
    RETURN NUMBER IS
    returnValue NUMBER := 0;
BEGIN
    -- Anular a operação
    UPDATE OPERACAO_AGRICOLA SET validade = 0 WHERE id = p_operacao_id;
    COMMIT;

    RETURN 1; -- Operação anulada com sucesso
END;
/
```