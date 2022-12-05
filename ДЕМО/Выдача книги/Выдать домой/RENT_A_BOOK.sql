CREATE OR REPLACE PROCEDURE RENT_A_BOOK (
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
END RENT_A_BOOK;