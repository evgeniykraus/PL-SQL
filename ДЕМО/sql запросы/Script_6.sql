--Найти список книг которые не могут быть выданы читателю домой
SELECT * FROM
(SELECT
    DISTINCT TABLE_2.BOOK_NAME,
    (TABLE_2.COUNT_2 - NVL(TABLE_1.COUNT_1, 0)) AS AMOUNT,
    TABLE_2.TYPE,
    TABLE_2.AUTHOR,
    TABLE_2.PUBLICATION_YEAR,
    TABLE_2.COST,
    TABLE_2.AGE AS AGE_LIMIT,
    CONCAT(CONCAT(READERS.NAME, ' '), READERS.SURNAME) AS READER,
    (
        EXTRACT(
            YEAR
            FROM
                SYSDATE
        ) - EXTRACT(
            YEAR
            FROM
                READERS.BIRTHD_DATE
        )
    ) AS AGE,
    READERS.RATING,
    READERS.BLACK_LIST,
    CASE
        WHEN TABLE_2.TYPE = 'Книга'
        AND (TABLE_2.COUNT_2 - NVL(TABLE_1.COUNT_1, 0)) > 1
        AND READERS.RATING > TABLE_2.BOOK_VALUE
        AND READERS.BLACK_LIST < 1
        AND (
            EXTRACT(
                YEAR
                FROM
                    SYSDATE
            ) - EXTRACT(
                YEAR
                FROM
                    READERS.BIRTHD_DATE
            )
        ) > TABLE_2.AGE THEN 'Yes'
        ELSE 'No'
    END AS TAKE_AWAY
FROM
    READERS,
    (
        SELECT
            STOCK.BOOK_NAME,
            COUNT(JOURNAL.BOOK_ID) AS COUNT_1
        FROM
            BOOKS
            JOIN STOCK ON BOOKS.STOCK_ID = STOCK.ID
            JOIN JOURNAL ON BOOKS.ID = JOURNAL.BOOK_ID
        WHERE
            JOURNAL.RETURN_DATE IS NULL
        GROUP BY
            STOCK.BOOK_NAME
    ) TABLE_1 FULL
    JOIN (
        SELECT
            STOCK.BOOK_NAME,
            COUNT(BOOKS.STOCK_ID) AS COUNT_2,
            TYPES.PUBLICATION_TYPE AS TYPE,
            LISTAGG(DISTINCT CONCAT(CONCAT(AUTHORS.NAME, ' '), AUTHORS.SURNAME), ', ') AS AUTHOR,
            STOCK.PUBLICATION_YEAR,
            STOCK.COST,
            AGE_LIMITS.AGE,
            ROUND(STOCK.COST / STOCK.AMOUNT * BOOKS.CONDITION) AS BOOK_VALUE
        FROM
            BOOKS
            LEFT JOIN STOCK ON BOOKS.STOCK_ID = STOCK.ID
            LEFT JOIN TYPES ON TYPES.ID = STOCK.TYPE_ID
            LEFT JOIN AUTHOR_STOCK ON STOCK.ID = AUTHOR_STOCK.STOCK_ID
            LEFT JOIN AUTHORS ON AUTHOR_STOCK.AUTHOR_ID = AUTHORS.ID
            LEFT JOIN AGE_LIMITS ON AGE_LIMITS.ID = STOCK.AGE_LIMIT_ID
        GROUP BY
            STOCK.BOOK_NAME,
            TYPES.PUBLICATION_TYPE,
            STOCK.PUBLICATION_YEAR,
            STOCK.COST,
            AGE_LIMITS.AGE,
            STOCK.COST,
            STOCK.AMOUNT,
            BOOKS.CONDITION
    ) TABLE_2 ON TABLE_1.BOOK_NAME = TABLE_2.BOOK_NAME
GROUP BY
    TABLE_2.BOOK_NAME,
    TABLE_2.COUNT_2,
    TABLE_1.COUNT_1,
    TABLE_2.TYPE,
    TABLE_2.AUTHOR,
    TABLE_2.PUBLICATION_YEAR,
    TABLE_2.COST,
    TABLE_2.AGE,
    READERS.SURNAME,
    TABLE_2.BOOK_VALUE,
    READERS.SURNAME,
    (
        EXTRACT(
            YEAR
            FROM
                SYSDATE
        ) - EXTRACT(
            YEAR
            FROM
                READERS.BIRTHD_DATE
        )
    ),
    READERS.RATING,
    READERS.BLACK_LIST,
    READERS.NAME
HAVING
    SURNAME = 'Кудряшов' AND
    NAME = 'Ярослав')
WHERE TAKE_AWAY = 'No'
------------------------------------------------------------------------------------------------------------------------------------------------------------------