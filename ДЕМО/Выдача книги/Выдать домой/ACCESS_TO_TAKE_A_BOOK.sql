CREATE OR REPLACE FUNCTION ACCESS_TO_TAKE_A_BOOK (
    V_LIBRARY_CARD IN NUMBER,
    V_BOOK_NAME IN VARCHAR2
) RETURN NUMBER IS
    V_RESULT       VARCHAR2(100) := '0';
    V_ID_BOOK      NUMBER := -2;
    V_ERROR_CODE   NUMBER;
    V_ERROR_MESAGE VARCHAR2(100);
    C_ID_BOOK      NUMBER;
    C_RESULT       VARCHAR2(100);
    CURSOR C_RES_CURSOR IS
        SELECT
            TABLE_2.ID,
            TABLE_2.TAKE_AWAY
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
                        WHEN TABLE_1.TYPE_ID = 1 AND TABLE_1.AMOUNT > 1 AND READERS.RATING > TABLE_1.VALUE AND READERS.BLACK_LIST < 1 AND ( EXTRACT( YEAR FROM SYSDATE ) - EXTRACT( YEAR FROM READERS.BIRTHD_DATE ) ) > TABLE_1.AGE THEN
                            'Yes'
                        ELSE
                            'No'
                    END              AS TAKE_AWAY
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
            AND TABLE_2.ID NOT IN (
                SELECT
                    JOURNAL.BOOK_ID
                FROM
                    JOURNAL
            )
        ORDER BY
            TABLE_2.ID FETCH FIRST 1 ROWS ONLY;
BEGIN
    OPEN C_RES_CURSOR;
    LOOP
        FETCH C_RES_CURSOR INTO C_ID_BOOK, C_RESULT;
        EXIT WHEN C_RES_CURSOR % NOTFOUND;
        V_ID_BOOK := C_ID_BOOK;
        V_RESULT := C_RESULT;
        CLOSE C_RES_CURSOR;
    END LOOP;
    CLOSE C_RES_CURSOR;
    IF V_ID_BOOK != 0 AND V_RESULT = 'Yes' THEN
        RETURN V_ID_BOOK;
    ELSIF V_ID_BOOK != 0 AND V_RESULT = 'No' THEN
        RETURN -1;
    ELSIF V_ID_BOOK != -2 THEN
        RETURN -2;
    ELSE
        RETURN 0;
    END IF;
END ACCESS_TO_TAKE_A_BOOK;