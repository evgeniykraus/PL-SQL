CREATE TABLE POSITIONS(
    ID NUMBER,
    JOB_TITLE VARCHAR2(100)
);

CREATE TABLE EMPLOYEES(
    ID NUMBER,
    NAME VARCHAR2(100),
    SURNAME VARCHAR2(100),
    POSITION_ID NUMBER
);

CREATE TABLE READERS(
    LIBRARY_CARD NUMBER,
    NAME VARCHAR2(100),
    SURNAME VARCHAR2(100),
    BIRTHD_DATE DATE,
    RATING NUMBER,
    SEX VARCHAR2(100),
    BLACK_LIST NUMBER,
    MONEY NUMBER
);

CREATE TABLE JOURNAL(
    ID NUMBER,
    RECIVE_DATE DATE,
    RETURN_DATE DATE,
    LIBRARY_CARD_ID NUMBER,
    BOOK_ID NUMBER,
    BOOK_RATING NUMBER,
    WHERE_READS VARCHAR2(100),
    EMPLOYEES_ID NUMBER
);

CREATE TABLE STOCK(
    ID NUMBER,
    BOOK_NAME VARCHAR2(400),
    AMOUNT NUMBER,
    PUBLICATION_YEAR NUMBER,
    COST NUMBER(8, 2),
    PUBLISHER_ID NUMBER,
    TYPE_ID NUMBER,
    AGE_LIMIT_ID NUMBER,
    DESCRIPTION VARCHAR2(4000),
    PURCHASE_TYPE VARCHAR2(400)
);

CREATE TABLE BOOKS(
    ID NUMBER,
    STOCK_ID NUMBER,
    CONDITION NUMBER
);

CREATE TABLE AGE_LIMITS(
    ID NUMBER,
    AGE NUMBER
);

CREATE TABLE TYPES(
    ID NUMBER,
    PUBLICATION_TYPE VARCHAR2(100)
);

CREATE TABLE TAG_STOCK(
    ID NUMBER,
    TAG_ID NUMBER,
    STOCK_ID NUMBER
);

CREATE TABLE GENRE_STOCK(
    ID NUMBER,
    GENRE_ID NUMBER,
    STOCK_ID NUMBER
);

CREATE TABLE AUTHOR_STOCK(
    ID NUMBER,
    AUTHOR_ID NUMBER,
    STOCK_ID NUMBER
);

CREATE TABLE PUBLISHERS(
    ID NUMBER,
    PUBLISHER_NAME VARCHAR2(100)
);

CREATE TABLE TAGS(
    ID NUMBER,
    TAG_NAME VARCHAR2(100)
);

CREATE TABLE GENRES(
    ID NUMBER,
    GENER_NAME VARCHAR2(100)
);

CREATE TABLE AUTHORS(
    ID NUMBER,
    NAME VARCHAR2(100),
    SURNAME VARCHAR2(100)
);

CREATE TABLE CHANGELOG(
    ID NUMBER,
    RECORDING_DATE DATE,
    LIBRARY_CARD_ID NUMBER,
    CHANGE VARCHAR2(100),
    EMPLOYEE_ID NUMBER
);