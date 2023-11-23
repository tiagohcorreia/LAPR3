CREATE OR REPLACE FUNCTION fncVariedades
RETURN SYS_REFCURSOR IS
    v_cursor SYS_REFCURSOR;
BEGIN
OPEN v_cursor FOR
SELECT * FROM Variedade ORDER BY id;
RETURN v_cursor;
END fncVariedades;
/
