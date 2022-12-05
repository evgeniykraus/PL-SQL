--Создаем метод по проверке может ли читатель взять книгу (кейсы: плохой рейтинг у читателя,
--читатель уже взял эту книгу, книга не подходит по возрасту и т.д.)  - Анонимный PL/SQL блок.
DECLARE
    V_USER_NAME VARCHAR2(400) := 'Артём	Лосев';
    V_USER_ID   NUMBER := 23;
    V_BOOK_NAME VARCHAR2(400) := 'Архипелаг ГУЛАГ';
    V_RESOLVE   VARCHAR2(400);
    V_RESULT    NUMBER := 0;
    CURSOR C_TAKE_A_BOOK_CURSOR IS
        SELECT
            TABLE_2.READ_HERE
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
                    END              AS READ_HERE,
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
            (READER = V_USER_NAME
            OR LIBRARY_CARD = V_USER_ID)
            AND BOOK_NAME = V_BOOK_NAME
            AND TABLE_2.ID NOT IN (
                SELECT
                    JOURNAL.BOOK_ID
                FROM
                    JOURNAL
            )
        ORDER BY
            TABLE_2.ID;
BEGIN
    OPEN C_TAKE_A_BOOK_CURSOR;
    LOOP
        FETCH C_TAKE_A_BOOK_CURSOR INTO V_RESOLVE;
        EXIT WHEN C_TAKE_A_BOOK_CURSOR % NOTFOUND;
        IF V_RESOLVE = 'Yes' THEN
            V_RESULT := 1;
        END IF;
    END LOOP;
    CLOSE C_TAKE_A_BOOK_CURSOR;
    IF V_RESULT = 1 THEN
        DBMS_OUTPUT.PUT_LINE('Можно выдавать!');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Не выдавать!');
    END IF;
END;