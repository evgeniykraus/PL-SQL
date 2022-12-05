--Пишем  SQL запросы которые показывают:
-- 1. Информацию по всем пользователям зарегистрированных в системе
SELECT
    *
FROM
    READERS;

-- 2. Информацию по всем пользователям относящихся к определенной возрастной группе
SELECT
    *
FROM
    READERS
WHERE
    (SYSDATE - BIRTHD_DATE) / 365 < 30
    AND (SYSDATE - BIRTHD_DATE) / 366 < 30;

-- 3. Информацию по конкретному пользователю
SELECT
    *
FROM
    READERS
WHERE
    LIBRARY_CARD = 13;

-- 4. Информацию по всем печатным материалам
SELECT
    BOOKS.*,
    STOCK.BOOK_NAME,
    STOCK.PUBLICATION_YEAR,
    STOCK.COST,
    STOCK.DESCRIPTION
FROM
    BOOKS
    JOIN STOCK
    ON STOCK.ID = BOOKS.STOCK_ID;

-- 5. Информацию по всем печатным материалам относящихся к определенному типу
SELECT
    PUBLICATION_TYPE,
    STOCK.*
FROM
    STOCK
    JOIN TYPES
    ON STOCK.TYPE_ID = TYPES.ID
WHERE
    TYPES.PUBLICATION_TYPE = 'Книга';

-- 6. Информацию по конкретному печатному материалу
SELECT
    BOOKS.*,
    STOCK.BOOK_NAME,
    STOCK.PUBLICATION_YEAR,
    STOCK.COST,
    STOCK.DESCRIPTION
FROM
    BOOKS
    JOIN STOCK
    ON STOCK.ID = BOOKS.STOCK_ID
WHERE
    BOOKS.ID = 13;

-- 7. Информацию по всем жанрам отсортированных в алфавитном порядке
SELECT
    *
FROM
    GENRES
ORDER BY
    GENER_NAME;

--Информацию по всем существующим возрастным ограничениям отсортированных по возрасту в порядке возрастания
SELECT
    *
FROM
    AGE_LIMITS
ORDER BY
    AGE;

--Вывести идентификаторы пользователей находящихся в черном списке
SELECT
    LIBRARY_CARD
FROM
    READERS
WHERE
    BLACK_LIST = 1;