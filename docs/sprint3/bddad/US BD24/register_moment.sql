CREATE OR REPLACE TRIGGER register_moment
BEFORE INSERT ON Operacao_Agricola
FOR EACH ROW

BEGIN
    :NEW.instante_registo := CURRENT_TIMESTAMP;
END;
/
