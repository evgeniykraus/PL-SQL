--Добавляет книгу на склад и
CREATE OR REPLACE PROCEDURE ADD_BOOK (
    V_BOOK_NAME IN VARCHAR2,
    V_TYPE IN VARCHAR2,
    V_DESCRIPTION IN VARCHAR2,
    V_AMOUNT IN NUMBER,
    V_AGE_LIMIT IN NUMBER,
    V_COST IN NUMBER,
    V_PUBLICATION_YEAR IN NUMBER,
    V_AUTHOR_NAME IN VARCHAR2,
    V_AUTHOR_SURNAME IN VARCHAR2,
    V_PUBLISHER_NAME IN VARCHAR2,
    V_GENRE_NAME IN VARCHAR2,
    V_TAG_NAME IN VARCHAR2
) IS
    V_TYPE_ID      NUMBER := CHECK_TYPE(V_TYPE);
    V_GENRE_ID     NUMBER := CHECK_GENRE(V_GENRE_NAME);
    V_AUTHOR_ID    NUMBER := CHECK_AUTHOR(V_AUTHOR_NAME, V_AUTHOR_SURNAME);
    V_TAG_ID       NUMBER := CHECK_TAG(V_TAG_NAME);
    V_PUBLISHER_ID NUMBER := CHECK_PUBLISHER(V_PUBLISHER_NAME);
    V_AGE_LIMIT_ID NUMBER := CHECK_AGE_LIMIT(V_AGE_LIMIT);
    E_AGE_LIMIT EXCEPTION;
    E_PUBLIC_YEAR EXCEPTION;
    E_AMOUNT_BOOK EXCEPTION;
    E_COST_BOOK EXCEPTION;
    E_ERROR_CODE   NUMBER;
    E_ERROR_MESAGE VARCHAR2(100);
BEGIN
    IF V_COST < 0 THEN
        RAISE E_COST_BOOK;
    ELSIF V_AMOUNT < 1 THEN
        RAISE E_AMOUNT_BOOK;
    ELSIF V_AGE_LIMIT < 0 THEN
        RAISE E_AGE_LIMIT;
    ELSIF V_PUBLICATION_YEAR > EXTRACT (YEAR FROM SYSDATE) OR V_PUBLICATION_YEAR < 1300 THEN
        RAISE E_PUBLIC_YEAR;
    ELSE
        INSERT_IN_STOCK (V_BOOK_NAME, V_AMOUNT, V_PUBLICATION_YEAR, V_COST, V_PUBLISHER_ID, V_TYPE_ID, V_AGE_LIMIT_ID, V_DESCRIPTION, V_AUTHOR_ID, V_GENRE_ID, V_TAG_ID);
        DBMS_OUTPUT.PUT_LINE(V_TYPE
            || ' '
            || '"'
            ||V_BOOK_NAME
            || '" теперь есть в базе!');
    END IF;
EXCEPTION
    WHEN E_COST_BOOK THEN
        DBMS_OUTPUT.PUT_LINE('Стоимость книги не может быть отрицательным числом! Измените значение в переменной V_COST');
    WHEN E_AMOUNT_BOOK THEN
        DBMS_OUTPUT.PUT_LINE('Вы пытаетесь добавить нулевое или отрицательное количество книг на склад');
        DBMS_OUTPUT.PUT_LINE('Переменная V_AMOUNT не должна быть меньше 0');
    WHEN E_AGE_LIMIT THEN
        DBMS_OUTPUT.PUT_LINE('Вы пытаетесь добавить отрицательное значение для переменной V_AGE_LIMIT');
        DBMS_OUTPUT.PUT_LINE('Переменная V_AGE_LIMIT не должна быть меньше 0');
    WHEN E_PUBLIC_YEAR THEN
        DBMS_OUTPUT.PUT_LINE('Переменная V_PUBLICATION_YEAR не должна быть меньше 1300 и больше '
            || EXTRACT (YEAR FROM SYSDATE));
    WHEN OTHERS THEN
        E_ERROR_CODE := SQLCODE;
        E_ERROR_MESAGE := SQLERRM;
        DBMS_OUTPUT.PUT_LINE(E_ERROR_CODE
            || ' - '
            || E_ERROR_MESAGE);
        DBMS_OUTPUT.PUT_LINE('Какая-то ошибка');
END ADD_BOOK;