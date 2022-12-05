--4. Найти ТОП 5 самых популярных книг (по кол-ву выдачи)
SELECT
    BOOK_NAME,
    RANK,
    COUNT
FROM
    (
        SELECT
            STOCK.BOOK_NAME,
            COUNT (STOCK.BOOK_NAME)        AS COUNT,
            RANK() OVER (
        ORDER BY
            (COUNT(STOCK.BOOK_NAME)) DESC) AS RANK
        FROM
            BOOKS
            JOIN JOURNAL
            ON JOURNAL.BOOK_ID = BOOKS.ID JOIN STOCK
            ON STOCK.ID = BOOKS.STOCK_ID
        GROUP BY
            STOCK.BOOK_NAME
    )
WHERE
    RANK < 6    
GROUP BY
BOOK_NAME,
    RANK,
    COUNT
ORDER BY
    RANK;

------------------------------------------------------------------------------------------------------------------------------------------------------------------