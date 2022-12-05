--3. Найти книги по заданным критериям (по жанру, по тегам, по автору, по ограничению)
SELECT
    DISTINCT STOCK.BOOK_NAME,
    GENRES.NAME,
    TAGS.TAG_NAME,
    AGE_LIMITS.AGE,
    AUTHORS.NAME,
    AUTHORS.SURNAME,
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
    LEFT JOIN TAG_STOCK
    ON STOCK.ID = TAG_STOCK.STOCK_ID
    LEFT JOIN TAGS
    ON TAGS.ID = TAG_STOCK.TAG_ID
WHERE
    TAGS.TAG_NAME = 'Полиция'
    AND GENRES.NAME = 'Биография'
    AND AUTHORS.NAME = 'Александр'
    AND AUTHORS.SURNAME = 'Солженицын'
    AND AGE > 12;

------------------------------------------------------------------------------------------------------------------------------------------------------------------