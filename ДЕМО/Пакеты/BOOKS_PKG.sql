CREATE OR REPLACE PACKAGE BOOKS_PKG IS
    PROCEDURE ADD_BOOK (
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
    );
    PROCEDURE RENT_A_BOOK (
        V_LIBRARY_CARD IN NUMBER,
        V_BOOK_NAME IN VARCHAR2
    );
    PROCEDURE RETURN_A_BOOK (
        V_BOOK_ID IN NUMBER,
        V_BOOK_RATING IN NUMBER
    );
    PROCEDURE GIVE_A_BOOK (
        V_LIBRARY_CARD IN NUMBER,
        V_BOOK_NAME IN VARCHAR2
    );
END;
/

CREATE OR REPLACE PACKAGE BODY BOOKS_PKG IS
    FUNCTION CHECK_READER (
        V_LIBRARY_CARD IN NUMBER
    ) RETURN NUMBER IS
        V_RESULT       NUMBER;
        V_DEBT         NUMBER;
        V_ERROR_CODE   NUMBER;
        V_ERROR_MESAGE VARCHAR2(100);
    BEGIN
        SELECT
            BLACK_LIST INTO V_RESULT
        FROM
            READERS
        WHERE
            LIBRARY_CARD = V_LIBRARY_CARD;
        SELECT
            COUNT(LIBRARY_CARD_ID) INTO V_DEBT
        FROM
            JOURNAL
        WHERE
            LIBRARY_CARD_ID = V_LIBRARY_CARD
            AND RETURN_DATE IS NULL
            AND (ROUND(SYSDATE) - ROUND(RECIVE_DATE)) > 30;
        IF (V_RESULT + V_DEBT) = 0 THEN
            RETURN 1;
        ELSIF V_RESULT = 1 THEN
            RETURN 0;
        ELSIF V_DEBT > 0 THEN
            RETURN 3;
        END IF;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            RETURN 2;
        WHEN OTHERS THEN
            V_ERROR_CODE := SQLCODE;
            V_ERROR_MESAGE := SQLERRM;
    END CHECK_READER;
    FUNCTION ACCESS_TO_READ (
        V_LIBRARY_CARD IN NUMBER,
        V_BOOK_NAME IN VARCHAR2
    ) RETURN NUMBER IS
        V_RESULT       NUMBER;
        V_ERROR_CODE   NUMBER;
        V_ERROR_MESAGE VARCHAR2(100);
    BEGIN
        SELECT
            TABLE_2.ID INTO V_RESULT
        FROM
            (
                SELECT
                    DISTINCT TABLE_1.*,
                    READERS.LIBRARY_CARD,
                    CONCAT(CONCAT(READERS.NAME,
                    ' '),
                    READERS.SURNAME) AS READER,
                    READERS.BIRTHD_DATE,
                    READERS.RATING,
                    CASE
                        WHEN ( TABLE_1.AMOUNT > 0
                        OR TYPE_ID = 1 ) AND READERS.BLACK_LIST = 0 AND ( EXTRACT( YEAR FROM SYSDATE ) - EXTRACT( YEAR FROM READERS.BIRTHD_DATE ) ) >= TABLE_1.AGE THEN
                            'Yes'
                        ELSE
                            'No'
                    END              AS READ_HERE
                FROM
                    BOOKS,
                    (
                        SELECT
                            BOOKS.ID,
                            BOOK_NAME,
                            AMOUNT,
                            ROUND(COST/AMOUNT*PUBLICATION_YEAR/1000+400) AS VALUE,
                            AGE_LIMITS.AGE,
                            STOCK.TYPE_ID
                        FROM
                            STOCK
                            LEFT JOIN AGE_LIMITS
                            ON STOCK.AGE_LIMIT_ID = AGE_LIMITS.ID
                            LEFT JOIN BOOKS
                            ON BOOKS.STOCK_ID = STOCK.ID
                    ) TABLE_1,
                    READERS
            ) TABLE_2
            LEFT JOIN JOURNAL
            ON JOURNAL.BOOK_ID = TABLE_2.ID
        WHERE
            LIBRARY_CARD = V_LIBRARY_CARD
            AND BOOK_NAME = V_BOOK_NAME
            AND READ_HERE = 'Yes'
            AND TABLE_2.ID NOT IN (
                SELECT
                    JOURNAL.BOOK_ID
                FROM
                    JOURNAL
                WHERE
                    JOURNAL.RETURN_DATE IS NULL
            )
        ORDER BY
            ID,
            TABLE_2.ID FETCH FIRST 1 ROWS ONLY;
        RETURN V_RESULT;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            RETURN 0;
        WHEN OTHERS THEN
            V_ERROR_CODE := SQLCODE;
            V_ERROR_MESAGE := SQLERRM;
    END ACCESS_TO_READ;
    PROCEDURE GIVE_A_BOOK (
        V_LIBRARY_CARD IN NUMBER,
        V_BOOK_NAME IN VARCHAR2
    ) IS
        E_READER_NOT_FOUND EXCEPTION;
        E_READER_IN_BLACK_LIST EXCEPTION;
        V_RECIVE_DATE          TIMESTAMP := SYSDATE;
        V_EMPLOYEE_ID          NUMBER := 1;
        V_BOOK_ID              NUMBER := ACCESS_TO_READ(V_LIBRARY_CARD, V_BOOK_NAME);
        V_BLACK_LIST_CHECK     NUMBER := CHECK_READER (V_LIBRARY_CARD);
    BEGIN
        V_BOOK_ID := ACCESS_TO_READ(V_LIBRARY_CARD, V_BOOK_NAME);
        IF V_BLACK_LIST_CHECK = 0 THEN
            RAISE E_READER_IN_BLACK_LIST;
        ELSIF V_BLACK_LIST_CHECK = 2 THEN
            RAISE E_READER_NOT_FOUND;
        ELSIF V_BOOK_ID != 0 THEN
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
                'Читательский зал',
                V_EMPLOYEE_ID
            );
            COMMIT;
            DBMS_OUTPUT.PUT_LINE('Выдали" '
                || V_BOOK_NAME
                || '" в читательский зал');
        ELSE
            DBMS_OUTPUT.PUT_LINE('Книги " '
                || V_BOOK_NAME
                || '" нет в библиотеке');
        END IF;
    EXCEPTION
        WHEN E_READER_NOT_FOUND THEN
            DBMS_OUTPUT.PUT_LINE('Невозможно выдать книгу');
            DBMS_OUTPUT.PUT_LINE('Пользователь с читательским билетом №'
                || V_LIBRARY_CARD
                || ' не найден');
        WHEN E_READER_IN_BLACK_LIST THEN
            DBMS_OUTPUT.PUT_LINE('Невозможно выдать книгу');
            DBMS_OUTPUT.PUT_LINE('Пользователь с читательским билетом №'
                || V_LIBRARY_CARD
                || ' в черном списке');
    END GIVE_A_BOOK;
    FUNCTION FINDE_BOOK (
        V_BOOK_ID IN NUMBER
    ) RETURN NUMBER IS
        V_RESULT NUMBER;
    BEGIN
        SELECT
            COUNT(*) INTO V_RESULT
        FROM
            BOOKS
        WHERE
            ID = V_BOOK_ID;
        IF V_RESULT = 0 THEN
            RETURN -1;
        END IF;
        SELECT
            COUNT(*) INTO V_RESULT
        FROM
            JOURNAL
        WHERE
            BOOK_ID = V_BOOK_ID
            AND RETURN_DATE IS NULL;
        RETURN 1;
    END FINDE_BOOK;
    PROCEDURE RETURN_A_BOOK (
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
    FUNCTION ACCESS_TO_TAKE_A_BOOK (
        V_LIBRARY_CARD IN NUMBER,
        V_BOOK_NAME IN VARCHAR2
    ) RETURN NUMBER IS
        V_RESULT       VARCHAR2(100) := '0';
        V_ID_BOOK      NUMBER := -2;
        V_ERROR_CODE   NUMBER;
        V_ERROR_MESAGE VARCHAR2(100);
        C_ID_BOOK      NUMBER;
        C_RESULT       VARCHAR2(100);
        CURSOR C_RES_CURSOR IS
            SELECT
                TABLE_2.ID,
                TABLE_2.TAKE_AWAY
            FROM
                (
                    SELECT
                        DISTINCT TABLE_1.*,
                        READERS.LIBRARY_CARD,
                        CONCAT(CONCAT(READERS.NAME,
                        ' '),
                        READERS.SURNAME) AS READER,
                        READERS.BIRTHD_DATE,
                        READERS.RATING,
                        CASE
                            WHEN TABLE_1.TYPE_ID = 1 AND TABLE_1.AMOUNT > 1 AND READERS.RATING > TABLE_1.VALUE AND READERS.BLACK_LIST < 1 AND ( EXTRACT( YEAR FROM SYSDATE ) - EXTRACT( YEAR FROM READERS.BIRTHD_DATE ) ) > TABLE_1.AGE THEN
                                'Yes'
                            ELSE
                                'No'
                        END              AS TAKE_AWAY
                    FROM
                        BOOKS,
                        (
                            SELECT
                                BOOKS.ID,
                                BOOK_NAME,
                                AMOUNT,
                                ROUND(COST/AMOUNT*PUBLICATION_YEAR/1000+400) AS VALUE,
                                AGE_LIMITS.AGE,
                                STOCK.TYPE_ID
                            FROM
                                STOCK
                                LEFT JOIN AGE_LIMITS
                                ON STOCK.AGE_LIMIT_ID = AGE_LIMITS.ID
                                LEFT JOIN BOOKS
                                ON BOOKS.STOCK_ID = STOCK.ID
                        ) TABLE_1,
                        READERS
                ) TABLE_2
                LEFT JOIN JOURNAL
                ON JOURNAL.BOOK_ID = TABLE_2.ID
            WHERE
                LIBRARY_CARD = V_LIBRARY_CARD
                AND V_LIBRARY_CARD NOT IN (
                    SELECT
                        JOURNAL.LIBRARY_CARD_ID
                    FROM
                        JOURNAL
                    WHERE
                        JOURNAL.WHERE_READS = 'Читательский зал'
                        AND JOURNAL.RETURN_DATE IS NULL
                )
                AND BOOK_NAME = V_BOOK_NAME
                AND TABLE_2.ID NOT IN (
                    SELECT
                        JOURNAL.BOOK_ID
                    FROM
                        JOURNAL
                    WHERE
                        JOURNAL.RETURN_DATE IS NULL
                )
            ORDER BY
                ID,
                TABLE_2.ID FETCH FIRST 1 ROWS ONLY;
    BEGIN
        OPEN C_RES_CURSOR;
        LOOP
            FETCH C_RES_CURSOR INTO C_ID_BOOK, C_RESULT;
            EXIT WHEN C_RES_CURSOR % NOTFOUND;
            V_ID_BOOK := C_ID_BOOK;
            V_RESULT := C_RESULT;
        END LOOP;
        CLOSE C_RES_CURSOR;
        IF V_ID_BOOK != 0 AND V_RESULT = 'Yes' THEN
            RETURN V_ID_BOOK;
        ELSIF V_ID_BOOK != 0 AND V_RESULT = 'No' THEN
            RETURN -1;
        ELSIF V_ID_BOOK != -2 THEN
            RETURN -2;
        ELSE
            RETURN 0;
        END IF;
    END ACCESS_TO_TAKE_A_BOOK;
    PROCEDURE RENT_A_BOOK (
        V_LIBRARY_CARD IN NUMBER,
        V_BOOK_NAME IN VARCHAR2
    ) IS
        E_READER_NOT_FOUND EXCEPTION;
        E_READER_IN_BLACK_LIST EXCEPTION;
        E_READER_IS_DEBTOR EXCEPTION;
        E_NO_SUCH_BOOK EXCEPTION;
        E_LOW_RATING EXCEPTION;
        V_RECIVE_DATE          TIMESTAMP := SYSDATE;
        V_EMPLOYEE_ID          NUMBER := 1;
        V_BOOK_ID              NUMBER := ACCESS_TO_TAKE_A_BOOK(V_LIBRARY_CARD, V_BOOK_NAME);
        V_BLACK_LIST_CHECK     NUMBER := CHECK_READER (V_LIBRARY_CARD);
    BEGIN
        IF V_BLACK_LIST_CHECK = 0 THEN
            RAISE E_READER_IN_BLACK_LIST;
        ELSIF V_BOOK_ID = 0 THEN
            RAISE E_NO_SUCH_BOOK;
        ELSIF V_BLACK_LIST_CHECK = 2 THEN
            RAISE E_READER_NOT_FOUND;
        ELSIF V_BLACK_LIST_CHECK = 3 THEN
            RAISE E_READER_IS_DEBTOR;
        ELSIF V_BOOK_ID = -1 THEN
            RAISE E_LOW_RATING;
        ELSE
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
                'Аренда',
                V_EMPLOYEE_ID
            );
            COMMIT;
            DBMS_OUTPUT.PUT_LINE('Выдали "'
                || V_BOOK_NAME
                || '" в аренду');
        END IF;
    EXCEPTION
        WHEN E_LOW_RATING THEN
            DBMS_OUTPUT.PUT_LINE('Книгу "'
                || V_BOOK_NAME
                || '" можно взять только в читательский зал');
        WHEN E_READER_NOT_FOUND THEN
            DBMS_OUTPUT.PUT_LINE('Невозможно выдать книгу');
            DBMS_OUTPUT.PUT_LINE('Пользователь с читательским билетом №'
                || V_LIBRARY_CARD
                || ' не найден');
        WHEN E_READER_IN_BLACK_LIST THEN
            DBMS_OUTPUT.PUT_LINE('Невозможно выдать книгу');
            DBMS_OUTPUT.PUT_LINE('Пользователь с читательским билетом №'
                || V_LIBRARY_CARD
                || ' в черном списке');
        WHEN E_READER_IS_DEBTOR THEN
            DBMS_OUTPUT.PUT_LINE('Невозможно выдать книгу');
            DBMS_OUTPUT.PUT_LINE('У пользователя с читательским билетом №'
                || V_LIBRARY_CARD
                || ' на руках есть книга, которую он не вернул в срок');
        WHEN E_NO_SUCH_BOOK THEN
            DBMS_OUTPUT.PUT_LINE('Книги " '
                || V_BOOK_NAME
                || '" нет в библиотеке');
            DBMS_OUTPUT.PUT_LINE('Или какая-то книга не сдана в читательский зал');
    END RENT_A_BOOK;
    FUNCTION CHECK_GENRE (
        V_GENRE IN VARCHAR2
    ) RETURN NUMBER IS
        V_GENRE_ID     NUMBER;
        V_ERROR_CODE   NUMBER;
        V_ERROR_MESAGE VARCHAR2(100);
    BEGIN
        SELECT
            GENRES.ID INTO V_GENRE_ID
        FROM
            GENRES
        WHERE
            NAME = V_GENRE;
        RETURN V_GENRE_ID;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            INSERT INTO GENRES VALUES (
                GENRES_SEQ.NEXTVAL,
                V_GENRE
            ) RETURNING ID INTO V_GENRE_ID;
            RETURN V_GENRE_ID;
        WHEN OTHERS THEN
            V_ERROR_CODE := SQLCODE;
            V_ERROR_MESAGE := SQLERRM;
    END CHECK_GENRE;
    FUNCTION CHECK_TYPE (
        V_TYPE IN VARCHAR2
    ) RETURN NUMBER IS
        V_TYPE_ID      NUMBER;
        V_ERROR_CODE   NUMBER;
        V_ERROR_MESAGE VARCHAR2(100);
    BEGIN
        SELECT
            TYPES.ID INTO V_TYPE_ID
        FROM
            TYPES
        WHERE
            PUBLICATION_TYPE = V_TYPE;
        RETURN V_TYPE_ID;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            RETURN 0;
        WHEN OTHERS THEN
            V_ERROR_CODE := SQLCODE;
            V_ERROR_MESAGE := SQLERRM;
    END CHECK_TYPE;
    FUNCTION CHECK_AGE_LIMIT (
        V_AGE_LIMIT IN NUMBER
    ) RETURN NUMBER IS
        V_AGE_LIMIT_ID NUMBER;
        V_ERROR_CODE   NUMBER;
        V_ERROR_MESAGE VARCHAR2(100);
    BEGIN
        SELECT
            AGE_LIMITS.ID INTO V_AGE_LIMIT_ID
        FROM
            AGE_LIMITS
        WHERE
            AGE = V_AGE_LIMIT;
        RETURN V_AGE_LIMIT_ID;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            RETURN 0;
        WHEN OTHERS THEN
            V_ERROR_CODE := SQLCODE;
            V_ERROR_MESAGE := SQLERRM;
    END CHECK_AGE_LIMIT;
    FUNCTION CHECK_AUTHOR (
        V_NAME IN VARCHAR2,
        V_SURNAME IN VARCHAR2
    ) RETURN NUMBER IS
        V_AUTHOR_ID    NUMBER;
        V_ERROR_CODE   NUMBER;
        V_ERROR_MESAGE VARCHAR2(100);
    BEGIN
        SELECT
            AUTHORS.ID INTO V_AUTHOR_ID
        FROM
            AUTHORS
        WHERE
            NAME = V_NAME
            AND SURNAME = V_SURNAME;
        RETURN V_AUTHOR_ID;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            INSERT INTO AUTHORS VALUES (
                AUTHORS_SEQ.NEXTVAL,
                V_NAME,
                V_SURNAME
            ) RETURNING ID INTO V_AUTHOR_ID;
            RETURN V_AUTHOR_ID;
        WHEN OTHERS THEN
            V_ERROR_CODE := SQLCODE;
            V_ERROR_MESAGE := SQLERRM;
    END CHECK_AUTHOR;
    FUNCTION CHECK_BOOK (
        V_BOOK_NAME IN VARCHAR2,
        V_PUBLICATION_YEAR IN NUMBER,
        V_COST IN NUMBER,
        V_PUBLISHER_ID IN NUMBER,
        V_TYPE_ID IN NUMBER,
        V_AGE_LIMIT_ID IN NUMBER,
        V_DESCRIPTION IN VARCHAR2
    ) RETURN NUMBER IS
        V_BOOK_ID      NUMBER;
        V_ERROR_CODE   NUMBER;
        V_ERROR_MESAGE VARCHAR2(100);
    BEGIN
        SELECT
            STOCK.ID INTO V_BOOK_ID
        FROM
            STOCK
        WHERE
            BOOK_NAME = V_BOOK_NAME
            AND PUBLICATION_YEAR = V_PUBLICATION_YEAR
            AND COST = V_COST
            AND PUBLISHER_ID = V_PUBLISHER_ID
            AND DESCRIPTION = V_DESCRIPTION
            AND TYPE_ID = V_TYPE_ID
            AND AGE_LIMIT_ID = V_AGE_LIMIT_ID;
        RETURN V_BOOK_ID;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            RETURN 0;
        WHEN OTHERS THEN
            V_ERROR_CODE := SQLCODE;
            V_ERROR_MESAGE := SQLERRM;
    END CHECK_BOOK;
    FUNCTION CHECK_PUBLISHER (
        V_PUBLISHER IN VARCHAR2
    ) RETURN NUMBER IS
        V_PUBLISHER_ID NUMBER;
        V_ERROR_CODE   NUMBER;
        V_ERROR_MESAGE VARCHAR2(100);
    BEGIN
        SELECT
            PUBLISHERS.ID INTO V_PUBLISHER_ID
        FROM
            PUBLISHERS
        WHERE
            PUBLISHER_NAME = V_PUBLISHER;
        RETURN V_PUBLISHER_ID;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            INSERT INTO PUBLISHERS VALUES (
                PUBLISHERS_SEQ.NEXTVAL,
                V_PUBLISHER
            ) RETURNING ID INTO V_PUBLISHER_ID;
            RETURN V_PUBLISHER_ID;
        WHEN OTHERS THEN
            V_ERROR_CODE := SQLCODE;
            V_ERROR_MESAGE := SQLERRM;
    END CHECK_PUBLISHER;
    FUNCTION CHECK_TAG (
        V_TAG IN VARCHAR2
    ) RETURN NUMBER IS
        V_TAG_ID       NUMBER;
        V_ERROR_CODE   NUMBER;
        V_ERROR_MESAGE VARCHAR2(100);
    BEGIN
        SELECT
            TAGS.ID INTO V_TAG_ID
        FROM
            TAGS
        WHERE
            TAG_NAME = V_TAG;
        RETURN V_TAG_ID;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            INSERT INTO TAGS VALUES (
                TAGS_SEQ.NEXTVAL,
                V_TAG
            ) RETURNING ID INTO V_TAG_ID;
            RETURN V_TAG_ID;
        WHEN OTHERS THEN
            V_ERROR_CODE := SQLCODE;
            V_ERROR_MESAGE := SQLERRM;
    END CHECK_TAG;
    PROCEDURE INSERT_IN_STOCK (
        V_BOOK_NAME IN VARCHAR2,
        V_AMOUNT IN NUMBER,
        V_PUBLICATION_YEAR IN NUMBER,
        V_COST IN NUMBER,
        V_PUBLISHER_ID IN NUMBER,
        V_TYPE_ID IN NUMBER,
        V_AGE_LIMIT_ID IN NUMBER,
        V_DESCRIPTION IN VARCHAR2,
        V_AUTHOR_ID IN NUMBER,
        V_GENRE_ID IN NUMBER,
        V_TAG_ID IN NUMBER
    ) IS
        V_STOCK_ID   NUMBER;
        V_CHECK_BOOK NUMBER := CHECK_BOOK(V_BOOK_NAME, V_PUBLICATION_YEAR, V_COST, V_PUBLISHER_ID, V_TYPE_ID, V_AGE_LIMIT_ID, V_DESCRIPTION);
    BEGIN
        IF V_CHECK_BOOK = 0 THEN
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
                SYSDATE
            ) RETURNING ID INTO V_STOCK_ID;
            INSERT INTO AUTHOR_STOCK VALUES (
                AUTHOR_STOCK_SEQ.NEXTVAL,
                V_AUTHOR_ID,
                V_STOCK_ID
            );
            INSERT INTO GENRE_STOCK VALUES (
                GENRE_STOCK_SEQ.NEXTVAL,
                V_GENRE_ID,
                V_STOCK_ID
            );
            INSERT INTO TAG_STOCK VALUES (
                TAG_STOCK_SEQ.NEXTVAL,
                V_TAG_ID,
                V_STOCK_ID
            );
            FOR I IN 1..V_AMOUNT LOOP
                INSERT INTO BOOKS VALUES (
                    BOOKS_SEQ.NEXTVAL,
                    V_STOCK_ID,
                    5
                );
            END LOOP;
        ELSE
            UPDATE STOCK
            SET
                AMOUNT = AMOUNT + V_AMOUNT
            WHERE
                ID = V_CHECK_BOOK;
            FOR I IN 1..V_AMOUNT LOOP
                INSERT INTO BOOKS VALUES (
                    BOOKS_SEQ.NEXTVAL,
                    V_CHECK_BOOK,
                    5
                );
            END LOOP;
        END IF;
        COMMIT;
    END INSERT_IN_STOCK;
    PROCEDURE ADD_BOOK (
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
    END;
END BOOKS_PKG;