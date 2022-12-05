CREATE OR REPLACE FUNCTION CHECK_TYPE (
    V_TYPE IN VARCHAR2
) RETURN NUMBER IS
    V_TYPE_ID      NUMBER;
    V_ERROR_CODE   NUMBER;
    V_ERROR_MESAGE VARCHAR2(100);
BEGIN
    SELECT
        TYPES.ID INTO V_TYPE_ID
    FROM
        TYPES
    WHERE
        PUBLICATION_TYPE = V_TYPE;
    RETURN V_TYPE_ID;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN 0;
    WHEN OTHERS THEN
        V_ERROR_CODE := SQLCODE;
        V_ERROR_MESAGE := SQLERRM;
END CHECK_TYPE;