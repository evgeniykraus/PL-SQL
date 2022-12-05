--5. Найти ТОП 5 самых читающих пользователей (за заданный период)
SELECT
    READER,
    COUNT,
    RANK
FROM
    (
        SELECT
            LISTAGG(DISTINCT CONCAT(CONCAT(READERS.NAME,
            ' '),
            READERS.SURNAME),
            ', ')                                  AS READER,
            COUNT(JOURNAL.LIBRARY_CARD_ID)         AS COUNT,
            RANK() OVER (
        ORDER BY
            (COUNT(JOURNAL.LIBRARY_CARD_ID)) DESC) AS RANK
        FROM
            JOURNAL
            JOIN READERS
            ON READERS.LIBRARY_CARD = JOURNAL.LIBRARY_CARD_ID
        WHERE
            '21.08.2021' < JOURNAL.RECIVE_DATE
            AND JOURNAL.RECIVE_DATE < '21.09.2023'
        GROUP BY
            READERS.LIBRARY_CARD, READERS.NAME, READERS.SURNAME
    )
GROUP BY
    READER,
    COUNT,
    RANK
HAVING
    RANK < 6;

------------------------------------------------------------------------------------------------------------------------------------------------------------------