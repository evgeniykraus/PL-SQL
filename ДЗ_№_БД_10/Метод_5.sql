-- Создаем метод по возврату книги читателем

DECLARE
    V_RETURN_DATE  TIMESTAMP := SYSDATE;
    V_LIBRARY_CARD NUMBER := 13;
    V_BOOK_RATING  NUMBER(1) := 1;
    V_EMPLOYEE_ID  NUMBER := 3;
    V_BOOK_ID      NUMBER := 3;
    V_BOOK_NAME    VARCHAR2(100);
    V_BOOK_AMOUNT  NUMBER;
    V_RESULT       NUMBER :=0;
    CURSOR C_JOURNAL_CURSOR IS
        SELECT
            LIBRARY_CARD_ID
        FROM
            JOURNAL
        WHERE
            LIBRARY_CARD_ID = V_LIBRARY_CARD
            AND BOOK_ID = V_BOOK_ID
            AND RETURN_DATE IS NULL;
    C_LIBRARY_CARD NUMBER;
    C_BOOK_ID      TIMESTAMP;
BEGIN
    OPEN C_JOURNAL_CURSOR;
    LOOP
        FETCH C_JOURNAL_CURSOR INTO C_LIBRARY_CARD;
        EXIT WHEN C_JOURNAL_CURSOR % NOTFOUND;
        IF C_LIBRARY_CARD = V_LIBRARY_CARD THEN
            V_RESULT := 1;
            EXIT;
        END IF;
    END LOOP;
    CLOSE C_JOURNAL_CURSOR;
    IF V_RESULT = 1 THEN
        UPDATE JOURNAL
        SET
            RETURN_DATE = V_RETURN_DATE,
            BOOK_RATING = V_BOOK_RATING,
            EMPLOYEES_ID = V_EMPLOYEE_ID
        WHERE
            JOURNAL.BOOK_ID = V_BOOK_ID
            AND LIBRARY_CARD_ID = V_LIBRARY_CARD
            AND RETURN_DATE IS NULL;
        UPDATE STOCK
        SET
            AMOUNT = AMOUNT +1
        WHERE
            STOCK.ID IN (
                SELECT STOCK.ID FROM BOOKS JOIN STOCK ON BOOKS.STOCK_ID = STOCK.ID WHERE BOOKS.ID = V_BOOK_ID
            );
        SELECT
            STOCK.BOOK_NAME INTO V_BOOK_NAME
        FROM
            BOOKS
            JOIN STOCK
            ON BOOKS.STOCK_ID = STOCK.ID
        WHERE
            BOOKS.ID = V_BOOK_ID;
        SELECT
            STOCK.AMOUNT INTO V_BOOK_AMOUNT
        FROM
            BOOKS
            JOIN STOCK
            ON BOOKS.STOCK_ID = STOCK.ID
        WHERE
            BOOKS.ID = V_BOOK_ID;
        COMMIT;
        DBMS_OUTPUT.PUT_LINE('Вернули "'
            || V_BOOK_NAME
            || '". Остаток книг на складе '
            || V_BOOK_AMOUNT);
    ELSE
        DBMS_OUTPUT.PUT_LINE('Невозможно вернуть книгу (уже возвращена).');
    END IF;
END;