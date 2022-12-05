CREATE OR REPLACE PROCEDURE ADD_READER_PUBLIC (
    V_NAME IN VARCHAR2,
    V_SURNAME IN VARCHAR2,
    V_BIRTHD_DATE IN DATE,
    V_RATING IN NUMBER,
    V_SEX IN NUMBER,
    V_BLACK_LIST IN NUMBER,
    V_MONEY IN NUMBER
) IS
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
    V_RESULT       NUMBER := 1;
BEGIN
    IF V_RATING < 0 THEN
        RAISE E_RATING;
    END IF;
    IF V_SEX > 1 OR V_SEX < 0 THEN
        RAISE Е_SEX;
    END IF;
    IF V_BLACK_LIST > 1 OR V_BLACK_LIST < 0 THEN
        RAISE Е_BLACK_LIST;
    END IF;
    IF (EXTRACT (YEAR FROM SYSDATE) - EXTRACT (YEAR FROM V_BIRTHD_DATE))<12 THEN
        RAISE E_BIRTHD_DATE;
    END IF;
    OPEN C_READERS;
    LOOP
        FETCH C_READERS INTO V_B_DATE, V_N_R, V_S_R;
        EXIT WHEN C_READERS % NOTFOUND;
        IF V_B_DATE = V_BIRTHD_DATE AND V_N_R = V_NAME AND V_S_R =V_SURNAME THEN
            V_RESULT := 0;
        END IF;
    END LOOP;
    CLOSE C_READERS;
    IF V_RESULT = 0 THEN
        DBMS_OUTPUT.PUT_LINE('Пользователь '
            || V_NAME
            || ' '
            || V_SURNAME
            || ' уже добавлен ранее!');
    ELSE
        ADD_READER (V_NAME, V_SURNAME, V_BIRTHD_DATE, V_RATING, V_SEX, V_BLACK_LIST, V_MONEY);
    END IF;
EXCEPTION
    WHEN E_RATING THEN
        DBMS_OUTPUT.PUT_LINE('Переменная V_RATING принемает только положительные значения');
    WHEN Е_SEX THEN
        DBMS_OUTPUT.PUT_LINE('Переменная V_SEX принемает значения 0(мужчина) и 1(женщина)');
    WHEN Е_BLACK_LIST THEN
        DBMS_OUTPUT.PUT_LINE('Переменная V_BLACK_LIST принемает значения 0(нет в черном списке) и 1(в черном списке)');
    WHEN E_AGE OR E_AGE_1 OR E_AGE_2 THEN
        DBMS_OUTPUT.PUT_LINE('Переменная V_BIRTHD_DATE должна задаваться в формате ДД.ММ.ГГГГ');
    WHEN E_VALUE_ERROR THEN
        DBMS_OUTPUT.PUT_LINE('Вы попытались выполнить инструкцию, которая привела к арифметической, числовой, строковой ошибке, ошибке преобразования или ограничения.');
        DBMS_OUTPUT.PUT_LINE('Распространенными причинами этой ошибки являются:');
        DBMS_OUTPUT.PUT_LINE('Вы попытались присвоить значение числовой переменной, но это значение больше, чем может обработать переменная.');
        DBMS_OUTPUT.PUT_LINE('Вы попытались присвоить числовой переменной нечисловое значение и вызвали ошибку преобразования.');
    WHEN E_BIRTHD_DATE THEN
        DBMS_OUTPUT.PUT_LINE('Читательский билет может получить человек, достигший 12 лет');
    WHEN OTHERS THEN
        V_ERROR_CODE := SQLCODE;
        V_ERROR_MESAGE := SQLERRM;
        DBMS_OUTPUT.PUT_LINE('Какая-то ошибка:');
        DBMS_OUTPUT.PUT_LINE(V_ERROR_MESAGE);
END;