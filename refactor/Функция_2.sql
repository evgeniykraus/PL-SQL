CREATE OR REPLACE PROCEDURE ADD_BOOK (
    V_BOOK_NAME IN VARCHAR2,
    V_TYPE IN VARCHAR2,
    V_DESCRIPTION IN VARCHAR2,
    V_PURCHASE_TYPE IN VARCHAR2,
    V_AMOUNT IN NUMBER,
    V_AGE_LIMIT_ID IN NUMBER,
    V_COST IN NUMBER,
    V_PUBLICATION_YEAR IN NUMBER,
    V_AUTHOR_NAME IN VARCHAR2,
    V_AUTHOR_SURNAME IN VARCHAR2,
    V_PUBLISHER_NAME IN VARCHAR2,
    V_GENRE_NAME IN VARCHAR2,
    V_TAG_NAME IN VARCHAR2
) IS
    CURSOR C_BOOK_TYPE_CURSOR IS
        SELECT
            TYPES.ID,
            TYPES.PUBLICATION_TYPE
        FROM
            TYPES;
    V_TYPES_ID     VARCHAR2(40);
    V_TYPES_NAME   VARCHAR2(40);
    CURSOR C_GENRES_CURSOR IS
        SELECT
            *
        FROM
            GENRES;
    C_GENRE_ID     NUMBER;
    C_GENRE_NAME   VARCHAR2(30);
    CURSOR C_TAGS_CURSOR IS
        SELECT
            *
        FROM
            TAGS;
    C_TAG_ID       NUMBER;
    C_TAG_NAME     VARCHAR2(100);
    CURSOR C_AUTHORS IS
        SELECT
            *
        FROM
            AUTHORS;
    V_A_ID         NUMBER;
    V_AN           VARCHAR2(40);
    V_AS           VARCHAR2(40);
    CURSOR C_PUBLISHERS IS
        SELECT
            *
        FROM
            PUBLISHERS;
    V_P_ID         NUMBER;
    V_PUB_NAME     VARCHAR2(40);
    V_STOCK_ID     NUMBER;
    V_PUBLISHER_ID NUMBER;
    V_TYPE_ID      NUMBER;
    V_AUTHOR_ID    NUMBER;
    E_AGE_LIMIT EXCEPTION;
    E_PUBLIC_YEAR EXCEPTION;
    E_AMOUNT_BOOK EXCEPTION;
    E_COST_BOOK EXCEPTION;
    E_VALUE_ERROR EXCEPTION;
    PRAGMA EXCEPTION_INIT (E_VALUE_ERROR, -06502);
    E_AGE EXCEPTION;
    PRAGMA EXCEPTION_INIT (E_AGE, -01830);
    E_AGE_1 EXCEPTION;
    PRAGMA EXCEPTION_INIT (E_AGE_1, -1861);
    E_AGE_2 EXCEPTION;
    PRAGMA EXCEPTION_INIT (E_AGE_2, -06512);
    E_BIRTHD_DATE EXCEPTION;
    Е_SEX EXCEPTION;
    Е_BLACK_LIST EXCEPTION;
    E_RATING EXCEPTION;
    V_ERROR_CODE   NUMBER;
    V_ERROR_MESAGE VARCHAR2(100);
    V_ID           NUMBER;
    CURSOR C_READERS IS
        SELECT
            BIRTHD_DATE,
            NAME,
            SURNAME
        FROM
            READERS;
    V_B_DATE       DATE;
    V_N_R          VARCHAR2(100);
    V_S_R          VARCHAR2(100);
