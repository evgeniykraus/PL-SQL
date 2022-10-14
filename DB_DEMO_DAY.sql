SET SERVEROUTPUT ON SIZE UNLIMITED

--Создание ткблиц
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--BOOKS
CREATE TABLE BOOKS(
   ID NUMBER,
   STOCK_ID NUMBER NOT NULL,
   CONDITION NUMBER(1) NOT NULL,
   CONSTRAINT BOOKS_PK PRIMARY KEY (ID)
);

COMMENT ON TABLE BOOKS IS 'Список уникальных печатных материалов';
COMMENT ON COLUMN BOOKS.ID IS 'Идентификационный номер печатнго материала';
COMMENT ON COLUMN BOOKS.STOCK_ID IS 'Номер партии печатнго материала';
COMMENT ON COLUMN BOOKS.CONDITION IS 'Состояние печатнго материала';
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--POSITIONS
CREATE TABLE POSITIONS(
   ID NUMBER,
   JOB_TITLE VARCHAR2(40) NOT NULL,
   CONSTRAINT POSITIONS_PK PRIMARY KEY (ID)
);

COMMENT ON TABLE POSITIONS IS 'Список должностей сотрудников';
COMMENT ON COLUMN POSITIONS.ID IS 'Идентификационный номер должности';
COMMENT ON COLUMN POSITIONS.JOB_TITLE IS 'Наименование должности';
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--EMPLOYEES
CREATE TABLE EMPLOYEES(
   ID NUMBER,
   NAME VARCHAR2(40) NOT NULL,
   SURNAME VARCHAR2(40) NOT NULL,
   POSITION_ID NUMBER NOT NULL,
   CONSTRAINT EMPLOYEES_PK PRIMARY KEY (ID),
   CONSTRAINT EMPLOYEES_FK FOREIGN KEY (POSITION_ID) REFERENCES POSITIONS(ID)
);

COMMENT ON TABLE EMPLOYEES IS 'Список сотрудников';
COMMENT ON COLUMN EMPLOYEES.ID IS 'Идентификационный номер сотрудника';
COMMENT ON COLUMN EMPLOYEES.NAME IS 'Имя сотрудника';
COMMENT ON COLUMN EMPLOYEES.SURNAME IS 'Фамилия сотрудника';
COMMENT ON COLUMN EMPLOYEES.POSITION_ID IS 'Идентификационный номер должности сотрудника';
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--READERS
CREATE TABLE READERS(
   LIBRARY_CARD NUMBER,
   NAME VARCHAR2(30) NOT NULL,
   SURNAME VARCHAR2(30) NOT NULL,
   BIRTHD_DATE DATE NOT NULL,
   RATING NUMBER NOT NULL,
   BLACK_LIST NUMBER(1) NOT NULL,
   REGISTRATION_DATE TIMESTAMP,
   CONSTRAINT READERS_PK PRIMARY KEY (LIBRARY_CARD)
);

COMMENT ON TABLE READERS IS 'Список читателей';
COMMENT ON COLUMN READERS.LIBRARY_CARD IS 'Номер читательского билета';
COMMENT ON COLUMN READERS.NAME IS 'Имя читателя';
COMMENT ON COLUMN READERS.SURNAME IS 'Фамилия читателя';
COMMENT ON COLUMN READERS.BIRTHD_DATE IS 'Дата рождения читателя';
COMMENT ON COLUMN READERS.RATING IS 'Рейтинг читателя';
COMMENT ON COLUMN READERS.BLACK_LIST IS 'Отметка о внесении в ЧС';
COMMENT ON COLUMN READERS.REGISTRATION_DATE IS 'Дата регистрации читателя';
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--JOURNAL
CREATE TABLE JOURNAL(
   ID NUMBER,
   RECIVE_DATE TIMESTAMP NOT NULL,
   RETURN_DATE TIMESTAMP,
   LIBRARY_CARD_ID NUMBER NOT NULL,
   BOOK_ID NUMBER NOT NULL,
   BOOK_RATING NUMBER(1),
   WHERE_READS VARCHAR2(40),
   EMPLOYEES_ID NUMBER NOT NULL,
   CONSTRAINT JOURNAL_PK PRIMARY KEY (ID),
   CONSTRAINT JOURNAL_EMPLOYEES_ID_FK FOREIGN KEY (EMPLOYEES_ID) REFERENCES EMPLOYEES(ID),
   CONSTRAINT JOURNAL_BOOK_ID_FK FOREIGN KEY (BOOK_ID) REFERENCES BOOKS(ID),
   CONSTRAINT JOURNAL_LIBRARY_CARD_ID_FK FOREIGN KEY (LIBRARY_CARD_ID) REFERENCES READERS(LIBRARY_CARD)
);

COMMENT ON TABLE JOURNAL IS 'Журнал';
COMMENT ON COLUMN JOURNAL.ID IS 'Идентификационный номер записи';
COMMENT ON COLUMN JOURNAL.RECIVE_DATE IS 'Дата получения книги';
COMMENT ON COLUMN JOURNAL.RETURN_DATE IS 'Дата возврата книги';
COMMENT ON COLUMN JOURNAL.LIBRARY_CARD_ID IS 'Номер читательского билета';
COMMENT ON COLUMN JOURNAL.BOOK_ID IS 'Идентификационный номер печатнго материала';
COMMENT ON COLUMN JOURNAL.WHERE_READS IS 'Читал книгу в зале/Забрал книгу домой';
COMMENT ON COLUMN JOURNAL.EMPLOYEES_ID IS 'Идентификационный номер сотрудника';
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--AGE_LIMITS
CREATE TABLE AGE_LIMITS(
   ID NUMBER,
   AGE NUMBER(2) NOT NULL,
   CONSTRAINT AGE_LIMITS_PK PRIMARY KEY (ID)
);

COMMENT ON TABLE AGE_LIMITS IS 'Возрастные ограничения печатного материала';
COMMENT ON COLUMN AGE_LIMITS.ID IS 'Идентификационный номер возрастного ограничения';
COMMENT ON COLUMN AGE_LIMITS.AGE IS 'Возрастное ограничение';
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--TYPES
CREATE TABLE TYPES(
   ID NUMBER,
   PUBLICATION_TYPE VARCHAR2(40) NOT NULL,
   CONSTRAINT TYPES_PK PRIMARY KEY (ID)
);

COMMENT ON TABLE TYPES IS 'Типы печатного материала';
COMMENT ON COLUMN TYPES.ID IS 'Идентификационный номер типа печатного материала';
COMMENT ON COLUMN TYPES.ID IS 'Тип печатного материала';
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--PUBLISHERS
CREATE TABLE PUBLISHERS(
   ID NUMBER,
   PUBLISHER_NAME VARCHAR2(100) NOT NULL,
   CONSTRAINT PUBLISHERS_PK PRIMARY KEY (ID)
);

COMMENT ON TABLE PUBLISHERS IS 'Издатели';
COMMENT ON COLUMN PUBLISHERS.ID IS 'Идентификационный номер издательства';
COMMENT ON COLUMN PUBLISHERS.PUBLISHER_NAME IS 'Название издательства';
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--STOCK
CREATE TABLE STOCK(
   ID NUMBER,
   BOOK_NAME VARCHAR2(100) NOT NULL,
   AMOUNT NUMBER NOT NULL,
   PUBLICATION_YEAR NUMBER(4) NOT NULL,
   COST NUMBER(4) NOT NULL,
   PUBLISHER_ID NUMBER,
   TYPE_ID NUMBER NOT NULL,
   TAG_ID NUMBER NOT NULL,
   GENRE_ID NUMBER NOT NULL,
   AGE_LIMIT_ID NUMBER(1) NOT NULL,
   DESCRIPTION VARCHAR2(4000),
   RECEIPT_DATE TIMESTAMP,
   CONSTRAINT STOCK_PK PRIMARY KEY (ID),
   CONSTRAINT STOCK_PUBLISHER_ID_FK FOREIGN KEY (PUBLISHER_ID) REFERENCES PUBLISHERS(ID),
   CONSTRAINT STOCK_TYPE_ID_FK FOREIGN KEY (TYPE_ID) REFERENCES TYPES(ID),
   CONSTRAINT STOCK_AGE_LIMIT_ID_FK FOREIGN KEY (AGE_LIMIT_ID) REFERENCES AGE_LIMITS(ID)
);

COMMENT ON TABLE STOCK IS 'Книжный склад';
COMMENT ON COLUMN STOCK.ID IS 'Идентификационный номер партии книг';
COMMENT ON COLUMN STOCK.BOOK_NAME IS 'Название печатного материала';
COMMENT ON COLUMN STOCK.AMOUNT IS 'Количество печатного материала в партии';
COMMENT ON COLUMN STOCK.PUBLICATION_YEAR IS 'Год публикации печатного материала';
COMMENT ON COLUMN STOCK.COST IS 'Стоимость одного печатного материала из партии';
COMMENT ON COLUMN STOCK.PUBLISHER_ID IS 'Идентификационный номер издательства';
COMMENT ON COLUMN STOCK.TYPE_ID IS 'Идентификационный номер типа печатного материала';
COMMENT ON COLUMN STOCK.AGE_LIMIT_ID IS 'Идентификационный номер возрастного ограничения';
COMMENT ON COLUMN STOCK.DESCRIPTION IS 'Описание печатного материала';
COMMENT ON COLUMN STOCK.RECEIPT_DATE IS 'Дата поступления партии книг на склад';
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--TAGS
CREATE TABLE TAGS(
   ID NUMBER,
   TAG_NAME VARCHAR2(100) NOT NULL,
   CONSTRAINT TAGS_PK PRIMARY KEY (ID)
);

