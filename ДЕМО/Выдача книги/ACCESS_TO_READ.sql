CREATE OR REPLACE FUNCTION ACCESS_TO_READ (
    V_LIBRARY_CARD IN NUMBER,
    V_BOOK_NAME IN VARCHAR2
) RETURN NUMBER IS
    V_RESULT       NUMBER;
    V_ERROR_CODE   NUMBER;
    V_ERROR_MESAGE VARCHAR2(100);
BEGIN
    SELECT
        TABLE_2.ID INTO V_RESULT
    FROM
        (
            SELECT
                DISTINCT TABLE_1.*,
                READERS.LIBRARY_CARD,
                CONCAT(CONCAT(READERS.NAME,
                ' '),
                READERS.SURNAME) AS READER,
                READERS.BIRTHD_DATE,
                READERS.RATING,
                CASE
                    WHEN ( TABLE_1.AMOUNT > 0
                    OR TYPE_ID = 1 ) AND READERS.BLACK_LIST = 0 AND ( EXTRACT( YEAR FROM SYSDATE ) - EXTRACT( YEAR FROM READERS.BIRTHD_DATE ) ) >= TABLE_1.AGE THEN
                        'Yes'
                    ELSE
                        'No'
                END              AS READ_HERE
            FROM
                BOOKS,
                (
                    SELECT
                        BOOKS.ID,
                        BOOK_NAME,
                        AMOUNT,
                        ROUND(COST/AMOUNT*PUBLICATION_YEAR/1000+400) AS VALUE,
                        AGE_LIMITS.AGE,
                        STOCK.TYPE_ID
                    FROM
                        STOCK
                        LEFT JOIN AGE_LIMITS
                        ON STOCK.AGE_LIMIT_ID = AGE_LIMITS.ID
                        LEFT JOIN BOOKS
                        ON BOOKS.STOCK_ID = STOCK.ID
                ) TABLE_1,
                READERS
        ) TABLE_2
        LEFT JOIN JOURNAL
        ON JOURNAL.BOOK_ID = TABLE_2.ID
    WHERE
        LIBRARY_CARD = V_LIBRARY_CARD
        AND BOOK_NAME = V_BOOK_NAME
        AND READ_HERE = 'Yes'
        AND TABLE_2.ID NOT IN (
            SELECT
                JOURNAL.BOOK_ID
            FROM
                JOURNAL
            WHERE
                JOURNAL.RETURN_DATE IS NULL
        )
    ORDER BY
        ID,
        TABLE_2.ID FETCH FIRST 1 ROWS ONLY;
    RETURN V_RESULT;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN 0;
    WHEN OTHERS THEN
        V_ERROR_CODE := SQLCODE;
        V_ERROR_MESAGE := SQLERRM;
END ACCESS_TO_READ;