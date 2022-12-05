--Пишем  сложные SQL запросы:
--1. Написать запрос поиска всех книг заданного автора (вывести наименование книг, жанра, возрастное ограничение и ФИО автора)
SELECT
    BOOKS.ID,
    STOCK.BOOK_NAME,
    LISTAGG(DISTINCT GENRES.GENER_NAME, ', ') AS GENRE,
    AGE_LIMITS.AGE,
    CONCAT(CONCAT(AUTHORS.NAME, ' '), AUTHORS.SURNAME) AS AUTHOR
FROM
    BOOKS
    JOIN STOCK ON STOCK.ID = BOOKS.STOCK_ID
    JOIN GENRE_STOCK ON STOCK.ID = GENRE_STOCK.STOCK_ID
    JOIN GENRES ON GENRES.ID = GENRE_STOCK.GENRE_ID
    JOIN AUTHOR_STOCK ON STOCK.ID = AUTHOR_STOCK.STOCK_ID
    JOIN AUTHORS ON AUTHORS.ID = AUTHOR_STOCK.AUTHOR_ID
    JOIN AGE_LIMITS ON STOCK.AGE_LIMIT_ID = AGE_LIMITS.ID
WHERE
    AUTHORS.NAME = 'Лев'
    AND AUTHORS.SURNAME = 'Толстой'
GROUP BY
    BOOKS.ID,
    STOCK.BOOK_NAME,
    AGE_LIMITS.AGE,
    CONCAT(CONCAT(AUTHORS.NAME, ' '), AUTHORS.SURNAME);
------------------------------------------------------------------------------------------------------------------------------------------------------------------

--2. Написать запрос поиска всех книг изданных определенным издательством (позже/ранее заданной даты - 
-- вывести наименование книг, жанра, возрастное ограничение, ФИО автора и издательство)
SELECT
    BOOKS.ID,
    STOCK.BOOK_NAME,
    LISTAGG(DISTINCT GENRES.GENER_NAME, ', ') AS GENRE,
    AGE_LIMITS.AGE,
    LISTAGG(
        DISTINCT CONCAT(CONCAT(AUTHORS.NAME, ' '), AUTHORS.SURNAME),
        ', '
    ) AS AUTHOR,
    PUBLISHERS.PUBLISHER_NAME
FROM
    BOOKS
    JOIN STOCK ON STOCK.ID = BOOKS.STOCK_ID
    JOIN GENRE_STOCK ON STOCK.ID = GENRE_STOCK.STOCK_ID
    JOIN GENRES ON GENRES.ID = GENRE_STOCK.GENRE_ID
    JOIN AUTHOR_STOCK ON STOCK.ID = AUTHOR_STOCK.STOCK_ID
    JOIN AUTHORS ON AUTHORS.ID = AUTHOR_STOCK.AUTHOR_ID
    JOIN AGE_LIMITS ON STOCK.AGE_LIMIT_ID = AGE_LIMITS.ID
    JOIN PUBLISHERS ON STOCK.PUBLISHER_ID = PUBLISHERS.ID
WHERE
    PUBLISHERS.PUBLISHER_NAME = 'ИНФРА-М'
    AND STOCK.PUBLICATION_YEAR > 2000
GROUP BY
    BOOKS.ID,
    STOCK.BOOK_NAME,
    AGE_LIMITS.AGE,
    PUBLISHERS.PUBLISHER_NAME;
------------------------------------------------------------------------------------------------------------------------------------------------------------------

--3. Найти книги по заданным критериям (по жанру, по тегам, по автору, по ограничению)
SELECT
    BOOKS.ID,
    STOCK.BOOK_NAME,
    GENRES.GENER_NAME,
    TAGS.TAG_NAME,
    AGE_LIMITS.AGE,
    AUTHORS.NAME,
    AUTHORS.SURNAME,
    PUBLISHERS.PUBLISHER_NAME