COMMENT ON TABLE TAGS IS 'Теги печатного материала';
COMMENT ON COLUMN TAGS.ID IS 'Идентификационный номер тега';
COMMENT ON COLUMN TAGS.TAG_NAME IS 'Название тега';
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--GENRES
CREATE TABLE GENRES(
   ID NUMBER,
   NAME VARCHAR2(60) NOT NULL,
   CONSTRAINT GENRES_PK PRIMARY KEY (ID)
);

COMMENT ON TABLE GENRES IS 'Жанр печатного материала';
COMMENT ON COLUMN GENRES.ID IS 'Идентификационный номер жанра';
COMMENT ON COLUMN GENRES.NAME IS 'Название жанра';
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--AUTHORS
CREATE TABLE AUTHORS(
   ID NUMBER,
   NAME VARCHAR2(40) NOT NULL,
   SURNAME VARCHAR2(40) NOT NULL,
   CONSTRAINT AUTHORS_PK PRIMARY KEY (ID)
);

COMMENT ON TABLE AUTHORS IS 'Авторы';
COMMENT ON COLUMN AUTHORS.ID IS 'Идентификационный номер автора';
COMMENT ON COLUMN AUTHORS.NAME IS 'Имя автора';
COMMENT ON COLUMN AUTHORS.SURNAME IS 'Фамилия автора';
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--TAG_STOCK
CREATE TABLE TAG_STOCK(
   ID NUMBER,
   TAG_ID NUMBER NOT NULL,
   STOCK_ID NUMBER NOT NULL,
   CONSTRAINT TAG_STOCK_PK PRIMARY KEY (ID),
   CONSTRAINT TAG_STOCK_TAG_ID_FK FOREIGN KEY (TAG_ID) REFERENCES TAGS(ID),
   CONSTRAINT TAG_STOCK_STOCK_ID_FK FOREIGN KEY (STOCK_ID) REFERENCES STOCK(ID)
);

COMMENT ON TABLE TAG_STOCK IS 'Таблица связующая тег и партию печатного материала';
COMMENT ON COLUMN TAG_STOCK.ID IS 'Идентификационный номер связи';
COMMENT ON COLUMN TAG_STOCK.TAG_ID IS 'Идентификационный номер тега';
COMMENT ON COLUMN TAG_STOCK.STOCK_ID IS 'Идентификационный номер партии печатного материала';
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--GENRE_STOCK
CREATE TABLE GENRE_STOCK(
   ID NUMBER,
   GENRE_ID NUMBER NOT NULL,
   STOCK_ID NUMBER NOT NULL,
   CONSTRAINT GENRE_STOCK_PK PRIMARY KEY (ID),
   CONSTRAINT GENRE_STOCK_STOCK_ID_FK FOREIGN KEY (STOCK_ID) REFERENCES STOCK(ID),
   CONSTRAINT GENRE_STOCK_GENRE_ID_FK FOREIGN KEY (GENRE_ID) REFERENCES GENRES(ID)
);

COMMENT ON TABLE GENRE_STOCK IS 'Таблица связующая жанр и партию печатного материала';
COMMENT ON COLUMN GENRE_STOCK.ID IS 'Идентификационный номер связи';
COMMENT ON COLUMN GENRE_STOCK.GENRE_ID IS 'Идентификационный номер жанра';
COMMENT ON COLUMN GENRE_STOCK.STOCK_ID IS 'Идентификационный номер партии печатного материала';
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--AUTHOR_STOCK
CREATE TABLE AUTHOR_STOCK(
   ID NUMBER,
   AUTHOR_ID NUMBER NOT NULL,
   STOCK_ID NUMBER NOT NULL,
   CONSTRAINT AUTHOR_STOCK_PK PRIMARY KEY (ID),
   CONSTRAINT AUTHOR_STOCK_AUTHOR_ID_FK FOREIGN KEY (AUTHOR_ID) REFERENCES AUTHORS(ID),
   CONSTRAINT AUTHOR_STOCK_STOCK_ID_FK FOREIGN KEY (STOCK_ID) REFERENCES STOCK(ID)
);

COMMENT ON TABLE AUTHOR_STOCK IS 'Таблица связующая автора и партию печатного материала';
COMMENT ON COLUMN AUTHOR_STOCK.ID IS 'Идентификационный номер связи';
COMMENT ON COLUMN AUTHOR_STOCK.AUTHOR_ID IS 'Идентификационный номер автора';
COMMENT ON COLUMN AUTHOR_STOCK.STOCK_ID IS 'Идентификационный номер партии печатного материала';
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Создание последовательностей
CREATE SEQUENCE READERS_SEQ MINVALUE 1 START WITH 1 INCREMENT BY 1 NOCACHE NOCYCLE;

CREATE SEQUENCE JOURNAL_SEQ MINVALUE 1 START WITH 1 INCREMENT BY 1 NOCACHE NOCYCLE;

CREATE SEQUENCE BOOKS_SEQ MINVALUE 1 START WITH 1 INCREMENT BY 1 NOCACHE NOCYCLE;

CREATE SEQUENCE AUTHOR_STOCK_SEQ MINVALUE 1 START WITH 1 INCREMENT BY 1 NOCACHE NOCYCLE;

CREATE SEQUENCE EMPLOYEES_SEQ MINVALUE 1 START WITH 1 INCREMENT BY 1 NOCACHE NOCYCLE;

CREATE SEQUENCE POSITIONS_SEQ MINVALUE 1 START WITH 1 INCREMENT BY 1 NOCACHE NOCYCLE;

CREATE SEQUENCE AUTHORS_SEQ MINVALUE 1 START WITH 1 INCREMENT BY 1 NOCACHE NOCYCLE;

CREATE SEQUENCE TAG_STOCK_SEQ MINVALUE 1 START WITH 1 INCREMENT BY 1 NOCACHE NOCYCLE;

CREATE SEQUENCE GENRE_STOCK_SEQ MINVALUE 1 START WITH 1 INCREMENT BY 1 NOCACHE NOCYCLE;

CREATE SEQUENCE STOCK_SEQ MINVALUE 1 START WITH 1 INCREMENT BY 1 NOCACHE NOCYCLE;

CREATE SEQUENCE AGE_LIMITS_SEQ MINVALUE 1 START WITH 1 INCREMENT BY 1 NOCACHE NOCYCLE;

CREATE SEQUENCE TYPES_SEQ MINVALUE 1 START WITH 1 INCREMENT BY 1 NOCACHE NOCYCLE;

CREATE SEQUENCE PUBLISHERS_SEQ MINVALUE 1 START WITH 1 INCREMENT BY 1 NOCACHE NOCYCLE;

CREATE SEQUENCE TAGS_SEQ MINVALUE 1 START WITH 1 INCREMENT BY 1 NOCACHE NOCYCLE;

CREATE SEQUENCE GENRES_SEQ MINVALUE 1 START WITH 1 INCREMENT BY 1 NOCACHE NOCYCLE;

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Создание триггеров
--Выдача книги
CREATE OR REPLACE TRIGGER GIVE_THE_BOOK AFTER
   INSERT ON JOURNAL FOR EACH ROW
DECLARE
   V_RESUL NUMBER;
BEGIN
   SELECT
      BOOKS.STOCK_ID INTO V_RESUL
   FROM
      BOOKS
   WHERE
      BOOKS.ID = :NEW.BOOK_ID;
   UPDATE STOCK
   SET
      AMOUNT = AMOUNT - 1
   WHERE
      STOCK.ID = V_RESUL;
END;
/

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Возврат книги
CREATE OR REPLACE TRIGGER RETURN_THE_BOOK AFTER
   UPDATE ON JOURNAL FOR EACH ROW
DECLARE
   V_RESUL NUMBER;
BEGIN
   SELECT
      BOOKS.STOCK_ID INTO V_RESUL
   FROM
      BOOKS
   WHERE
      BOOKS.ID = :NEW.BOOK_ID;
   UPDATE STOCK
   SET
      AMOUNT = AMOUNT + 1
   WHERE
      STOCK.ID = V_RESUL;
END;
/

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Заполнение таблиц(Заполнены только таблицы с константами. Основное заполнение реализованно в анонимном PLSQL блоке ниже через пакеты.)
--По этой причине, после заполнения 4х таблиц, они будут созданы.
DECLARE
   V_ID_POSITIONS_DIRECTOR    NUMBER;
   V_ID_POSITIONS_STOREKEEPER NUMBER;
   V_ID_POSITIONS_LIBRARIAN   NUMBER;
