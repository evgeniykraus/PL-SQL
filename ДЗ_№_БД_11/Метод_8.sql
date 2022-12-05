--Создаем метод, возвращающий отчет об инвентаризации в разрезе каждой книги (Когда поступила на склад, когда и кто её брал и вернул, когда была утрачена)
DECLARE
    RC             SYS_REFCURSOR;
    V_BOOK_ID      NUMBER := 2;
    E_CHECK_BOOK EXCEPTION;
    V_CHECK_BOOK   NUMBER;
    V_ERROR_CODE   NUMBER;
    V_ERROR_MESAGE VARCHAR2(100);
BEGIN
    SELECT
        COUNT(*) INTO V_CHECK_BOOK
    FROM
        BOOKS
    WHERE
        ID = V_BOOK_ID;
    IF V_CHECK_BOOK = 0 THEN
        RAISE E_CHECK_BOOK;
    END IF;
    OPEN RC FOR
        SELECT
            BOOKS.ID,
            STOCK.BOOK_NAME,
            ROUND (STOCK.RECEIPT_DATE)  AS R_DATE,
            PUBLICATION_YEAR            AS YEAR,
            PUBLISHERS.PUBLISHER_NAME   AS PUBLISHER,
            TYPES.PUBLICATION_TYPE,
            READERS.LIBRARY_CARD,
            ROUND(REGISTRATION_DATE)    AS REG_DATE,
            CONCAT(CONCAT(READERS.SURNAME,
            ' '),
            READERS.SURNAME)            AS READER,
            ROUND (JOURNAL.RECIVE_DATE) AS RECIVE,
            ROUND (JOURNAL.RETURN_DATE) AS "RETURN"
        FROM
            STOCK
            JOIN TYPES
            ON STOCK.TYPE_ID = TYPES.ID JOIN PUBLISHERS
            ON STOCK.PUBLISHER_ID = PUBLISHERS.ID
            JOIN BOOKS
            ON STOCK.ID = BOOKS.STOCK_ID LEFT JOIN JOURNAL
            ON BOOKS.ID = JOURNAL.BOOK_ID
            LEFT JOIN READERS
            ON READERS.LIBRARY_CARD = JOURNAL.LIBRARY_CARD_ID
        WHERE
            BOOKS.ID = V_BOOK_ID;
    DBMS_SQL.RETURN_RESULT(RC);
EXCEPTION
    WHEN E_CHECK_BOOK THEN
        DBMS_OUTPUT.PUT_LINE( 'Книги c ID "'
            || V_BOOK_ID
            || '" никогда не было в библиотеке!' );
    WHEN OTHERS THEN
        V_ERROR_CODE := SQLCODE;
        V_ERROR_MESAGE := SQLERRM;
        DBMS_OUTPUT.PUT_LINE(V_ERROR_CODE);
        DBMS_OUTPUT.PUT_LINE(V_ERROR_MESAGE);
        DBMS_OUTPUT.PUT_LINE('Какая-то ошибка');
END;