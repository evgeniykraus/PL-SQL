CREATE OR REPLACE PROCEDURE GIVE_A_BOOK (
    V_LIBRARY_CARD IN NUMBER,
    V_EMPLOYEE_ID IN NUMBER,
    V_BOOK_ID IN NUMBER
) IS
    V_RESULT         NUMBER := 1;
    V_BOOK_AMOUNT    NUMBER;
    V_BOOK_NAME      VARCHAR2(100);
    E_CHECK_BOOK EXCEPTION;
    E_CHECK_EMPLOYEE EXCEPTION;
    E_CHECK_READER EXCEPTION;
    V_ERROR_CODE     NUMBER;
    V_ERROR_MESAGE   VARCHAR2(100);
    V_CHECK_BOOK     NUMBER;
    V_CHECK_READER   NUMBER;
    V_CHECK_EMPLOYEE NUMBER;
    V_RECIVE_DATE    TIMESTAMP := SYSDATE;
    V_READER_ID      NUMBER;
BEGIN
    SELECT
        COUNT(*) INTO V_READER_ID
    FROM
        JOURNAL
    WHERE
        BOOK_ID = V_BOOK_ID;
    SELECT
        COUNT(*) INTO V_CHECK_EMPLOYEE
    FROM
        EMPLOYEES
    WHERE
        EMPLOYEES.ID = V_EMPLOYEE_ID;
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
        RAISE E_CHECK_READER;
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
    SELECT
        COUNT(*) INTO V_RESULT
    FROM
        JOURNAL
    WHERE
        BOOK_ID = V_BOOK_ID
        AND RETURN_DATE IS NULL;
    IF V_RESULT = 0 THEN
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
            V_EMPLOYEE_ID
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
        DBMS_OUTPUT.PUT_LINE('Невозможно выдать (эта книга уже у читателя с читательским билетом №'
            || V_READER_ID
            || ')');
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
END GIVE_A_BOOK;