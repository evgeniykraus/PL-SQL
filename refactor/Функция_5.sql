CREATE OR REPLACE PROCEDURE RETURN_A_BOOK (
    V_LIBRARY_CARD IN NUMBER,
    V_EMPLOYEE_ID IN NUMBER,
    V_BOOK_ID IN NUMBER,
    V_BOOK_RATING IN NUMBER
) IS
    E_CHECK_BOOK EXCEPTION;
    E_CHECK_EMPLOYEE EXCEPTION;
    E_CHECK_READER EXCEPTION;
    V_ERROR_CODE     NUMBER;
    V_ERROR_MESAGE   VARCHAR2(100);
    V_CHECK_BOOK     NUMBER;
    V_CHECK_READER   NUMBER;
    V_CHECK_EMPLOYEE NUMBER;
    V_BOOK_NAME      VARCHAR2(100);
    V_BOOK_AMOUNT    NUMBER;
    V_RESULT         NUMBER :=0;
    V_READER_ID      NUMBER;
    v_reader_rating NUMBER;
BEGIN

    SELECT
        (ROUND(SYSDATE) - ROUND(RECIVE_DATE) + 14) * 5 into v_reader_rating
    FROM
        JOURNAL
    WHERE
        LIBRARY_CARD_ID = V_LIBRARY_CARD
        AND BOOK_ID = V_BOOK_ID
        AND RETURN_DATE IS NULL;


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
    SELECT
        COUNT(*) INTO V_RESULT
    FROM
        JOURNAL
    WHERE
        BOOK_ID = V_BOOK_ID
        AND RETURN_DATE IS NULL;
    IF V_RESULT > 0 THEN
        UPDATE JOURNAL
        SET
            RETURN_DATE = SYSDATE,
            BOOK_RATING = V_BOOK_RATING,
            EMPLOYEES_ID = V_EMPLOYEE_ID
        WHERE
            JOURNAL.BOOK_ID = V_BOOK_ID
            AND RETURN_DATE IS NULL;

        UPDATE readers
        SET
            rating = rating - v_reader_rating
        WHERE
            library_card = V_LIBRARY_CARD;

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
        DBMS_OUTPUT.PUT_LINE('?????????????? "'
            || V_BOOK_NAME
            || '". ?????????????? ???????? ???? ???????????? '
            || V_BOOK_AMOUNT);
    ELSE
        DBMS_OUTPUT.PUT_LINE('???????????????????? ?????????????? ?????????? (?????? ????????????????????).');
    END IF;
EXCEPTION
    WHEN E_CHECK_EMPLOYEE THEN
        DBMS_OUTPUT.PUT_LINE( '???????????????????? c ID "'
            || V_EMPLOYEE_ID
            || '" ?? ???????????????????? ???? ????????????????????!' );
    WHEN E_CHECK_READER THEN
        DBMS_OUTPUT.PUT_LINE( '???????????????? c ID "'
            || V_LIBRARY_CARD
            || '" ???? ?????????????????????????????? ?? ????????????????????!' );
    WHEN E_CHECK_BOOK THEN
        DBMS_OUTPUT.PUT_LINE( '?????????? c ID "'
            || V_BOOK_ID
            || '" ?????????????? ???? ???????? ?? ????????????????????!' );
    WHEN OTHERS THEN
        V_ERROR_CODE := SQLCODE;
        V_ERROR_MESAGE := SQLERRM;
        DBMS_OUTPUT.PUT_LINE(V_ERROR_CODE);
        DBMS_OUTPUT.PUT_LINE(V_ERROR_MESAGE);
        DBMS_OUTPUT.PUT_LINE('??????????-???? ????????????');
END RETURN_A_BOOK;