CREATE OR REPLACE PROCEDURE ADD_READER (
    V_NAME IN VARCHAR2,
    V_SURNAME IN VARCHAR2,
    V_BIRTHD_DATE IN DATE
) IS
    V_RESULT       NUMBER := FINDE_READER(V_NAME, V_SURNAME, V_BIRTHD_DATE);
    V_READER_ID    NUMBER;
    V_ERROR_CODE   NUMBER;
    V_ERROR_MESAGE VARCHAR2(100);
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
        DBMS_OUTPUT.PUT_LINE('Вероятно, этот человек (' ||V_NAME||' '||V_SURNAME||') уже мертв');
    WHEN OTHERS THEN
        V_ERROR_CODE := SQLCODE;
        V_ERROR_MESAGE := SQLERRM;
        DBMS_OUTPUT.PUT_LINE('Какая-то ошибка:');
        DBMS_OUTPUT.PUT_LINE(V_ERROR_MESAGE);
END ADD_READER;