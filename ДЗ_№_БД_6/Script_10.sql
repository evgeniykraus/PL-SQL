--10. Найти книгу похожую на ранее прочитанную
SELECT
    STOCK.ID,
    STOCK.BOOK_NAME,
    LISTAGG(DISTINCT GENRES.GENER_NAME, ', ') AS TYPE,
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
            STOCK.BOOK_NAME LIKE 'Война и мир'
    )
    OR GENRES.GENER_NAME IN (
        SELECT
            GENRES.GENER_NAME
        FROM
            STOCK
            JOIN GENRE_STOCK ON STOCK.ID = GENRE_STOCK.STOCK_ID
            JOIN GENRES ON GENRES.ID = GENRE_STOCK.GENRE_ID
        WHERE
            STOCK.BOOK_NAME LIKE 'Война и мир'
    )
GROUP BY
    STOCK.ID,
    STOCK.BOOK_NAME,
    GENRES.GENER_NAME
HAVING
    STOCK.BOOK_NAME != 'Война и мир' 
------------------------------------------------------------------------------------------------------------------------------------------------------------------