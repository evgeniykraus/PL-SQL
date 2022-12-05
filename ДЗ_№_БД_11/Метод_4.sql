-- Создаем метод по выдачи книги читателю - Анонимный PL/SQL блок.
DECLARE
    E_CHECK_BOOK EXCEPTION;
    E_CHECK_EMPLOYEE EXCEPTION;
    E_CHECK_READER EXCEPTION;
    V_ERROR_CODE     NUMBER;
    V_ERROR_MESAGE   VARCHAR2(100);
    V_CHECK_BOOK     NUMBER;
    V_CHECK_READER   NUMBER;
    V_CHECK_EMPLOYEE NUMBER;
    V_RECIVE_DATE    TIMESTAMP := SYSDATE;
    V_LIBRARY_CARD   NUMBER := 2;
    V_EMPLOYEE_ID    NUMBER := 3;
    V_BOOK_ID        NUMBER := 2;
    V_BOOK_NAME      VARCHAR2(100);
    V_BOOK_AMOUNT    NUMBER;
    V_RESULT         NUMBER := 1;
    CURSOR C_JOURNAL_CURSOR IS
        SELECT
            LIBRARY_CARD_ID
        FROM
            JOURNAL
        WHERE
            LIBRARY_CARD_ID = V_LIBRARY_CARD
            AND BOOK_ID = V_BOOK_ID
            AND RETURN_DATE IS NULL;
    C_LIBRARY_CARD   NUMBER;
    C_BOOK_ID        TIMESTAMP;

    
BEGIN
    
    IF V_CHECK_EMPLOYEE = 0 THEN
        RAISE E_CHECK_EMPLOYEE;
    END IF;
    SELECT
        COUNT(*) INTO V_CHECK_READER
    FROM
        READERS
    WHERE
        LIBRARY_CARD = V_LIBRARY_CARD;
    IF V_CHECK_READER = 0 THEN
        RAISE E_CHECK_BOOK;
    END IF;
    SELECT
        COUNT(*) INTO V_CHECK_BOOK
    FROM
        BOOKS
    WHERE
        ID = V_BOOK_ID;
    IF V_CHECK_BOOK = 0 THEN
        RAISE E_CHECK_BOOK;
    END IF;
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
        DBMS_OUTPUT.PUT_LINE( 'Выдали "'
            || V_BOOK_NAME
            || '". Остаток книг на складе '
            || V_BOOK_AMOUNT );
        COMMIT;
    ELSE
        DBMS_OUTPUT.PUT_LINE('Невозможно выдать (эта книга уже у читателя).');
    END IF;
EXCEPTION
    WHEN E_CHECK_EMPLOYEE THEN
        DBMS_OUTPUT.PUT_LINE( 'Сотрудника c ID "'
            || V_EMPLOYEE_ID
            || '" в библиотеке не существует!' );
    WHEN E_CHECK_READER THEN
        DBMS_OUTPUT.PUT_LINE( 'Читатель c ID "'
            || V_LIBRARY_CARD
            || '" не зарегистрирован в библиотеке!' );
    WHEN E_CHECK_BOOK THEN
        DBMS_OUTPUT.PUT_LINE( 'Книги c ID "'
            || V_BOOK_ID
            || '" никогда не было в библиотеке!' );
    WHEN OTHERS THEN
        V_ERROR_CODE := SQLCODE;
        V_ERROR_MESAGE := SQLERRM;
        DBMS_OUTPUT.PUT_LINE(V_ERROR_CODE);
        DBMS_OUTPUT.PUT_LINE(V_ERROR_MESAGE);
        DBMS_OUTPUT.PUT_LINE('Какая-то ошибка');
END;