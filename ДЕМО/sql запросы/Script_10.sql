--10. Найти книгу похожую на ранее прочитанную
SELECT
    STOCK.ID,
    STOCK.BOOK_NAME,
    LISTAGG(DISTINCT GENRES.NAME, ', ') AS TYPE,
    LISTAGG(DISTINCT TAGS.TAG_NAME, ', ') AS TAG
FROM
    STOCK
    JOIN GENRE_STOCK ON STOCK.ID = GENRE_STOCK.STOCK_ID
    JOIN GENRES ON GENRES.ID = GENRE_STOCK.GENRE_ID
    JOIN TYPES ON TYPES.ID = STOCK.TYPE_ID
    JOIN TAG_STOCK ON STOCK.ID = TAG_STOCK.STOCK_ID
    JOIN TAGS ON TAGS.ID = TAG_STOCK.TAG_ID
WHERE
    TAGS.TAG_NAME IN (
        SELECT
            TAGS.TAG_NAME
        FROM
            STOCK
            JOIN TYPES ON TYPES.ID = STOCK.TYPE_ID
            JOIN TAG_STOCK ON STOCK.ID = TAG_STOCK.STOCK_ID
            JOIN TAGS ON TAGS.ID = TAG_STOCK.TAG_ID
        WHERE
            STOCK.BOOK_NAME LIKE 'Гарри Поттер и философский камень'
    )
    OR GENRES.NAME IN (
        SELECT
            GENRES.NAME
        FROM
            STOCK
            JOIN GENRE_STOCK ON STOCK.ID = GENRE_STOCK.STOCK_ID
            JOIN GENRES ON GENRES.ID = GENRE_STOCK.GENRE_ID
        WHERE
            STOCK.BOOK_NAME LIKE 'Гарри Поттер и философский камень'
    )
GROUP BY
    STOCK.ID,
    STOCK.BOOK_NAME,
    GENRES.NAME
HAVING
    STOCK.BOOK_NAME != 'Гарри Поттер и философский камень' 
------------------------------------------------------------------------------------------------------------------------------------------------------------------