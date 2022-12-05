--Создаем методы по созданию пользователя и выдачи чит. билета - Анонимный PL/SQL блок.
DECLARE
    V_NAME        VARCHAR2(100) := 'Евкакий';
    V_SURNAME     VARCHAR2(40) := 'Коловрат';
    V_BIRTHD_DATE DATE := '22.11.1973';
    V_RATING      NUMBER := 240;
    V_SEX         NUMBER(1) := 1;
    V_BLACK_LIST  NUMBER(1) := 0;
    V_MONEY       NUMBER := 0;
    V_ID          NUMBER;
    CURSOR C_READERS IS
        SELECT
            BIRTHD_DATE,
            NAME,
            SURNAME
        FROM
            READERS;
    V_B_DATE      DATE;
    V_N_R         VARCHAR2(100);
    V_S_R         VARCHAR2(100);
    V_RESULT      NUMBER := 1;
BEGIN
    OPEN C_READERS;
    LOOP
        FETCH C_READERS INTO V_B_DATE, V_N_R, V_S_R;
        EXIT WHEN C_READERS % NOTFOUND;
        IF V_B_DATE = V_BIRTHD_DATE AND V_N_R = V_NAME AND V_S_R =V_SURNAME THEN
            V_RESULT := 0;
        END IF;
    END LOOP;
    IF V_RESULT = 0 THEN
        DBMS_OUTPUT.PUT_LINE('Пользователь '
            || V_NAME
            || ' '
            || V_SURNAME
            || ' уже добавлен ранее!');
    ELSE
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
    END IF;
    COMMIT;
END;