FROM
    BOOKS
    JOIN STOCK ON STOCK.ID = BOOKS.STOCK_ID
    JOIN GENRE_STOCK ON STOCK.ID = GENRE_STOCK.STOCK_ID
    JOIN GENRES ON GENRES.ID = GENRE_STOCK.GENRE_ID
    JOIN AUTHOR_STOCK ON STOCK.ID = AUTHOR_STOCK.STOCK_ID
    JOIN AUTHORS ON AUTHORS.ID = AUTHOR_STOCK.AUTHOR_ID
    JOIN AGE_LIMITS ON STOCK.AGE_LIMIT_ID = AGE_LIMITS.ID
    JOIN PUBLISHERS ON STOCK.PUBLISHER_ID = PUBLISHERS.ID
    JOIN TAG_STOCK ON STOCK.ID = TAG_STOCK.STOCK_ID
    JOIN TAGS ON TAGS.ID = TAG_STOCK.TAG_ID
WHERE
    TAGS.TAG_NAME = 'ГУЛАГ'
    AND GENRES.GENER_NAME = 'Роман'
    AND AUTHORS.NAME = 'Александр'
    AND AUTHORS.SURNAME = 'Солженицын'
    AND AGE > 12;
------------------------------------------------------------------------------------------------------------------------------------------------------------------

--4. Найти ТОП 5 самых популярных книг (по кол-ву выдачи)
SELECT
    STOCK.BOOK_NAME,
    COUNT(STOCK.ID) AS COUNT
FROM
    BOOKS
    JOIN JOURNAL ON BOOKS.ID = JOURNAL.BOOK_ID
    JOIN STOCK ON STOCK.ID = BOOKS.STOCK_ID
GROUP BY
    STOCK.BOOK_NAME
ORDER BY
    COUNT DESC
FETCH FIRST
    5 ROWS ONLY;
------------------------------------------------------------------------------------------------------------------------------------------------------------------

--5. Найти ТОП 5 самых читающих пользователей (за заданный период)
SELECT
    READERS.LIBRARY_CARD,
    CONCAT(CONCAT(READERS.NAME, ' '), READERS.SURNAME) AS READER,
    COUNT(JOURNAL.LIBRARY_CARD_ID) AS COUNT
FROM
    JOURNAL
    JOIN READERS ON READERS.LIBRARY_CARD = JOURNAL.LIBRARY_CARD_ID
WHERE
    '21.08.2021' < JOURNAL.RECIVE_DATE
    AND JOURNAL.RECIVE_DATE < '21.09.2023'
GROUP BY
    READERS.LIBRARY_CARD,
    READERS.NAME,
    READERS.SURNAME
ORDER BY
    COUNT DESC
FETCH FIRST
    5 ROWS ONLY;
------------------------------------------------------------------------------------------------------------------------------------------------------------------

--6. Найти список книг которые не могут быть выданы читателю домой
SELECT
    TABLE_2.BOOK_NAME,
    TABLE_2.PUBLICATION_TYPE,
    (TABLE_2.COUNT_2 - NVL(TABLE_1.COUNT_1, 0)) AS COUNT
FROM
    (
        SELECT
            STOCK.BOOK_NAME,
            TYPES.PUBLICATION_TYPE,
            COUNT(JOURNAL.BOOK_ID) AS COUNT_1
        FROM
            BOOKS
            JOIN STOCK ON BOOKS.STOCK_ID = STOCK.ID
            JOIN JOURNAL ON BOOKS.ID = JOURNAL.BOOK_ID
            JOIN TYPES ON STOCK.TYPE_ID = TYPES.ID
        WHERE
            JOURNAL.RETURN_DATE IS NULL
        GROUP BY
            TYPES.PUBLICATION_TYPE,
            STOCK.BOOK_NAME
    ) TABLE_1 FULL
    JOIN (
        SELECT
            STOCK.BOOK_NAME,
            TYPES.PUBLICATION_TYPE,
            COUNT(BOOKS.STOCK_ID) AS COUNT_2
        FROM
            BOOKS
            JOIN STOCK ON BOOKS.STOCK_ID = STOCK.ID
            JOIN TYPES ON STOCK.TYPE_ID = TYPES.ID
        GROUP BY
            TYPES.PUBLICATION_TYPE,
            STOCK.BOOK_NAME
    ) TABLE_2 ON TABLE_1.BOOK_NAME = TABLE_2.BOOK_NAME