BEGIN
   DBMS_OUTPUT.PUT_LINE('Заполнение таблицы AGE_LIMITS(Возрастные ограничения)');
   DBMS_OUTPUT.PUT_LINE('-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------');
 --AGE_LIMITS
   INSERT INTO AGE_LIMITS VALUES (
      AGE_LIMITS_SEQ.NEXTVAL,
      0
   );
   INSERT INTO AGE_LIMITS VALUES (
      AGE_LIMITS_SEQ.NEXTVAL,
      3
   );
   INSERT INTO AGE_LIMITS VALUES (
      AGE_LIMITS_SEQ.NEXTVAL,
      6
   );
   INSERT INTO AGE_LIMITS VALUES (
      AGE_LIMITS_SEQ.NEXTVAL,
      12
   );
   INSERT INTO AGE_LIMITS VALUES (
      AGE_LIMITS_SEQ.NEXTVAL,
      16
   );
   INSERT INTO AGE_LIMITS VALUES (
      AGE_LIMITS_SEQ.NEXTVAL,
      18
   );
 --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
   DBMS_OUTPUT.PUT_LINE('Заполнение таблицы POSITIONS(Должности сотрудников)');
   DBMS_OUTPUT.PUT_LINE('-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------');
 --POSITIONS
   INSERT INTO POSITIONS VALUES (
      POSITIONS_SEQ.NEXTVAL,
      'Директор'
   )RETURNING ID INTO V_ID_POSITIONS_DIRECTOR;
   INSERT INTO POSITIONS VALUES (
      POSITIONS_SEQ.NEXTVAL,
      'Кладовщик'
   )RETURNING ID INTO V_ID_POSITIONS_STOREKEEPER;
   INSERT INTO POSITIONS VALUES (
      POSITIONS_SEQ.NEXTVAL,
      'Библиотекарь'
   )RETURNING ID INTO V_ID_POSITIONS_LIBRARIAN;
 --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
   DBMS_OUTPUT.PUT_LINE('Заполнение таблицы EMPLOYEES(Сотрудники библиотеки)');
   DBMS_OUTPUT.PUT_LINE('-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------');
 --EMPLOYEES
   INSERT INTO EMPLOYEES (
      ID,
      NAME,
      SURNAME,
      POSITION_ID
   ) VALUES (
      EMPLOYEES_SEQ.NEXTVAL,
      'Клавдия',
      'Борде',
      V_ID_POSITIONS_DIRECTOR
   );
   INSERT INTO EMPLOYEES (
      ID,
      NAME,
      SURNAME,
      POSITION_ID
   ) VALUES (
      EMPLOYEES_SEQ.NEXTVAL,
      'Герасим',
      'Венгржановский',
      V_ID_POSITIONS_STOREKEEPER
   );
   INSERT INTO EMPLOYEES (
      ID,
      NAME,
      SURNAME,
      POSITION_ID
   ) VALUES (
      EMPLOYEES_SEQ.NEXTVAL,
      'София',
      'Рубинштейн',
      V_ID_POSITIONS_LIBRARIAN
   );
   INSERT INTO EMPLOYEES (
      ID,
      NAME,
      SURNAME,
      POSITION_ID
   ) VALUES (
      EMPLOYEES_SEQ.NEXTVAL,
      'Агафья',
      'Додефранц',
      V_ID_POSITIONS_LIBRARIAN
   );
   INSERT INTO EMPLOYEES (
      ID,
      NAME,
      SURNAME,
      POSITION_ID
   ) VALUES (
      EMPLOYEES_SEQ.NEXTVAL,
      'Мария',
      'Гаврилова',
      V_ID_POSITIONS_LIBRARIAN
   );
 --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
   DBMS_OUTPUT.PUT_LINE('Заполнение таблицы TYPES(Типы печатного материала)');
   DBMS_OUTPUT.PUT_LINE('-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------');
 --TYPES
   INSERT INTO TYPES VALUES (
      TYPES_SEQ.NEXTVAL,
      'Книга'
   );
   INSERT INTO TYPES VALUES (
      TYPES_SEQ.NEXTVAL,
      'Газета'
   );
   INSERT INTO TYPES VALUES (
      TYPES_SEQ.NEXTVAL,
      'Журнал'
   );
 --Тестовые данные для сложных запросов
   INSERT INTO READERS (
      LIBRARY_CARD,
      NAME,
      SURNAME,
      BIRTHD_DATE,
      RATING,
      BLACK_LIST,
      REGISTRATION_DATE
   ) VALUES (
      READERS_SEQ.NEXTVAL,
      'Кирилл',
      'Овчинников',
      TO_DATE('1973-6-27 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),
      100,
      1,
      SYSDATE
   );
END;
/

BEGIN
   DBMS_OUTPUT.PUT_LINE('Создание пакета ADD_READER_PKG');
   DBMS_OUTPUT.PUT_LINE('-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------');
END;
/

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Пакет содержит внешнюю процедуру ADD_READER, она позволяет выдать читательский билет.
CREATE OR REPLACE PACKAGE ADD_READER_PKG IS
   PROCEDURE ADD_READER (
      V_NAME IN VARCHAR2,
      V_SURNAME IN VARCHAR2,
      V_BIRTHD_DATE IN DATE
   );
END;
/

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE OR REPLACE PACKAGE BODY ADD_READER_PKG IS
 --Функция FINDE_READER совершает поиск читателя и передает значение во внешнюю процедуру ADD_READER.
 --Исходя из которого она выполнит действие(добавит читателя/выдаст ошибку о том, что читатель уже зарегистрирован в библиотеке).
   FUNCTION FINDE_READER (
      V_NAME IN VARCHAR2,
      V_SURNAME IN VARCHAR2,
      V_BIRTHD_DATE IN DATE
   ) RETURN NUMBER IS
      V_RESULT NUMBER;
   BEGIN
      SELECT
         LIBRARY_CARD INTO V_RESULT
      FROM
         READERS
      WHERE
         BIRTHD_DATE = V_BIRTHD_DATE
         AND NAME = V_NAME
         AND SURNAME = V_SURNAME;
      RETURN V_RESULT;
   EXCEPTION
      WHEN NO_DATA_FOUND THEN
         RETURN 0;
   END FINDE_READER;
   FUNCTION INSERT_IN_READERS (
      V_NAME IN VARCHAR2,
      V_SURNAME IN VARCHAR2,
      V_BIRTHD_DATE IN DATE
   ) RETURN NUMBER IS
      V_RATING     NUMBER := 500;
      V_BLACK_LIST NUMBER := 0;
      V_READER_ID  NUMBER;
   BEGIN
      INSERT INTO READERS VALUES (
         READERS_SEQ.NEXTVAL,
         V_NAME,
         V_SURNAME,
         V_BIRTHD_DATE,
         V_RATING,
         V_BLACK_LIST,
         SYSDATE
      ) RETURNING LIBRARY_CARD INTO V_READER_ID;
      COMMIT;
      RETURN V_READER_ID;
   END INSERT_IN_READERS;
   PROCEDURE ADD_READER (
      V_NAME IN VARCHAR2,
      V_SURNAME IN VARCHAR2,
      V_BIRTHD_DATE IN DATE
   ) IS
      V_RESULT        NUMBER := FINDE_READER(V_NAME, V_SURNAME, V_BIRTHD_DATE);
      V_READER_ID     NUMBER;
      V_ERROR_CODE    NUMBER;
      V_ERROR_MESAGE  VARCHAR2(100);
      E_BIRTHD_DATE EXCEPTION;
      E_BIRTHD_DATE_2 EXCEPTION;
   BEGIN
      IF (EXTRACT (YEAR FROM SYSDATE) - EXTRACT (YEAR FROM V_BIRTHD_DATE))<10 THEN
         RAISE E_BIRTHD_DATE;
      ELSIF (EXTRACT (YEAR FROM SYSDATE) - EXTRACT (YEAR FROM V_BIRTHD_DATE))>125 THEN
         RAISE E_BIRTHD_DATE_2;
      END IF;
      IF V_RESULT != 0 THEN
         DBMS_OUTPUT.PUT_LINE('Читатель '
            || V_NAME
            || ' '
            || V_SURNAME
            || ' уже добавлен ранее');
         DBMS_OUTPUT.PUT_LINE('Читательский билет пользователя №'
            || V_RESULT);
      ELSE
         V_READER_ID := INSERT_IN_READERS (V_NAME, V_SURNAME, V_BIRTHD_DATE);
         DBMS_OUTPUT.PUT_LINE('Пользователь '
            || V_NAME
            || ' '
            || V_SURNAME
            || ' получает читательский билет №'
            || V_READER_ID );
      END IF;
   EXCEPTION
      WHEN E_BIRTHD_DATE THEN
         DBMS_OUTPUT.PUT_LINE('Читательский билет может получить человек, достигший 10 лет');
      WHEN E_BIRTHD_DATE_2 THEN
         DBMS_OUTPUT.PUT_LINE('Вероятно, этот человек ('
            ||V_NAME
            ||' '
            ||V_SURNAME
            ||') уже мертв');
      WHEN OTHERS THEN
         V_ERROR_CODE := SQLCODE;
         V_ERROR_MESAGE := SQLERRM;
         DBMS_OUTPUT.PUT_LINE('Ошибка:');
         DBMS_OUTPUT.PUT_LINE(V_ERROR_MESAGE);
   END ADD_READER;
END;
 --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
/

BEGIN
   DBMS_OUTPUT.PUT_LINE('Создание пакета BOOKS_PKG');
   DBMS_OUTPUT.PUT_LINE('-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------');
END;
/

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Пакет BOOKS_PKG содержит внешнии процедуры ADD_BOOK, RENT_A_BOOK, GIVE_A_BOOK, RETURN_A_BOOK.
--Пакет BOOKS_PKG позволяет добавить партию книг на склад и создать экземляры этой книги, выдать экземпляр книги в аренду или в читательский зал, а также совершить возврат книги.
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
 --Функция CHECK_READER проверяет номер читательского билета(существует он или нет)
 --Реализована проверка читателя(черный список/просрочка)
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
 --Функция ACCESS_TO_READ через сложный SQL запрос проверяет возможность получения книги для чтения книги в библиотеке
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
 --Процедура GIVE_A_BOOK, исходя из предыдущих проверок совершает действие(выдача книги в читательский зал или выводит сообщение об ошибке)
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
 --Функция FINDE_BOOK совершает поиск книги по её ID.
 --Результат поиска (книга не закреплена за библиотекой или уже сдана)
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
            V_TAG_ID,
            V_GENRE_ID,
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
/

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

BEGIN
   DBMS_OUTPUT.PUT_LINE('Создание пакета REPORTS');
   DBMS_OUTPUT.PUT_LINE('-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------');
END;
/

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Пакет REPORTS содержит отчеты со статистикой.
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
/

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
BEGIN
 --Заполнение таблицы READERS
   DBMS_OUTPUT .PUT_LINE('Заполнение таблицы READERS');
   DBMS_OUTPUT .PUT_LINE('-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------');
   ADD_READER_PKG .ADD_READER('Ярослав', 'Кудряшов', TO_DATE('1992-3-26 00:00:00', 'YYYY-MM-DD HH24:MI:SS'));
   ADD_READER_PKG .ADD_READER('Ксения', 'Белоусова', TO_DATE('1946-1-17 00:00:00', 'YYYY-MM-DD HH24:MI:SS'));
   ADD_READER_PKG .ADD_READER('Василий', 'Чистяков', TO_DATE('2003-5-8 00:00:00', 'YYYY-MM-DD HH24:MI:SS'));
   ADD_READER_PKG .ADD_READER('Яна', 'Гусева', TO_DATE('2004-2-9 00:00:00', 'YYYY-MM-DD HH24:MI:SS'));
   ADD_READER_PKG .ADD_READER('Владислав', 'Овчинников', TO_DATE('1979-4-13 00:00:00', 'YYYY-MM-DD HH24:MI:SS'));
   ADD_READER_PKG .ADD_READER('Елизавета', 'Горбунова', TO_DATE('1968-7-15 00:00:00', 'YYYY-MM-DD HH24:MI:SS'));
   ADD_READER_PKG .ADD_READER('Данила', 'Егоров', TO_DATE('1976-4-12 00:00:00', 'YYYY-MM-DD HH24:MI:SS'));
   ADD_READER_PKG .ADD_READER('Ульяна', 'Яковлева', TO_DATE('1977-6-11 00:00:00', 'YYYY-MM-DD HH24:MI:SS'));
   ADD_READER_PKG .ADD_READER('Игорь', 'Шапошников', TO_DATE('1987-7-5 00:00:00', 'YYYY-MM-DD HH24:MI:SS'));
   ADD_READER_PKG .ADD_READER('Майя', 'Баранова', TO_DATE('1951-11-16 00:00:00', 'YYYY-MM-DD HH24:MI:SS'));
   ADD_READER_PKG .ADD_READER('Адам', 'Осипов', TO_DATE('1988-11-30 00:00:00', 'YYYY-MM-DD HH24:MI:SS'));
   ADD_READER_PKG .ADD_READER('Ангелина', 'Гаврилова', TO_DATE('2003-6-19 00:00:00', 'YYYY-MM-DD HH24:MI:SS'));
   ADD_READER_PKG .ADD_READER('Игорь', 'Федоров', TO_DATE('1956-6-20 00:00:00', 'YYYY-MM-DD HH24:MI:SS'));
   ADD_READER_PKG .ADD_READER('Виктория', 'Андреева', TO_DATE('1983-7-26 00:00:00', 'YYYY-MM-DD HH24:MI:SS'));
   ADD_READER_PKG .ADD_READER('Арсений', 'Данилов', TO_DATE('1989-7-6 00:00:00', 'YYYY-MM-DD HH24:MI:SS'));
   ADD_READER_PKG .ADD_READER('Светлана', 'Антонова', TO_DATE('1961-5-28 00:00:00', 'YYYY-MM-DD HH24:MI:SS'));
   ADD_READER_PKG .ADD_READER('Игорь', 'Осипов', TO_DATE('1952-8-14 00:00:00', 'YYYY-MM-DD HH24:MI:SS'));
   ADD_READER_PKG .ADD_READER('Алиса', 'Соловьева', TO_DATE('1981-7-16 00:00:00', 'YYYY-MM-DD HH24:MI:SS'));
   ADD_READER_PKG .ADD_READER('Мирон', 'Блинов', TO_DATE('1959-8-9 00:00:00', 'YYYY-MM-DD HH24:MI:SS'));
   ADD_READER_PKG .ADD_READER('Малика', 'Цветкова', TO_DATE('1984-1-27 00:00:00', 'YYYY-MM-DD HH24:MI:SS'));
   ADD_READER_PKG .ADD_READER('Кирилл', 'Морозов', TO_DATE('2008-12-6 00:00:00', 'YYYY-MM-DD HH24:MI:SS'));
   ADD_READER_PKG .ADD_READER('Маргарита', 'Панфилова', TO_DATE('1947-2-16 00:00:00', 'YYYY-MM-DD HH24:MI:SS'));
   ADD_READER_PKG .ADD_READER('Глеб', 'Киселев', TO_DATE('1947-8-14 00:00:00', 'YYYY-MM-DD HH24:MI:SS'));
   ADD_READER_PKG .ADD_READER('Нина', 'Долгова', TO_DATE('1972-11-30 00:00:00', 'YYYY-MM-DD HH24:MI:SS'));
   ADD_READER_PKG .ADD_READER('Михаил', 'Яшин', TO_DATE('1945-10-15 00:00:00', 'YYYY-MM-DD HH24:MI:SS'));
   ADD_READER_PKG .ADD_READER('Милана', 'Жукова', TO_DATE('1984-5-17 00:00:00', 'YYYY-MM-DD HH24:MI:SS'));
   ADD_READER_PKG .ADD_READER('Руслан', 'Панфилов', TO_DATE('1951-2-25 00:00:00', 'YYYY-MM-DD HH24:MI:SS'));
   ADD_READER_PKG .ADD_READER('Аврора', 'Долгова', TO_DATE('1976-2-27 00:00:00', 'YYYY-MM-DD HH24:MI:SS'));
   ADD_READER_PKG .ADD_READER('Арсений', 'Осипов', TO_DATE('1956-2-16 00:00:00', 'YYYY-MM-DD HH24:MI:SS'));
   ADD_READER_PKG .ADD_READER('Алиса', 'Белоусова', TO_DATE('2011-8-13 00:00:00', 'YYYY-MM-DD HH24:MI:SS'));
   ADD_READER_PKG .ADD_READER('Виктор', 'Терехов', TO_DATE('1984-9-3 00:00:00', 'YYYY-MM-DD HH24:MI:SS'));
   ADD_READER_PKG .ADD_READER('Мария', 'Титова', TO_DATE('1969-2-5 00:00:00', 'YYYY-MM-DD HH24:MI:SS'));
   ADD_READER_PKG .ADD_READER('Степан', 'Семенов', TO_DATE('2008-11-22 00:00:00', 'YYYY-MM-DD HH24:MI:SS'));
   ADD_READER_PKG .ADD_READER('Малика', 'Гаврилова', TO_DATE('1970-7-23 00:00:00', 'YYYY-MM-DD HH24:MI:SS'));
   ADD_READER_PKG .ADD_READER('Лука', 'Семенов', TO_DATE('1971-12-27 00:00:00', 'YYYY-MM-DD HH24:MI:SS'));
   ADD_READER_PKG .ADD_READER('Ярослава', 'Яковлева', TO_DATE('1959-3-16 00:00:00', 'YYYY-MM-DD HH24:MI:SS'));
   ADD_READER_PKG .ADD_READER('Иван', 'Шапошников', TO_DATE('1971-8-23 00:00:00', 'YYYY-MM-DD HH24:MI:SS'));
   ADD_READER_PKG .ADD_READER('Сафия', 'Баранова', TO_DATE('1991-5-14 00:00:00', 'YYYY-MM-DD HH24:MI:SS'));
   ADD_READER_PKG .ADD_READER('Сергей', 'Попов', TO_DATE('1964-3-28 00:00:00', 'YYYY-MM-DD HH24:MI:SS'));
   ADD_READER_PKG .ADD_READER('Стефания', 'Долгова', TO_DATE('1953-9-27 00:00:00', 'YYYY-MM-DD HH24:MI:SS'));
   DBMS_OUTPUT .PUT_LINE('-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------');
 --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
 --Заполнение таблиц STOCK, BOOKS, GENRES, GENRES_STOCK, TAG, TAGS_STOCK, AUTHORS, AUTHOOR_STOCK, TYPES, PUBLISHER
   DBMS_OUTPUT .PUT_LINE('Заполнение таблиц STOCK, BOOKS, GENRES, GENRES_STOCK, TAG, TAGS_STOCK, AUTHORS, AUTHOOR_STOCK, TYPES, PUBLISHER');
   DBMS_OUTPUT .PUT_LINE('-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------');
   BOOKS_PKG .ADD_BOOK('Гарри Поттер и философский камень', 'Книга', '«Жизнь десятилетнего Гарри Поттера нельзя назвать сладкой: его родители умерли, едва ему исполнился год, а от дяди и тётки, взявших сироту на воспитание, достаются лишь тычки да подзатыльники. Но в одиннадцатый день рождения Гарри всё меняется.»', 10, 12, 200, 2020, 'Джоан', 'Роулинг', 'Просвещение', 'Фантастика', 'Волшебные существа' );
   BOOKS_PKG .ADD_BOOK('Гарри Поттер. Кубок огня', 'Книга', '«Жизнь десятилетнего Гарри Поттера нельзя назвать сладкой: его родители умерли, едва ему исполнился год, а от дяди и тётки, взявших сироту на воспитание, достаются лишь тычки да подзатыльники. Но в одиннадцатый день рождения Гарри всё меняется.»', 10, 12, 200, 2021, 'Джоан', 'Роулинг', 'Просвещение', 'Фантастика', 'Волшебные существа' );
   BOOKS_PKG .ADD_BOOK('Один день Ивана Денисовича', 'Книга', '«Я в 50-м году, в какой-то долгий лагерный зимний день таскал носилки с напарником и подумал: как описать всю нашу лагерную жизнь? По сути достаточно описать один всего день в подробностях… и день самого простого работяги, и тут отразится вся наша жизнь.»', 10, 12, 200, 2004, 'Александр', 'Солженицын', 'Издательство АСТ', 'Русская классика', 'Жизнь в СССР' );
   BOOKS_PKG .ADD_BOOK('Шантарам', 'Книга', '«Подлинная сага, литературный шедевр, издательский феномен, мощный и неподражаемый, интеллектуальный и теплый, преображающий и ироничный, затягивающий и пугающий, необычайно яркий, невероятно талантливый роман Шантарам.»', 10, 18, 250, 2010, 'Грегори', 'Робертс', 'Просвещение', 'Роман', 'Бестселлер' );
   BOOKS_PKG .ADD_BOOK('Архипелаг ГУЛАГ', 'Книга', '«Сам Александр Исаевич Солженицын определил свой эпохальный труд «Архипелаг ГУЛаг» как художественное исследование. Это очень точно. Документально- публицистическое изложение бесчисленных фактов сталинских репрессий с жестокой очевидностью позволяет каждому читателю почувствовать себя узником ГУЛага: без вины арестованным, мучаемым ночными допросами и изощренными пытками.»', 10, 16, 250, 2010, 'Александр', 'Солженицын', 'Просвещение', 'Биография', 'Полиция' );
   BOOKS_PKG .ADD_BOOK('Скотный двор', 'Книга', '«Книга Оруэлла «Скотный двор» актуальна во все времена и касается всего общества, это своеобразная притча-предупреждение, где прорисованы черты общества не только советского, но и современного. Гротескная сатира этой книги уморительна и бьет без промаха, и было бы смешно, если не было бы так грустно.»', 10, 16, 250, 2000, 'Джордж', 'Оруэлл', 'Просвещение', 'Зарубежная классика', 'Философская' );
   BOOKS_PKG .ADD_BOOK('Властелин Колец. Братство Кольца', 'Книга', '«Племянник Бильбо Бэггинса, хоббит Фродо, даже и не подозревал, какое на самом деле наследство оставил ему его дядюшка. Однажды теплым весенним утром на пороге дома Фродо появляется волшебник Гэндальф. И привычный мир встает с ног на голову, страшная война из слухов становится частью жизни, а коварные и жуткие слуги Врага готовы на все, лишь бы вернуть потерянное своему господину.»', 10, 12, 250, 2010, 'Джон', 'Рональд', 'Просвещение', 'Фэнтези', 'Волшебные миры' );
   BOOKS_PKG .ADD_BOOK('Красная таблетка. Посмотри правде в глаза!', 'Книга', '«Книга простым языком объясняет читателю, каким образом работает человеческий мозг. Без сложной терминологии автор говорит о самой природе сознания – емко, просто и с долей юмора. Почему мы недооцениваем возможности собственного мозга, неправильно воспринимаем окружающий мир и людей в нем? А главное – почему большинству современников так тяжело найти самих себя? Ответы – в «Красной таблетке».»', 10, 12, 250, 2012, 'Андрей', 'Курпатов', 'Просвещение', 'Научно-популярная литература', 'Работа над собой' );
   BOOKS_PKG .ADD_BOOK('SQL: Руководство по изучению языка', 'Книга', '«В настоящем издании рассказывается об использовании запросов SQL для решения соответствующих классов задач по выборке данных, их модификации или по работе с объектами структуры базы данных. Все конструкции подробно описываются и иллюстрируются большим количеством примеров. Кроме того, для каждого типа запросов рассматриваются отклонения от стандарта в реализации наиболее распространенных СУБД: MS Access, MS SQL Server, Oracle, MySQL и PostgreSQL.»', 10, 0, 190, 2004, 'Крис', 'Фиайли', 'ДМК Пресс', 'Программирование', 'Базы данных' );
   BOOKS_PKG .ADD_BOOK('Атлант расправил плечи', 'Книга', '«В США наступило время социализма. «Политика равных возможностей» – вот кредо тех, кто пришел к власти. Успеха и таланта хватит на всех! Вот только социалисты не предвидели, что их реформы приведут к краху экономики и развалят институт американского бизнеса… Повсюду начинают исчезать знаменитости и богатейшие олигархи страны.»', 10, 16, 400, 2001, 'Айн', 'Рэнд', 'Просвещение', 'Литература 20 века', 'Антиутопия' );
   BOOKS_PKG .ADD_BOOK('451 градус по Фаренгейту', 'Книга', '«451° по Фаренгейту – температура, при которой воспламеняется и горит бумага. Философская антиутопия Брэдбери рисует беспросветную картину развития постиндустриального общества: это мир будущего, в котором все письменные издания безжалостно уничтожаются специальным отрядом пожарных, а хранение книг преследуется по закону, интерактивное телевидение успешно служит всеобщему оболваниванию, карательная психиатрия решительно разбирается с редкими инакомыслящими, а на охоту за неисправимыми диссидентами выходит электрический пес… Роман, принесший своему творцу мировую известность..»', 10, 16, 370, 2019, 'Рэй', 'Брэдбери', 'Эскимо', ' Фантастика', 'Тоталитаризм' );
   BOOKS_PKG .ADD_BOOK('Вязание – ваше хобби №3', 'Журнал', '«В издании «Вязание – ваше хобби. Каталог» под одной обложкой собраны лучшие идеи по рукоделию и вязанию. Тематические выпуски журнала покорят рукодельниц идеями и удобной подачей материала. К каждому проекту предложено подробное описание работы, которое сопровождается фотографиями.»', 10, 16, 120, 2019, 'Диляра', 'Тасбулатова', 'ЗМС МЕДИА', ' Женские журналы', 'Хобби' );
   BOOKS_PKG .ADD_BOOK('Энергетика и промышленность России №1', 'Газета', '«Газета «Энергетика и промышленность России» – ведущее общероссийское издание об электроэнергетике, энергомашиностроении, электротехнике и других отраслях, связанных, с топливно-энергетическим комплексом. Подробности изменений в энергетике, новинки оборудования и технологий, новости регионов, комментарии специалистов, репортажи о самых важных и ярких событиях из жизни энергетиков нашей страны.»', 10, 16, 80, 2016, 'Дмитрий', 'Муратов', 'ЭПР', 'Промышленность', 'Политика' );
   DBMS_OUTPUT .PUT_LINE('-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------');
 --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
 --Заполнение таблицы JOURNAL
   DBMS_OUTPUT .PUT_LINE('Заполнение таблицы JOURNAL');
   DBMS_OUTPUT .PUT_LINE('-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------');
 --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
   DBMS_OUTPUT .PUT_LINE('Выдача книг в аренду и читательский зал');
   DBMS_OUTPUT .PUT_LINE('-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------');
   BOOKS_PKG.RENT_A_BOOK(10, 'Красная таблетка. Посмотри правде в глаза!');
   BOOKS_PKG.GIVE_A_BOOK(31, 'Атлант расправил плечи');
   BOOKS_PKG.RENT_A_BOOK(13, 'Энергетика и промышленность России №1');
   BOOKS_PKG.GIVE_A_BOOK(32, 'Гарри Поттер и философский камень');
   BOOKS_PKG.RENT_A_BOOK(19, '451 градус по Фаренгейту');
   BOOKS_PKG.GIVE_A_BOOK(23, 'Атлант расправил плечи');
   BOOKS_PKG.RENT_A_BOOK(19, 'Красная таблетка. Посмотри правде в глаза!');
   BOOKS_PKG.GIVE_A_BOOK(29, 'Гарри Поттер и философский камень');
   BOOKS_PKG.RENT_A_BOOK(2, 'Шантарам');
   BOOKS_PKG.GIVE_A_BOOK(21, 'Скотный двор');
   BOOKS_PKG.RENT_A_BOOK(19, 'Один день Ивана Денисовича');
   BOOKS_PKG.GIVE_A_BOOK(30, 'Один день Ивана Денисовича');
   BOOKS_PKG.RENT_A_BOOK(10, 'SQL: Руководство по изучению языка');
   BOOKS_PKG.GIVE_A_BOOK(34, 'Красная таблетка. Посмотри правде в глаза!');
   BOOKS_PKG.RENT_A_BOOK(7, 'Атлант расправил плечи');
   BOOKS_PKG.GIVE_A_BOOK(28, 'Властелин Колец. Братство Кольца');
   BOOKS_PKG.RENT_A_BOOK(9, 'Энергетика и промышленность России №1');
   BOOKS_PKG.GIVE_A_BOOK(38, 'Атлант расправил плечи');
   BOOKS_PKG.RENT_A_BOOK(3, 'Атлант расправил плечи');
   BOOKS_PKG.GIVE_A_BOOK(25, 'Властелин Колец. Братство Кольца');
   BOOKS_PKG.RENT_A_BOOK(11, 'Вязание – ваше хобби №3');
   BOOKS_PKG.GIVE_A_BOOK(36, 'Красная таблетка. Посмотри правде в глаза!');
   BOOKS_PKG.RENT_A_BOOK(9, '451 градус по Фаренгейту');
   BOOKS_PKG.GIVE_A_BOOK(34, 'Властелин Колец. Братство Кольца');
   BOOKS_PKG.RENT_A_BOOK(5, 'Красная таблетка. Посмотри правде в глаза!');
   BOOKS_PKG.GIVE_A_BOOK(25, 'Один день Ивана Денисовича');
   BOOKS_PKG.RENT_A_BOOK(12, 'Красная таблетка. Посмотри правде в глаза!');
   BOOKS_PKG.GIVE_A_BOOK(26, 'Властелин Колец. Братство Кольца');
   BOOKS_PKG.RENT_A_BOOK(7, 'Энергетика и промышленность России №1');
   BOOKS_PKG.GIVE_A_BOOK(24, 'Гарри Поттер и философский камень');
   BOOKS_PKG.RENT_A_BOOK(9, 'SQL: Руководство по изучению языка');
   BOOKS_PKG.GIVE_A_BOOK(32, 'Архипелаг ГУЛАГ');
   BOOKS_PKG.RENT_A_BOOK(14, 'Атлант расправил плечи');
   BOOKS_PKG.GIVE_A_BOOK(22, '451 градус по Фаренгейту');
   BOOKS_PKG.RENT_A_BOOK(19, '451 градус по Фаренгейту');
   BOOKS_PKG.GIVE_A_BOOK(24, 'Один день Ивана Денисовича');
   BOOKS_PKG.RENT_A_BOOK(12, 'Властелин Колец. Братство Кольца');
   BOOKS_PKG.GIVE_A_BOOK(26, 'Гарри Поттер и философский камень');
   BOOKS_PKG.RENT_A_BOOK(9, 'SQL: Руководство по изучению языка');
   BOOKS_PKG.GIVE_A_BOOK(26, 'Архипелаг ГУЛАГ');
END;
/

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Тестовая запись для запроса SQL!
INSERT INTO JOURNAL (
   ID,
   RECIVE_DATE,
   RETURN_DATE,
   LIBRARY_CARD_ID,
   BOOK_ID,
   BOOK_RATING,
   WHERE_READS,
   EMPLOYEES_ID
) VALUES (
   JOURNAL_SEQ.NEXTVAL,
   TO_DATE('01.09.21', 'DD.MM.RR'),
   NULL,
   '1',
   '1',
   NULL,
   'Аренда',
   3
);

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--1. Написать запрос поиска всех книг заданного автора (вывести наименование книг, жанра, возрастное ограничение и ФИО автора)
SELECT
   DISTINCT STOCK.BOOK_NAME,
   LISTAGG(DISTINCT GENRES.NAME,
   ', ') AS GENRE,
   AGE_LIMITS.AGE,
   LISTAGG(DISTINCT CONCAT(CONCAT(AUTHORS.NAME,
   ' '),
   AUTHORS.SURNAME),
   ', ') AS AUTHOR
FROM
   BOOKS
   LEFT JOIN STOCK
   ON STOCK.ID = BOOKS.STOCK_ID
   LEFT JOIN GENRE_STOCK
   ON STOCK.ID = GENRE_STOCK.STOCK_ID
   LEFT JOIN GENRES
   ON GENRES.ID = GENRE_STOCK.GENRE_ID
   LEFT JOIN AUTHOR_STOCK
   ON STOCK.ID = AUTHOR_STOCK.STOCK_ID
   LEFT JOIN AUTHORS
   ON AUTHORS.ID = AUTHOR_STOCK.AUTHOR_ID
   LEFT JOIN AGE_LIMITS
   ON STOCK.AGE_LIMIT_ID = AGE_LIMITS.ID
WHERE
   AUTHORS.NAME = 'Джоан'
   AND AUTHORS.SURNAME = 'Роулинг'
GROUP BY
   STOCK.BOOK_NAME,
   AGE_LIMITS.AGE;

/

------------------------------------------------------------------------------------------------------------------------------------------------------------------
--2. Написать запрос поиска всех книг изданных определенным издательством (позже/ранее заданной даты -
-- вывести наименование книг, жанра, возрастное ограничение, ФИО автора и издательство)
SELECT
   DISTINCT STOCK.BOOK_NAME,
   LISTAGG(DISTINCT GENRES.NAME,
   ', ')  AS GENRE,
   AGE_LIMITS.AGE,
   LISTAGG( DISTINCT CONCAT(CONCAT(AUTHORS.NAME,
   ' '),
   AUTHORS.SURNAME),
   ', ' ) AS AUTHOR,
   PUBLISHERS.PUBLISHER_NAME
FROM
   BOOKS
   LEFT JOIN STOCK
   ON STOCK.ID = BOOKS.STOCK_ID
   LEFT JOIN GENRE_STOCK
   ON STOCK.ID = GENRE_STOCK.STOCK_ID
   LEFT JOIN GENRES
   ON GENRES.ID = GENRE_STOCK.GENRE_ID
   LEFT JOIN AUTHOR_STOCK
   ON STOCK.ID = AUTHOR_STOCK.STOCK_ID
   LEFT JOIN AUTHORS
   ON AUTHORS.ID = AUTHOR_STOCK.AUTHOR_ID
   LEFT JOIN AGE_LIMITS
   ON STOCK.AGE_LIMIT_ID = AGE_LIMITS.ID
   LEFT JOIN PUBLISHERS
   ON STOCK.PUBLISHER_ID = PUBLISHERS.ID
WHERE
   PUBLISHERS.PUBLISHER_NAME = 'Просвещение'
   AND STOCK.PUBLICATION_YEAR > 2000
GROUP BY
   STOCK.BOOK_NAME,
   AGE_LIMITS.AGE,
   PUBLISHERS.PUBLISHER_NAME;

/

------------------------------------------------------------------------------------------------------------------------------------------------------------------
--3. Найти книги по заданным критериям (по жанру, по тегам, по автору, по ограничению)
SELECT
   DISTINCT STOCK.BOOK_NAME,
   GENRES.NAME,
   TAGS.TAG_NAME,
   AGE_LIMITS.AGE,
   AUTHORS.NAME,
   AUTHORS.SURNAME,
   PUBLISHERS.PUBLISHER_NAME
FROM
   BOOKS
   LEFT JOIN STOCK
   ON STOCK.ID = BOOKS.STOCK_ID
   LEFT JOIN GENRE_STOCK
   ON STOCK.ID = GENRE_STOCK.STOCK_ID
   LEFT JOIN GENRES
   ON GENRES.ID = GENRE_STOCK.GENRE_ID
   LEFT JOIN AUTHOR_STOCK
   ON STOCK.ID = AUTHOR_STOCK.STOCK_ID
   LEFT JOIN AUTHORS
   ON AUTHORS.ID = AUTHOR_STOCK.AUTHOR_ID
   LEFT JOIN AGE_LIMITS
   ON STOCK.AGE_LIMIT_ID = AGE_LIMITS.ID
   LEFT JOIN PUBLISHERS
   ON STOCK.PUBLISHER_ID = PUBLISHERS.ID
   LEFT JOIN TAG_STOCK
   ON STOCK.ID = TAG_STOCK.STOCK_ID
   LEFT JOIN TAGS
   ON TAGS.ID = TAG_STOCK.TAG_ID
WHERE
   TAGS.TAG_NAME = 'Полиция'
   AND GENRES.NAME = 'Биография'
   AND AUTHORS.NAME = 'Александр'
   AND AUTHORS.SURNAME = 'Солженицын'
   AND AGE > 12;

/

------------------------------------------------------------------------------------------------------------------------------------------------------------------
--4. Найти ТОП 5 самых популярных книг (по кол-ву выдачи)
SELECT
   BOOK_NAME,
   RANK,
   COUNT
FROM
   (
      SELECT
         STOCK.BOOK_NAME,
         COUNT (STOCK.BOOK_NAME)        AS COUNT,
         RANK() OVER (
      ORDER BY
         (COUNT(STOCK.BOOK_NAME)) DESC) AS RANK
      FROM
         BOOKS
         JOIN JOURNAL
         ON JOURNAL.BOOK_ID = BOOKS.ID JOIN STOCK
         ON STOCK.ID = BOOKS.STOCK_ID
      GROUP BY
         STOCK.BOOK_NAME
   )
WHERE
   RANK < 6
GROUP BY
   BOOK_NAME,
   RANK,
   COUNT
ORDER BY
   RANK;

/

------------------------------------------------------------------------------------------------------------------------------------------------------------------
--5. Найти ТОП 5 самых читающих пользователей (за заданный период)
SELECT
   READER,
   COUNT,
   RANK
FROM
   (
      SELECT
         LISTAGG(DISTINCT CONCAT(CONCAT(READERS.NAME,
         ' '),
         READERS.SURNAME),
         ', ')                                  AS READER,
         COUNT(JOURNAL.LIBRARY_CARD_ID)         AS COUNT,
         RANK() OVER (
      ORDER BY
         (COUNT(JOURNAL.LIBRARY_CARD_ID)) DESC) AS RANK
      FROM
         JOURNAL
         JOIN READERS
         ON READERS.LIBRARY_CARD = JOURNAL.LIBRARY_CARD_ID
      WHERE
         '21.08.2021' < JOURNAL.RECIVE_DATE
         AND JOURNAL.RECIVE_DATE < SYSDATE
      GROUP BY
         READERS.LIBRARY_CARD, READERS.NAME, READERS.SURNAME
   )
GROUP BY
   READER,
   COUNT,
   RANK
HAVING
   RANK < 6;

/

------------------------------------------------------------------------------------------------------------------------------------------------------------------
--6. Найти список книг которые не могут быть выданы читателю домой
SELECT
   *
FROM
   (
      SELECT
         DISTINCT TABLE_2.BOOK_NAME,
         (TABLE_2.COUNT_2 - NVL(TABLE_1.COUNT_1,
         0))                     AS AMOUNT,
         TABLE_2.TYPE,
         TABLE_2.AUTHOR,
         TABLE_2.PUBLICATION_YEAR,
         TABLE_2.COST,
         TABLE_2.AGE             AS AGE_LIMIT,
         CONCAT(CONCAT(READERS.NAME,
         ' '),
         READERS.SURNAME)        AS READER,
         ( EXTRACT( YEAR
      FROM
         SYSDATE ) - EXTRACT( YEAR FROM READERS.BIRTHD_DATE ) ) AS AGE,
         READERS.RATING,
         READERS.BLACK_LIST,
         CASE
            WHEN TABLE_2.TYPE = 'Книга' AND (TABLE_2.COUNT_2 - NVL(TABLE_1.COUNT_1, 0)) > 1 AND READERS.RATING > TABLE_2.BOOK_VALUE AND READERS.BLACK_LIST < 1 AND ( EXTRACT( YEAR FROM SYSDATE ) - EXTRACT( YEAR FROM READERS.BIRTHD_DATE ) ) > TABLE_2.AGE THEN
               'Yes'
            ELSE
               'No'
         END AS TAKE_AWAY
      FROM
         READERS,
         (
            SELECT
               STOCK.BOOK_NAME,
               COUNT(JOURNAL.BOOK_ID) AS COUNT_1
            FROM
               BOOKS
               JOIN STOCK
               ON BOOKS.STOCK_ID = STOCK.ID JOIN JOURNAL
               ON BOOKS.ID = JOURNAL.BOOK_ID
            WHERE
               JOURNAL.RETURN_DATE IS NULL
            GROUP BY
               STOCK.BOOK_NAME
         ) TABLE_1
         FULL JOIN (
            SELECT
               STOCK.BOOK_NAME,
               COUNT(BOOKS.STOCK_ID)                              AS COUNT_2,
               TYPES.PUBLICATION_TYPE                             AS TYPE,
               LISTAGG(DISTINCT CONCAT(CONCAT(AUTHORS.NAME,
               ' '),
               AUTHORS.SURNAME),
               ', ')                                              AS AUTHOR,
               STOCK.PUBLICATION_YEAR,
               STOCK.COST,
               AGE_LIMITS.AGE,
               ROUND(STOCK.COST / STOCK.AMOUNT * BOOKS.CONDITION) AS BOOK_VALUE
            FROM
               BOOKS
               LEFT JOIN STOCK
               ON BOOKS.STOCK_ID = STOCK.ID
               LEFT JOIN TYPES
               ON TYPES.ID = STOCK.TYPE_ID
               LEFT JOIN AUTHOR_STOCK
               ON STOCK.ID = AUTHOR_STOCK.STOCK_ID
               LEFT JOIN AUTHORS
               ON AUTHOR_STOCK.AUTHOR_ID = AUTHORS.ID
               LEFT JOIN AGE_LIMITS
               ON AGE_LIMITS.ID = STOCK.AGE_LIMIT_ID
            GROUP BY
               STOCK.BOOK_NAME,
               TYPES.PUBLICATION_TYPE,
               STOCK.PUBLICATION_YEAR,
               STOCK.COST,
               AGE_LIMITS.AGE,
               STOCK.COST,
               STOCK.AMOUNT,
               BOOKS.CONDITION
         ) TABLE_2
         ON TABLE_1.BOOK_NAME = TABLE_2.BOOK_NAME
      GROUP BY
         TABLE_2.BOOK_NAME,
         TABLE_2.COUNT_2,
         TABLE_1.COUNT_1,
         TABLE_2.TYPE,
         TABLE_2.AUTHOR,
         TABLE_2.PUBLICATION_YEAR,
         TABLE_2.COST,
         TABLE_2.AGE,
         READERS.SURNAME,
         TABLE_2.BOOK_VALUE,
         READERS.SURNAME,
         ( EXTRACT( YEAR FROM SYSDATE ) - EXTRACT( YEAR FROM READERS.BIRTHD_DATE ) ),
         READERS.RATING,
         READERS.BLACK_LIST,
         READERS.NAME
      HAVING
         SURNAME = 'Кудряшов'
         AND NAME = 'Ярослав'
   )
WHERE
   TAKE_AWAY = 'No'

/

------------------------------------------------------------------------------------------------------------------------------------------------------------------
--7. Запрос который покажет может ли читатель почитать/получить желаемую книгу
SELECT
   DISTINCT TABLE_2.BOOK_NAME,
   (TABLE_2.COUNT_2 - NVL(TABLE_1.COUNT_1,
   0))                     AS AMOUNT,
   TABLE_2.TYPE,
   TABLE_2.AUTHOR,
   TABLE_2.PUBLICATION_YEAR,
   TABLE_2.COST,
   TABLE_2.AGE             AS AGE_LIMIT,
   CONCAT(CONCAT(READERS.NAME,
   ' '),
   READERS.SURNAME)        AS READER,
   ( EXTRACT( YEAR
FROM
   SYSDATE ) - EXTRACT( YEAR FROM READERS.BIRTHD_DATE ) ) AS AGE,
   READERS.RATING,
   READERS.BLACK_LIST,
   CASE
      WHEN ( (TABLE_2.COUNT_2 - NVL(TABLE_1.COUNT_1, 0)) > 0
      OR TYPE = 'Книга' ) AND READERS.BLACK_LIST = 0 AND ( EXTRACT( YEAR FROM SYSDATE ) - EXTRACT( YEAR FROM READERS.BIRTHD_DATE ) ) > TABLE_2.AGE THEN
         'Yes'
      ELSE
         'No'
   END AS READ_HERE,
   CASE
      WHEN TABLE_2.TYPE = 'Книга' AND (TABLE_2.COUNT_2 - NVL(TABLE_1.COUNT_1, 0)) > 1 AND READERS.RATING > TABLE_2.BOOK_VALUE AND READERS.BLACK_LIST < 1 AND ( EXTRACT( YEAR FROM SYSDATE ) - EXTRACT( YEAR FROM READERS.BIRTHD_DATE ) ) > TABLE_2.AGE THEN
         'Yes'
      ELSE
         'No'
   END AS TAKE_AWAY
FROM
   READERS,
   (
      SELECT
         STOCK.BOOK_NAME,
         COUNT(JOURNAL.BOOK_ID) AS COUNT_1
      FROM
         BOOKS
         LEFT JOIN STOCK
         ON BOOKS.STOCK_ID = STOCK.ID
         LEFT JOIN JOURNAL
         ON BOOKS.ID = JOURNAL.BOOK_ID
      WHERE
         JOURNAL.RETURN_DATE IS NULL
      GROUP BY
         STOCK.BOOK_NAME
   ) TABLE_1
   FULL JOIN (
      SELECT
         STOCK.BOOK_NAME,
         COUNT(BOOKS.STOCK_ID)                              AS COUNT_2,
         TYPES.PUBLICATION_TYPE                             AS TYPE,
         LISTAGG(DISTINCT CONCAT(CONCAT(AUTHORS.NAME,
         ' '),
         AUTHORS.SURNAME),
         ', ')                                              AS AUTHOR,
         STOCK.PUBLICATION_YEAR,
         STOCK.COST,
         AGE_LIMITS.AGE,
         ROUND(STOCK.COST / STOCK.AMOUNT * BOOKS.CONDITION) AS BOOK_VALUE
      FROM
         BOOKS
         LEFT JOIN STOCK
         ON BOOKS.STOCK_ID = STOCK.ID
         LEFT JOIN TYPES
         ON TYPES.ID = STOCK.TYPE_ID
         LEFT JOIN AUTHOR_STOCK
         ON STOCK.ID = AUTHOR_STOCK.STOCK_ID
         LEFT JOIN AUTHORS
         ON AUTHOR_STOCK.AUTHOR_ID = AUTHORS.ID
         LEFT JOIN AGE_LIMITS
         ON AGE_LIMITS.ID = STOCK.AGE_LIMIT_ID
      GROUP BY
         STOCK.BOOK_NAME,
         TYPES.PUBLICATION_TYPE,
         STOCK.PUBLICATION_YEAR,
         STOCK.COST,
         AGE_LIMITS.AGE,
         STOCK.COST,
         STOCK.AMOUNT,
         BOOKS.CONDITION
   ) TABLE_2
   ON TABLE_1.BOOK_NAME = TABLE_2.BOOK_NAME
GROUP BY
   TABLE_2.BOOK_NAME,
   TABLE_2.COUNT_2,
   TABLE_1.COUNT_1,
   TABLE_2.TYPE,
   TABLE_2.AUTHOR,
   TABLE_2.PUBLICATION_YEAR,
   TABLE_2.COST,
   TABLE_2.AGE,
   READERS.SURNAME,
   TABLE_2.BOOK_VALUE,
   READERS.SURNAME,
   ( EXTRACT( YEAR FROM SYSDATE ) - EXTRACT( YEAR FROM READERS.BIRTHD_DATE ) ),
   READERS.RATING,
   READERS.BLACK_LIST,
   READERS.NAME
HAVING
   NAME = 'Ярослав'
   AND SURNAME = 'Кудряшов';

/

------------------------------------------------------------------------------------------------------------------------------------------------------------------
--8. Вывести список просроченных книг и их держателей со сроком просрочки
SELECT
   BOOK_ID,
   STOCK.BOOK_NAME,
   READERS.LIBRARY_CARD,
   CONCAT(CONCAT(READERS.NAME,
   ' '),
   READERS.SURNAME)                           AS READER,
   (ROUND(SYSDATE) - ROUND(RECIVE_DATE)) - 30 AS DEBTS
FROM
   JOURNAL
   JOIN READERS
   ON JOURNAL.LIBRARY_CARD_ID = READERS.LIBRARY_CARD JOIN BOOKS
   ON JOURNAL.BOOK_ID = BOOKS.ID
   JOIN STOCK
   ON STOCK.ID = BOOKS.STOCK_ID
WHERE
   (ROUND(SYSDATE) - ROUND(RECIVE_DATE)) - 30 > 0
   AND RETURN_DATE IS NULL;

/

------------------------------------------------------------------------------------------------------------------------------------------------------------------
--9. Вывести список неблагонадежных читателей
SELECT
   DISTINCT READERS.LIBRARY_CARD,
   CONCAT(CONCAT(READERS.NAME,
   ' '),
   READERS.SURNAME) AS READER
FROM
   READERS
   LEFT JOIN JOURNAL
   ON READERS.LIBRARY_CARD = JOURNAL.LIBRARY_CARD_ID
WHERE
   READERS.BLACK_LIST = 1
   OR ROUND(SYSDATE) - ROUND(RECIVE_DATE) > 14
   OR READERS.RATING < 200;

/

------------------------------------------------------------------------------------------------------------------------------------------------------------------
--10. Найти книгу похожую на ранее прочитанную
SELECT
   STOCK.ID,
   STOCK.BOOK_NAME,
   LISTAGG(DISTINCT GENRES.NAME,
   ', ') AS TYPE,
   LISTAGG(DISTINCT TAGS.TAG_NAME,
   ', ') AS TAG
FROM
   STOCK
   JOIN GENRE_STOCK
   ON STOCK.ID = GENRE_STOCK.STOCK_ID JOIN GENRES
   ON GENRES.ID = GENRE_STOCK.GENRE_ID
   JOIN TYPES
   ON TYPES.ID = STOCK.TYPE_ID JOIN TAG_STOCK
   ON STOCK.ID = TAG_STOCK.STOCK_ID
   JOIN TAGS
   ON TAGS.ID = TAG_STOCK.TAG_ID
WHERE
   TAGS.TAG_NAME IN (
      SELECT
         TAGS.TAG_NAME
      FROM
         STOCK
         JOIN TYPES
         ON TYPES.ID = STOCK.TYPE_ID JOIN TAG_STOCK
         ON STOCK.ID = TAG_STOCK.STOCK_ID
         JOIN TAGS
         ON TAGS.ID = TAG_STOCK.TAG_ID
      WHERE
         STOCK.BOOK_NAME LIKE 'Гарри Поттер и философский камень'
   )
   OR GENRES.NAME IN (
      SELECT
         GENRES.NAME
      FROM
         STOCK
         JOIN GENRE_STOCK
         ON STOCK.ID = GENRE_STOCK.STOCK_ID JOIN GENRES
         ON GENRES.ID = GENRE_STOCK.GENRE_ID
      WHERE
         STOCK.BOOK_NAME LIKE 'Гарри Поттер и философский камень'
   )
GROUP BY
   STOCK.ID, STOCK.BOOK_NAME, GENRES.NAME
HAVING
   STOCK.BOOK_NAME != 'Гарри Поттер и философский камень'

/

------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Для удаления всех созданных данных раскомментируйте код ниже!--
-- DROP TABLE JOURNAL;

-- DROP TABLE BOOKS;

-- DROP TABLE AUTHOR_STOCK;

-- DROP TABLE EMPLOYEES;

-- DROP TABLE POSITIONS;

-- DROP TABLE AUTHORS;

-- DROP TABLE TAG_STOCK;

-- DROP TABLE GENRE_STOCK;

-- DROP TABLE STOCK;

-- DROP TABLE AGE_LIMITS;

-- DROP TABLE TYPES;

-- DROP TABLE PUBLISHERS;

-- DROP TABLE TAGS;

-- DROP TABLE GENRES;

-- DROP TABLE READERS;

-- DROP SEQUENCE READERS_SEQ;

-- DROP SEQUENCE JOURNAL_SEQ;

-- DROP SEQUENCE BOOKS_SEQ;

-- DROP SEQUENCE AUTHOR_STOCK_SEQ;

-- DROP SEQUENCE EMPLOYEES_SEQ;

-- DROP SEQUENCE POSITIONS_SEQ;

-- DROP SEQUENCE AUTHORS_SEQ;

-- DROP SEQUENCE TAG_STOCK_SEQ;

-- DROP SEQUENCE GENRE_STOCK_SEQ;

-- DROP SEQUENCE STOCK_SEQ;

-- DROP SEQUENCE AGE_LIMITS_SEQ;

-- DROP SEQUENCE TYPES_SEQ;

-- DROP SEQUENCE PUBLISHERS_SEQ;

-- DROP SEQUENCE TAGS_SEQ;

-- DROP SEQUENCE GENRES_SEQ;

-- DROP  PACKAGE ADD_READER_PKG;

-- DROP  PACKAGE BOOKS_PKG;

-- DROP  PACKAGE REPORTS;