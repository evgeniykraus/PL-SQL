CREATE OR REPLACE PROCEDURE INSERT_IN_STOCK (
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
    V_STOCK_ID NUMBER;
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
ELSE UPDATE STOCK
   SET AMOUNT = AMOUNT + V_AMOUNT
 WHERE ID = V_CHECK_BOOK;
 
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