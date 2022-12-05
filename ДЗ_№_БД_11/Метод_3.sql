--Создаем метод по проверке может ли читатель взять книгу (кейсы: плохой рейтинг у читателя,
--читатель уже взял эту книгу, книга не подходит по возрасту и т.д.)  - Анонимный PL/SQL блок.
DECLARE
    E_CHECK_BOOK EXCEPTION;
    E_CHECK_READER EXCEPTION;
    V_ERROR_CODE   NUMBER;
    V_ERROR_MESAGE VARCHAR2(100);
    V_CHECK_BOOK   NUMBER;
    V_CHECK_READER NUMBER;
    V_USER_NAME    VARCHAR2(400) := 'Артём Лосев';
    V_USER_ID      NUMBER := 23;
    V_BOOK_NAME    VARCHAR2(400) := 'Архипелаг ГУЛАГ';
    V_RESOLVE      VARCHAR2(400);
    V_RESULT       NUMBER := 0;
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
    SELECT
        COUNT(*) INTO V_CHECK_READER
    FROM
        READERS
    WHERE
        LIBRARY_CARD = V_USER_ID
        OR CONCAT(CONCAT (NAME,
        ' '),
        SURNAME) = V_USER_NAME;
    IF V_CHECK_READER = 0 THEN
        RAISE E_CHECK_READER;
    END IF;
    SELECT
        COUNT(*) INTO V_CHECK_BOOK
    FROM
        STOCK
    WHERE
        BOOK_NAME = V_BOOK_NAME;
    IF V_CHECK_BOOK = 0 THEN
        RAISE E_CHECK_READER;
    END IF;
    OPEN C_TAKE_A_BOOK_CURSOR;
    LOOP
        FETCH C_TAKE_A_BOOK_CURSOR INTO V_RESOLVE;
        EXIT WHEN C_TAKE_A_BOOK_CURSOR % NOTFOUND;
        IF V_RESOLVE = 'Yes' THEN
            V_RESULT := 1;
            EXIT;
        END IF;
    END LOOP;
    CLOSE C_TAKE_A_BOOK_CURSOR;
    IF V_RESULT = 1 THEN
        DBMS_OUTPUT.PUT_LINE('Можно выдавать!');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Не выдавать!');
    END IF;
EXCEPTION
    WHEN E_CHECK_READER THEN
        DBMS_OUTPUT.PUT_LINE('Читатель "'
            || V_USER_NAME
            || '" не зарегистрирован в библиотеке!');
    WHEN E_CHECK_BOOK THEN
        DBMS_OUTPUT.PUT_LINE('Книги "'
            || V_BOOK_NAME
            || '" никогда не было в библиотеке!');
    WHEN OTHERS THEN
        V_ERROR_CODE := SQLCODE;
        V_ERROR_MESAGE := SQLERRM;
        DBMS_OUTPUT.PUT_LINE(V_ERROR_CODE);
        DBMS_OUTPUT.PUT_LINE(V_ERROR_MESAGE);
        DBMS_OUTPUT.PUT_LINE('Какая-то ошибка');
END;