WHERE
    (TABLE_2.COUNT_2 - NVL(TABLE_1.COUNT_1, 0)) < 2
    OR TABLE_2.PUBLICATION_TYPE != 'Книга';
------------------------------------------------------------------------------------------------------------------------------------------------------------------

--7. Запрос который покажет может ли читатель почитать/получить желаемую книгу
SELECT
    TABLE_2.BOOK_NAME,
    TABLE_2.BOOK_VALUE,
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
        WHEN (
            (TABLE_2.COUNT_2 - NVL(TABLE_1.COUNT_1, 0)) > 0
            OR TYPE = 'Книга'
        )
        AND READERS.BLACK_LIST = 0
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
    END AS READ_HERE,
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
            CONCAT(CONCAT(AUTHORS.NAME, ' '), AUTHORS.SURNAME) AS AUTHOR,
            STOCK.PUBLICATION_YEAR,
            STOCK.COST,
            AGE_LIMITS.AGE,
            ROUND(STOCK.COST / STOCK.AMOUNT * BOOKS.CONDITION) AS BOOK_VALUE
        FROM
            BOOKS
            JOIN STOCK ON BOOKS.STOCK_ID = STOCK.ID
            JOIN TYPES ON TYPES.ID = STOCK.TYPE_ID
            JOIN AUTHOR_STOCK ON STOCK.ID = AUTHOR_STOCK.STOCK_ID
            JOIN AUTHORS ON AUTHOR_STOCK.AUTHOR_ID = AUTHORS.ID
            JOIN AGE_LIMITS ON AGE_LIMITS.ID = STOCK.AGE_LIMIT_ID
        GROUP BY
            STOCK.BOOK_NAME,
            TYPES.PUBLICATION_TYPE,
            AUTHORS.NAME,
            AUTHORS.SURNAME,
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
    SURNAME = 'Овчинников';
------------------------------------------------------------------------------------------------------------------------------------------------------------------

--8. Вывести список просроченных книг и их держателей со сроком просрочки
SELECT
    BOOK_ID,
    STOCK.BOOK_NAME,
    READERS.LIBRARY_CARD,
    CONCAT(CONCAT(READERS.NAME, ' '), READERS.SURNAME) AS READER,
    (ROUND((SYSDATE - RECIVE_DATE), 0)) - 14 AS DEBTS
FROM
    JOURNAL
    JOIN READERS ON JOURNAL.LIBRARY_CARD_ID = READERS.LIBRARY_CARD
    JOIN BOOKS ON JOURNAL.BOOK_ID = BOOKS.ID
    JOIN STOCK ON STOCK.ID = BOOKS.STOCK_ID
WHERE
    (ROUND((SYSDATE - RECIVE_DATE), 0)) - 14 > 0
    AND RETURN_DATE IS NULL;
------------------------------------------------------------------------------------------------------------------------------------------------------------------

--9. Вывести список неблагонадежных читателей
SELECT
    DISTINCT READERS.LIBRARY_CARD,
    CONCAT(CONCAT(READERS.NAME, ' '), READERS.SURNAME) AS READER
FROM
    READERS
    LEFT JOIN JOURNAL ON READERS.LIBRARY_CARD = JOURNAL.LIBRARY_CARD_ID
WHERE
    READERS.BLACK_LIST = 1
    OR JOURNAL.RETURN_DATE IS NULL
------------------------------------------------------------------------------------------------------------------------------------------------------------------

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