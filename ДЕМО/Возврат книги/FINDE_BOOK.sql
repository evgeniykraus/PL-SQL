CREATE OR REPLACE FUNCTION FINDE_BOOK (
    V_BOOK_ID IN NUMBER
) RETURN NUMBER IS
    V_RESULT       NUMBER;
BEGIN

    SELECT
        COUNT(*) INTO V_RESULT
    FROM
        BOOKS
    WHERE
        ID = V_BOOK_ID;

    IF V_RESULT = 0 THEN
    RETURN -1;
    END IF;

    SELECT
        COUNT(*) INTO V_RESULT
    FROM
        JOURNAL
    WHERE
        BOOK_ID = V_BOOK_ID
        AND RETURN_DATE IS NULL;
    RETURN V_RESULT;

END FINDE_BOOK;