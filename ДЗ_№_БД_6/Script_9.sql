--9. Вывести список неблагонадежных читателей
SELECT DISTINCT
    READERS.LIBRARY_CARD,
    CONCAT(CONCAT(READERS.NAME, ' '), READERS.SURNAME) AS READER
FROM
    READERS
    LEFT JOIN JOURNAL ON READERS.LIBRARY_CARD = JOURNAL.LIBRARY_CARD_ID
WHERE
    READERS.BLACK_LIST = 1 
    OR ROUND((SYSDATE - JOURNAL.RECIVE_DATE), 0) > 14 
    OR READERS.RATING < 200;
------------------------------------------------------------------------------------------------------------------------------------------------------------------