CREATE OR REPLACE FUNCTION funcFatores
    RETURN SYS_REFCURSOR IS
    v_cursor SYS_REFCURSOR;
BEGIN
    OPEN v_cursor FOR
        SELECT *
        FROM FATOR_PRODUCAO
        ORDER BY id;
    RETURN v_cursor;
END funcFatores;