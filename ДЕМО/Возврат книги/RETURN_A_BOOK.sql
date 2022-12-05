-- Создаем метод по возврату книги читателем
CREATE OR REPLACE PROCEDURE RETURN_A_BOOK (
    V_BOOK_ID IN NUMBER,
    V_BOOK_RATING IN NUMBER
) IS
    V_RESULT      NUMBER := FINDE_BOOK(V_BOOK_ID);
    V_EMPLOYEE_ID NUMBER := 1;
    V_READER_ID   NUMBER;
    V_ERROR_CODE  NUMBER;
    V_BOOK_NAME   VARCHAR2(100);
    V_BOOK_AMOUNT NUMBER;
BEGIN
    IF V_RESULT = -1 THEN
        DBMS_OUTPUT.PUT_LINE('Невозможно вернуть книгу');
        DBMS_OUTPUT.PUT_LINE('Книги с инвентарным номером '
            || V_BOOK_ID
            || ' нет в библиотеке');
    ELSIF V_RESULT = 0 THEN
        DBMS_OUTPUT.PUT_LINE('Невозможно вернуть книгу');
        DBMS_OUTPUT.PUT_LINE('Книга с инвентарным номером '
            || V_BOOK_ID
            || ' находится в библиотеке');
    ELSE
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
        UPDATE JOURNAL
        SET
            RETURN_DATE = SYSDATE,
            BOOK_RATING = V_BOOK_RATING,
            EMPLOYEES_ID = V_EMPLOYEE_ID
        WHERE
            BOOK_ID = V_BOOK_ID
            AND RETURN_DATE IS NULL;
        COMMIT;
        DBMS_OUTPUT.PUT_LINE('Вернули "'
            || V_BOOK_NAME
            || '". Остаток книг на складе '
            || V_BOOK_AMOUNT + 1);
    END IF;
END RETURN_A_BOOK;