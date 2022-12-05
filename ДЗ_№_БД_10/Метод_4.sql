-- Создаем метод по выдачи книги читателю - Анонимный PL/SQL блок.

DECLARE
    V_RECIVE_DATE  TIMESTAMP := SYSDATE;
    V_LIBRARY_CARD NUMBER := 14;
    V_EMPLOYEE_ID  NUMBER := 3;
    V_BOOK_ID      NUMBER := 3;
    V_BOOK_NAME    VARCHAR2(100);
    V_BOOK_AMOUNT  NUMBER;
    V_RESULT       NUMBER :=1;
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
            V_RESULT := 0;
        END IF;
    END LOOP;
    CLOSE C_JOURNAL_CURSOR;
    IF V_RESULT = 1 THEN
        INSERT INTO JOURNAL (
            ID,
            RECIVE_DATE,
            LIBRARY_CARD_ID,
            BOOK_ID,
            WHERE_READS,
            EMPLOYEES_ID
        ) VALUES (
            JOURNAL_SEQ.NEXTVAL,
            SYSDATE,
            V_LIBRARY_CARD,
            V_BOOK_ID,
            1,
            3
        );
        UPDATE STOCK
        SET
            AMOUNT = AMOUNT -1
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
        DBMS_OUTPUT.PUT_LINE('Выдали "'
            || V_BOOK_NAME
            || '". Остаток книг на складе '
            || V_BOOK_AMOUNT);
        COMMIT;
    ELSE
        DBMS_OUTPUT.PUT_LINE('Невозможно выдать (эта книга уже у читателя).');
    END IF;
END;