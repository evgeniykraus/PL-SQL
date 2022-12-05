--Создаем методы по созданию пользователя и выдачи чит. билета
BEGIN
    ADD_READER ('Артём', 'Лосев', '12.01.2000', 100, 1, 0, 100);
END;
/

--Создаем метод по созданию новой книги (новый автор, новое издание)
BEGIN
    ADD_BOOK ('Гарри Поттер и философский камень', 'Книга', '«Перевернув конверт трясущимися руками', 'Куплен', 1, 3, 100, 2022, 'Джоан', 'Роулинг', 'Просвещение', 'Фантастика', 'Волшебные существа' );
END;
/

--Создаем метод по проверке может ли читатель взять книгу (кейсы: плохой рейтинг у читателя,
--читатель уже взял эту книгу, книга не подходит по возрасту и т.д.).
DECLARE
    V_RESULT NUMBER := TAKE_A_BOOK ('Артём Лосев', 23, 'Архипелаг ГУЛАГ');
BEGIN
    DBMS_OUTPUT.PUT_LINE(V_RESULT);
END;
/

-- Создаем метод по выдачи книги читателю
BEGIN
    GIVE_A_BOOK (1, 3, 4);
END;
/

-- Создаем метод по возврату книги читателем.
BEGIN
    RETURN_A_BOOK (1, 3, 4, 9);
END;
/

--Создаем метод, возвращающий таблицу выданных книг за определенный день
DECLARE
    V_RESULT SYS_REFCURSOR := RETURNED_BOOKS_TAB ('01.09.2022');
BEGIN
    DBMS_SQL.RETURN_RESULT(V_RESULT);
END;
/

--Создаем метод, возвращающий таблицу выданных книг за определенный день
DECLARE
    V_RESULT SYS_REFCURSOR := RECIVED_BOOKS_TAB ('01.09.2022');
BEGIN
    DBMS_SQL.RETURN_RESULT(V_RESULT);
END;
/

--Создаем метод, возвращающий отчет об инвентаризации в разрезе каждой книги
DECLARE
    V_RESULT SYS_REFCURSOR := INVENTORY_REPORT (3);
BEGIN
    DBMS_SQL.RETURN_RESULT(V_RESULT);
END;
/

--ПАКЕТЫ
DECLARE
    V_RESULT SYS_REFCURSOR;
BEGIN
 --таблица выданных книг за определенный день
    V_RESULT := REPORTS.RECIVED_BOOKS_TAB('01.09.2022');
    DBMS_SQL.RETURN_RESULT(V_RESULT);
 --таблица выданных книг за определенный день
    V_RESULT := REPORTS.RETURNED_BOOKS_TAB('01.09.2022');
    DBMS_SQL.RETURN_RESULT(V_RESULT);
 --отчет об инвентаризации в разрезе каждой книги
    V_RESULT := REPORTS.INVENTORY_REPORT(1);
    DBMS_SQL.RETURN_RESULT(V_RESULT);
END;
BEGIN
    DBMS_OUTPUT.PUT_LINE(BOOK_CHECKER.TAKE_A_BOOK('Артём Лосев', 23, 'Архипелаг ГУЛАГ'));
END;