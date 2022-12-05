-- Создаем метод по выдачи книги читателю - Анонимный PL/SQL блок.
CREATE OR REPLACE PROCEDURE GIVE_A_BOOK (
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
            || V_BOOK_ID
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