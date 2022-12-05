DECLARE
    V_OBJ  JSON_OBJECT_T;
    V_ARR  JSON_ARRAY_T;
    V_DATE DATE;
    PROCEDURE RECIVED_BOOKS_JSON (
        P_OBJ IN JSON_OBJECT_T
    )IS
    BEGIN
        DBMS_OUTPUT.PUT_LINE (P_OBJ.STRINGIFY);
    END;
BEGIN
    V_OBJ := JSON_OBJECT_T('{}');
    V_ARR := JSON_ARRAY_T('[]');
    V_DATE := '01.09.2022';
    FOR I IN (
        SELECT
            JOURNAL.RECIVE_DATE,
            STOCK.BOOK_NAME,
            COUNT(JOURNAL.BOOK_ID) AS COUNT
        FROM
            STOCK
            JOIN BOOKS
            ON BOOKS.STOCK_ID = STOCK.ID JOIN JOURNAL
            ON JOURNAL.BOOK_ID = BOOKS.ID
        WHERE
            V_DATE = TRUNC((RECIVE_DATE),
            'DDD')
        GROUP BY
            STOCK.BOOK_NAME,
            JOURNAL.RECIVE_DATE
    ) LOOP
        V_ARR.APPEND( JSON_OBJECT_T('{"REPORT_RETURN_BOOKS":{"NAME_BOOK":"'
            ||I.RECIVE_DATE
            ||'","PUBLISHER":"'
            ||I.BOOK_NAME
            ||'","PUBLISHER":"'
            ||I.COUNT
            ||'"}}'));
    END LOOP;
    V_OBJ.PUT('REPORT_RETURN_BOOKS', V_ARR);
    RECIVED_BOOKS_JSON (V_OBJ);
END;