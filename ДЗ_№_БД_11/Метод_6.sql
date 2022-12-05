--Создаем метод, возвращающий таблицу выданных книг за определенный день

DECLARE
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
    V_DATE        DATE;
    V_BOOK_NAME   VARCHAR2(100);
    V_COUNT       NUMBER;
    C_RESULT      SYS_REFCURSOR;
BEGIN
    V_DATE := '01.09.2022';
    OPEN C_RESULT FOR
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
            JOURNAL.RECIVE_DATE;
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
END;