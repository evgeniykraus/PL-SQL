--Создаем метод, возвращающий отчет об инвентаризации в разрезе каждой книги (Когда поступила на склад, когда и кто её брал и вернул, когда была утрачена)
DECLARE
    RC SYS_REFCURSOR;
BEGIN
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
            BOOKS.ID = 1;
    DBMS_SQL.RETURN_RESULT(RC);
END;