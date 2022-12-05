--8. Вывести список просроченных книг и их держателей со сроком просрочки
SELECT
    BOOK_ID,
    STOCK.BOOK_NAME,
    READERS.LIBRARY_CARD,
    CONCAT(CONCAT(READERS.NAME, ' '), READERS.SURNAME) AS READER,
    (ROUND(SYSDATE) - ROUND(RECIVE_DATE)) - 30 AS DEBTS
FROM
    JOURNAL
    JOIN READERS ON JOURNAL.LIBRARY_CARD_ID = READERS.LIBRARY_CARD
    JOIN BOOKS ON JOURNAL.BOOK_ID = BOOKS.ID
    JOIN STOCK ON STOCK.ID = BOOKS.STOCK_ID
WHERE
    (ROUND(SYSDATE) - ROUND(RECIVE_DATE)) - 30 > 0
    AND RETURN_DATE IS NULL;
------------------------------------------------------------------------------------------------------------------------------------------------------------------