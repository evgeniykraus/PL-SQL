--1. Написать запрос поиска всех книг заданного автора (вывести наименование книг, жанра, возрастное ограничение и ФИО автора)
SELECT
    DISTINCT STOCK.BOOK_NAME,
    LISTAGG(DISTINCT GENRES.NAME,
    ', ') AS GENRE,
    AGE_LIMITS.AGE,
    LISTAGG(DISTINCT CONCAT(CONCAT(AUTHORS.NAME,
    ' '),
    AUTHORS.SURNAME),
    ', ') AS AUTHOR
FROM
    BOOKS
    LEFT JOIN STOCK
    ON STOCK.ID = BOOKS.STOCK_ID
    LEFT JOIN GENRE_STOCK
    ON STOCK.ID = GENRE_STOCK.STOCK_ID
    LEFT JOIN GENRES
    ON GENRES.ID = GENRE_STOCK.GENRE_ID
    LEFT JOIN AUTHOR_STOCK
    ON STOCK.ID = AUTHOR_STOCK.STOCK_ID
    LEFT JOIN AUTHORS
    ON AUTHORS.ID = AUTHOR_STOCK.AUTHOR_ID
    LEFT JOIN AGE_LIMITS
    ON STOCK.AGE_LIMIT_ID = AGE_LIMITS.ID
WHERE
    AUTHORS.NAME = 'Джоан'
    AND AUTHORS.SURNAME = 'Роулинг'
GROUP BY
    STOCK.BOOK_NAME,
    AGE_LIMITS.AGE;

------------------------------------------------------------------------------------------------------------------------------------------------------------------