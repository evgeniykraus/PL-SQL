CREATE OR REPLACE PACKAGE REPORTS IS
    FUNCTION RECIVED_BOOKS_TAB (
        V_DATE IN DATE
    ) RETURN SYS_REFCURSOR;
    FUNCTION RETURNED_BOOKS_TAB (
        V_DATE IN DATE
    ) RETURN SYS_REFCURSOR;
    FUNCTION INVENTORY_REPORT (
        V_BOOK_ID IN NUMBER
    ) RETURN SYS_REFCURSOR;
END;
/

CREATE OR REPLACE PACKAGE BODY REPORTS IS
    FUNCTION RECIVED_BOOKS_TAB (
        V_DATE IN DATE
    ) RETURN SYS_REFCURSOR IS
        E_VALUE_ERROR EXCEPTION;
        PRAGMA EXCEPTION_INIT (E_VALUE_ERROR, -06502);
        E_DATA_1 EXCEPTION;
        PRAGMA EXCEPTION_INIT (E_DATA_1, -01843);
        E_DATA_2 EXCEPTION;
        PRAGMA EXCEPTION_INIT (E_DATA_2, -01847);
        E_DATA_3 EXCEPTION;
        PRAGMA EXCEPTION_INIT (E_DATA_3, -01830);
        E_DATA_4 EXCEPTION;
        PRAGMA EXCEPTION_INIT (E_DATA_4, -1861);
        E_DATA_5 EXCEPTION;
        PRAGMA EXCEPTION_INIT (E_DATA_5, -06512);
        V_BOOK_NAME   VARCHAR2(100);
        V_COUNT       NUMBER;
        C_RESULT      SYS_REFCURSOR;
    BEGIN
        OPEN C_RESULT FOR
            SELECT
                ROUND(JOURNAL.RECIVE_DATE) AS RECIVE_DATE,
                STOCK.BOOK_NAME,
                COUNT(JOURNAL.BOOK_ID)     AS COUNT
            FROM
                STOCK
                JOIN BOOKS
                ON BOOKS.STOCK_ID = STOCK.ID JOIN JOURNAL
                ON JOURNAL.BOOK_ID = BOOKS.ID
            WHERE
                V_DATE = RECIVE_DATE
            GROUP BY
                STOCK.BOOK_NAME,
                JOURNAL.RECIVE_DATE;
        RETURN C_RESULT;
        DBMS_SQL.RETURN_RESULT(C_RESULT);
    EXCEPTION
        WHEN E_DATA_3 OR E_DATA_4 OR E_DATA_5 THEN
            DBMS_OUTPUT.PUT_LINE('Переменная V_DATE должна задаваться в формате ДД.ММ.ГГГГ');
        WHEN E_DATA_1 THEN
            DBMS_OUTPUT.PUT_LINE('Вы не правильно указали месяц');
            DBMS_OUTPUT.PUT_LINE('Переменная V_DATE должна задаваться в формате ДД.ММ.ГГГГ');
        WHEN E_DATA_2 THEN
            DBMS_OUTPUT.PUT_LINE('Вы не правильно указали день');
            DBMS_OUTPUT.PUT_LINE('День месяца должен быть в диапазоне от 1 до последнего дня месяца');
            DBMS_OUTPUT.PUT_LINE('Переменная V_DATE должна задаваться в формате ДД.ММ.ГГГГ');
    END RECIVED_BOOKS_TAB;
    FUNCTION RETURNED_BOOKS_TAB (
        V_DATE IN DATE
    ) RETURN SYS_REFCURSOR IS
        E_VALUE_ERROR EXCEPTION;
        PRAGMA EXCEPTION_INIT (E_VALUE_ERROR, -06502);
        E_DATA_1 EXCEPTION;
        PRAGMA EXCEPTION_INIT (E_DATA_1, -01843);
        E_DATA_2 EXCEPTION;
        PRAGMA EXCEPTION_INIT (E_DATA_2, -01847);
        E_DATA_3 EXCEPTION;
        PRAGMA EXCEPTION_INIT (E_DATA_3, -01830);
        E_DATA_4 EXCEPTION;
        PRAGMA EXCEPTION_INIT (E_DATA_4, -1861);
        E_DATA_5 EXCEPTION;
        PRAGMA EXCEPTION_INIT (E_DATA_5, -06512);
        V_BOOK_NAME   VARCHAR2(100);
        V_COUNT       NUMBER;
        C_RESULT      SYS_REFCURSOR;
    BEGIN
        OPEN C_RESULT FOR
            SELECT
                ROUND(JOURNAL.RETURN_DATE) AS RETURN_DATE,
                STOCK.BOOK_NAME,
                COUNT(JOURNAL.BOOK_ID)     AS COUNT
            FROM
                STOCK
                JOIN BOOKS
                ON BOOKS.STOCK_ID = STOCK.ID JOIN JOURNAL
                ON JOURNAL.BOOK_ID = BOOKS.ID
            WHERE
                V_DATE = RETURN_DATE
            GROUP BY
                STOCK.BOOK_NAME,
                JOURNAL.RETURN_DATE;
        RETURN C_RESULT;
        DBMS_SQL.RETURN_RESULT(C_RESULT);
    EXCEPTION
        WHEN E_DATA_3 OR E_DATA_4 OR E_DATA_5 THEN
            DBMS_OUTPUT.PUT_LINE('Переменная V_DATE должна задаваться в формате ДД.ММ.ГГГГ');
        WHEN E_DATA_1 THEN
            DBMS_OUTPUT.PUT_LINE('Вы не правильно указали месяц');
            DBMS_OUTPUT.PUT_LINE('Переменная V_DATE должна задаваться в формате ДД.ММ.ГГГГ');
        WHEN E_DATA_2 THEN
            DBMS_OUTPUT.PUT_LINE('Вы не правильно указали день');
            DBMS_OUTPUT.PUT_LINE('День месяца должен быть в диапазоне от 1 до последнего дня месяца');
            DBMS_OUTPUT.PUT_LINE('Переменная V_DATE должна задаваться в формате ДД.ММ.ГГГГ');
    END RETURNED_BOOKS_TAB;
    FUNCTION INVENTORY_REPORT (
        V_BOOK_ID IN NUMBER
    ) RETURN SYS_REFCURSOR IS
        RC             SYS_REFCURSOR;
        E_CHECK_BOOK EXCEPTION;
        V_CHECK_BOOK   NUMBER;
        V_ERROR_CODE   NUMBER;
        V_ERROR_MESAGE VARCHAR2(100);
    BEGIN
        SELECT
            COUNT(*) INTO V_CHECK_BOOK
        FROM
            BOOKS
        WHERE
            ID = V_BOOK_ID;
        IF V_CHECK_BOOK = 0 THEN
            RAISE E_CHECK_BOOK;
        END IF;
        OPEN RC FOR
            SELECT
                BOOKS.ID,
                STOCK.BOOK_NAME,
                ROUND (STOCK.RECEIPT_DATE)  AS R_DATE,
                PUBLICATION_YEAR            AS YEAR,
                PUBLISHERS.PUBLISHER_NAME   AS PUBLISHER,
                TYPES.PUBLICATION_TYPE,
                READERS.LIBRARY_CARD,
                ROUND(REGISTRATION_DATE)    AS REG_DATE,
                CONCAT(CONCAT(READERS.SURNAME,
                ' '),
                READERS.SURNAME)            AS READER,
                ROUND (JOURNAL.RECIVE_DATE) AS RECIVE,
                ROUND (JOURNAL.RETURN_DATE) AS "RETURN"
            FROM
                STOCK
                JOIN TYPES
                ON STOCK.TYPE_ID = TYPES.ID JOIN PUBLISHERS
                ON STOCK.PUBLISHER_ID = PUBLISHERS.ID
                JOIN BOOKS
                ON STOCK.ID = BOOKS.STOCK_ID LEFT JOIN JOURNAL
                ON BOOKS.ID = JOURNAL.BOOK_ID
                LEFT JOIN READERS
                ON READERS.LIBRARY_CARD = JOURNAL.LIBRARY_CARD_ID
            WHERE
                BOOKS.ID = V_BOOK_ID;
        RETURN RC;
        DBMS_SQL.RETURN_RESULT(RC);
    EXCEPTION
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
    END INVENTORY_REPORT;
END;