BEGIN
    IF V_COST < 0 THEN
        RAISE E_COST_BOOK;
    END IF;
    IF V_AMOUNT < 1 THEN
        RAISE E_AMOUNT_BOOK;
    END IF;
    IF V_AGE_LIMIT_ID > 5 THEN
        RAISE E_AGE_LIMIT;
    END IF;
    IF V_PUBLICATION_YEAR > EXTRACT (YEAR FROM SYSDATE) OR V_PUBLICATION_YEAR < 1300 THEN
        RAISE E_PUBLIC_YEAR;
    END IF;
    OPEN C_BOOK_TYPE_CURSOR;
    LOOP
        FETCH C_BOOK_TYPE_CURSOR INTO V_TYPES_ID, V_TYPES_NAME;
        EXIT WHEN C_BOOK_TYPE_CURSOR % NOTFOUND;
        IF V_TYPE = V_TYPES_NAME THEN
            V_TYPE_ID := V_TYPES_ID;
        END IF;
    END LOOP;
    CLOSE C_BOOK_TYPE_CURSOR;
    OPEN C_AUTHORS;
    LOOP
        FETCH C_AUTHORS INTO V_A_ID, V_AN, V_AS;
        EXIT WHEN C_AUTHORS % NOTFOUND;
        IF V_AUTHOR_NAME = V_AN AND V_AUTHOR_SURNAME = V_AS THEN
            V_AUTHOR_ID := V_A_ID;
            EXIT;
        ELSE
            V_A_ID :=0;
        END IF;
    END LOOP;
    CLOSE C_AUTHORS;
    OPEN C_PUBLISHERS;
    LOOP
        FETCH C_PUBLISHERS INTO V_P_ID, V_PUB_NAME;
        EXIT WHEN C_PUBLISHERS % NOTFOUND;
        IF V_PUB_NAME = V_PUBLISHER_NAME THEN
            V_PUBLISHER_ID := V_P_ID;
            EXIT;
        ELSE
            V_P_ID :=0;
        END IF;
    END LOOP;
    CLOSE C_PUBLISHERS;
    IF V_P_ID = 0 THEN
        INSERT INTO PUBLISHERS VALUES (
            PUBLISHERS_SEQ.NEXTVAL,
            V_PUBLISHER_NAME
        ) RETURNING ID INTO V_PUBLISHER_ID;
    ELSE
        INSERT INTO STOCK VALUES (
            STOCK_SEQ.NEXTVAL,
            V_BOOK_NAME,
            V_AMOUNT,
            V_PUBLICATION_YEAR,
            V_COST,
            V_PUBLISHER_ID,
            V_TYPE_ID,
            V_AGE_LIMIT_ID,
            V_DESCRIPTION,
            V_PURCHASE_TYPE,
            SYSDATE
        ) RETURNING ID INTO V_STOCK_ID;
    END IF;
    IF V_A_ID = 0 THEN
        INSERT INTO AUTHORS VALUES (
            AUTHORS_SEQ.NEXTVAL,
            V_AUTHOR_NAME,
            V_AUTHOR_SURNAME
        ) RETURNING ID INTO V_AUTHOR_ID;
        INSERT INTO AUTHOR_STOCK VALUES (
            AUTHOR_STOCK_SEQ.NEXTVAL,
            V_AUTHOR_ID,
            V_STOCK_ID
        );
    ELSE
        INSERT INTO AUTHOR_STOCK VALUES (
            AUTHOR_STOCK_SEQ.NEXTVAL,
            V_A_ID,
            V_STOCK_ID
        );
    END IF;
    OPEN C_GENRES_CURSOR;
    LOOP
        FETCH C_GENRES_CURSOR INTO C_GENRE_ID, C_GENRE_NAME;
        EXIT WHEN C_GENRES_CURSOR % NOTFOUND;
        IF C_GENRE_NAME = V_GENRE_NAME THEN
            INSERT INTO GENRE_STOCK VALUES (
                GENRE_STOCK_SEQ.NEXTVAL,
                C_GENRE_ID,
                V_STOCK_ID
            );
            EXIT;
        ELSE
            C_GENRE_ID :=0;
        END IF;
    END LOOP;
    IF C_GENRE_ID = 0 THEN
        INSERT INTO GENRES VALUES (
            GENRES_SEQ.NEXTVAL,
            V_GENRE_NAME
        ) RETURNING ID INTO C_GENRE_ID;
        INSERT INTO GENRE_STOCK VALUES (
            GENRE_STOCK_SEQ.NEXTVAL,
            C_GENRE_ID,
            V_STOCK_ID
        );
    END IF;
    OPEN C_TAGS_CURSOR;
    LOOP
        FETCH C_TAGS_CURSOR INTO C_TAG_ID, C_TAG_NAME;
        EXIT WHEN C_TAGS_CURSOR % NOTFOUND;
        IF C_TAG_NAME = V_TAG_NAME THEN
            INSERT INTO TAG_STOCK VALUES (
                TAG_STOCK_SEQ.NEXTVAL,
                C_TAG_ID,
                V_STOCK_ID
            );
            EXIT;
        ELSE
            C_TAG_ID :=0;
        END IF;
    END LOOP;
    IF C_TAG_ID = 0 THEN
        INSERT INTO TAGS VALUES (
            TAGS_SEQ.NEXTVAL,
            V_TAG_NAME
        ) RETURNING ID INTO C_TAG_ID;
        INSERT INTO TAG_STOCK VALUES (
            TAG_STOCK_SEQ.NEXTVAL,
            C_TAG_ID,
            V_STOCK_ID
        );
    END IF;
    COMMIT;
    DBMS_OUTPUT.PUT_LINE(V_TYPE
        || ' '
        || '"'
        ||V_BOOK_NAME
        || '" теперь есть в базе!');
EXCEPTION
    WHEN E_COST_BOOK THEN
        DBMS_OUTPUT.PUT_LINE('Стоимость книги не может быть отрицательным числом! Измените значение в переменной V_COST');
    WHEN E_AMOUNT_BOOK THEN
        DBMS_OUTPUT.PUT_LINE('Вы пытаетесь добавить нулевое или отрицательное количество книг на склад! Измените значение в переменной V_AMOUNT');
    WHEN E_VALUE_ERROR THEN
        DBMS_OUTPUT.PUT_LINE('Вы попытались выполнить инструкцию, которая привела к арифметической, числовой, строковой ошибке, ошибке преобразования или ограничения.');
        DBMS_OUTPUT.PUT_LINE('Распространенными причинами этой ошибки являются:');
        DBMS_OUTPUT.PUT_LINE('Вы попытались присвоить значение числовой переменной, но это значение больше, чем может обработать переменная.');
        DBMS_OUTPUT.PUT_LINE('Вы попытались присвоить числовой переменной нечисловое значение и вызвали ошибку преобразования.');
    WHEN E_AGE_LIMIT THEN
        DBMS_OUTPUT.PUT_LINE('Переменная V_AGE_LIMIT_ID не должна быть больше 5');
    WHEN E_PUBLIC_YEAR THEN
        DBMS_OUTPUT.PUT_LINE('Переменная V_PUBLICATION_YEAR не должна быть меньше 1300 и больше '
            || EXTRACT (YEAR FROM SYSDATE));
    WHEN OTHERS THEN
        V_ERROR_CODE := SQLCODE;
        V_ERROR_MESAGE := SQLERRM;
        DBMS_OUTPUT.PUT_LINE(V_ERROR_CODE
            || ' - '
            || V_ERROR_MESAGE);
        DBMS_OUTPUT.PUT_LINE('Какая-то ошибка');
END ADD_BOOK;