-- Создаем метод, возвращающий таблицу вернувшихся книг за определенный день

DECLARE
    V_DATE      DATE := '1.09.22';
    V_BOOK_NAME VARCHAR2(100);
    V_COUNT     NUMBER;
    C_RESULT    SYS_REFCURSOR;
BEGIN
    OPEN C_RESULT FOR
        SELECT
            ROUND(JOURNAL.RETURN_DATE) AS "DATE",
            STOCK.BOOK_NAME,
            COUNT(JOURNAL.BOOK_ID)     AS COUNT
        FROM
            STOCK
            JOIN BOOKS
            ON BOOKS.STOCK_ID = STOCK.ID JOIN JOURNAL
            ON JOURNAL.BOOK_ID = BOOKS.ID
        WHERE
            V_DATE = TRUNC((RETURN_DATE),
            'DDD')
        GROUP BY
            STOCK.BOOK_NAME,
            JOURNAL.RETURN_DATE;
    DBMS_SQL.RETURN_RESULT(C_RESULT);
END;