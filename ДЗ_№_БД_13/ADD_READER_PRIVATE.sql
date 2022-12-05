CREATE OR REPLACE PROCEDURE ADD_READER (
    V_NAME IN VARCHAR2,
    V_SURNAME IN VARCHAR2,
    V_BIRTHD_DATE IN DATE,
    V_RATING IN NUMBER,
    V_SEX IN NUMBER,
    V_BLACK_LIST IN NUMBER,
    V_MONEY IN NUMBER
) IS
    V_ID NUMBER;
BEGIN
    INSERT INTO READERS VALUES (
        READERS_SEQ.NEXTVAL,
        V_NAME,
        V_SURNAME,
        V_BIRTHD_DATE,
        V_RATING,
        V_SEX,
        V_BLACK_LIST,
        V_MONEY,
        SYSDATE
    ) RETURNING LIBRARY_CARD INTO V_ID;
    DBMS_OUTPUT.PUT_LINE('Пользователь '
        || V_NAME
        || ' '
        || V_SURNAME
        || ' получает читательский билет № '
        || V_ID
        || '!');
END;