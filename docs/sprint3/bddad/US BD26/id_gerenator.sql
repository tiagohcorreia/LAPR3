CREATE OR REPLACE TRIGGER generate_operation_id
BEFORE INSERT ON Operacao_Agricola
FOR EACH ROW

BEGIN
    SELECT NVL(MAX(id), 0) + 1 INTO :NEW.id FROM Operacao_Agricola;
END;
/