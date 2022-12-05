--2. Написать запрос поиска всех книг изданных определенным издательством (позже/ранее заданной даты -
-- вывести наименование книг, жанра, возрастное ограничение, ФИО автора и издательство)
SELECT
    DISTINCT STOCK.BOOK_NAME,
    LISTAGG(DISTINCT GENRES.GENER_NAME,
    ', ')  AS GENRE,
    AGE_LIMITS.AGE,
    LISTAGG( DISTINCT CONCAT(CONCAT(AUTHORS.NAME,
    ' '),
    AUTHORS.SURNAME),
    ', ' ) AS AUTHOR,
    PUBLISHERS.PUBLISHER_NAME
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
    LEFT JOIN PUBLISHERS
    ON STOCK.PUBLISHER_ID = PUBLISHERS.ID
WHERE
    PUBLISHERS.PUBLISHER_NAME = 'ИНФРА-М'
    AND STOCK.PUBLICATION_YEAR > 2000
GROUP BY
    STOCK.BOOK_NAME,
    AGE_LIMITS.AGE,
    PUBLISHERS.PUBLISHER_NAME;

------------------------------------------------------------------------------------------------------------------------------------------------------------------