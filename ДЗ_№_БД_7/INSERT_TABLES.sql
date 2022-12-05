--Age_limits
INSERT INTO AGE_LIMITS VALUES (
	AGE_LIMITS_SEQ.NEXTVAL,
	0
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

------------------------------------------------------------------------------------------------
--Positions
INSERT INTO POSITIONS VALUES (
	POSITIONS_SEQ.NEXTVAL,
	'Директор'
);

INSERT INTO POSITIONS VALUES (
	POSITIONS_SEQ.NEXTVAL,
	'Кладовщик'
);

INSERT INTO POSITIONS VALUES (
	POSITIONS_SEQ.NEXTVAL,
	'Библиотекарь'
);

------------------------------------------------------------------------------------------------
--Employees
INSERT INTO EMPLOYEES (
	ID,
	NAME,
	SURNAME,
	POSITION_ID
) VALUES (
	EMPLOYEES_SEQ.NEXTVAL,
	'Клавдия',
	'Борде',
	1
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
	2
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
	3
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
	3
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
	3
);

------------------------------------------------------------------------------------------------
--Types
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

------------------------------------------------------------------------------------------------
--Publishers
INSERT INTO PUBLISHERS VALUES (
	PUBLISHERS_SEQ.NEXTVAL,
	'Просвещение'
);

INSERT INTO PUBLISHERS VALUES (
	PUBLISHERS_SEQ.NEXTVAL,
	'Азбука-Аттикус'
);

INSERT INTO PUBLISHERS VALUES (
	PUBLISHERS_SEQ.NEXTVAL,
	'РИПОЛ'
);

INSERT INTO PUBLISHERS VALUES (
	PUBLISHERS_SEQ.NEXTVAL,
	'Издательство'
);

INSERT INTO PUBLISHERS VALUES (
	PUBLISHERS_SEQ.NEXTVAL,
	'Лань'
);

INSERT INTO PUBLISHERS VALUES (
	PUBLISHERS_SEQ.NEXTVAL,
	'Экзамен'
);

INSERT INTO PUBLISHERS VALUES (
	PUBLISHERS_SEQ.NEXTVAL,
	'Дрофа'
);

INSERT INTO PUBLISHERS VALUES (
	PUBLISHERS_SEQ.NEXTVAL,
	'СИМБАТ'
);

INSERT INTO PUBLISHERS VALUES (
	PUBLISHERS_SEQ.NEXTVAL,
	'Росмэн'
);

INSERT INTO PUBLISHERS VALUES (
	PUBLISHERS_SEQ.NEXTVAL,
	'Манн Иванов и Фербер'
);

INSERT INTO PUBLISHERS VALUES (
	PUBLISHERS_SEQ.NEXTVAL,
	'ИНФРА-М'
);

INSERT INTO PUBLISHERS VALUES (
	PUBLISHERS_SEQ.NEXTVAL,
	'Бином. Лаборатория знаний'
);

INSERT INTO PUBLISHERS VALUES (
	PUBLISHERS_SEQ.NEXTVAL,
	'Вентана-Граф'
);

INSERT INTO PUBLISHERS VALUES (
	PUBLISHERS_SEQ.NEXTVAL,
	'Вече'
);

INSERT INTO PUBLISHERS VALUES (
	PUBLISHERS_SEQ.NEXTVAL,
	'Клевер-Медиа-Групп'
);

INSERT INTO PUBLISHERS VALUES (
	PUBLISHERS_SEQ.NEXTVAL,
	'Издательские решения'
);

INSERT INTO PUBLISHERS VALUES (
	PUBLISHERS_SEQ.NEXTVAL,
	'Перо'
);

INSERT INTO PUBLISHERS VALUES (
	PUBLISHERS_SEQ.NEXTVAL,
	'Издательский дом Лев'
);

INSERT INTO PUBLISHERS VALUES (
	PUBLISHERS_SEQ.NEXTVAL,
	'Феникс'
);

INSERT INTO PUBLISHERS VALUES (
	PUBLISHERS_SEQ.NEXTVAL,
	'Центрполиграф'
);

INSERT INTO PUBLISHERS VALUES (
	PUBLISHERS_SEQ.NEXTVAL,
	'Проспект'
);

INSERT INTO PUBLISHERS VALUES (
	PUBLISHERS_SEQ.NEXTVAL,
	'Стрекоза-Пресс'
);

INSERT INTO PUBLISHERS VALUES (
	PUBLISHERS_SEQ.NEXTVAL,
	'Флинта'
);

INSERT INTO PUBLISHERS VALUES (
	PUBLISHERS_SEQ.NEXTVAL,
	'Фламинго'
);

INSERT INTO PUBLISHERS VALUES (
	PUBLISHERS_SEQ.NEXTVAL,
	'ГЭОТАР-Медиа'
);

INSERT INTO PUBLISHERS VALUES (
	PUBLISHERS_SEQ.NEXTVAL,
	'Русское слово-учебник'
);

---------------------------------------------------------------------------------------------------------------------------------------------------
--Stock
INSERT INTO STOCK(
	ID,
	BOOK_NAME,
	AMOUNT,
	PUBLICATION_YEAR,
	COST,
	TYPE_ID,
	AGE_LIMIT_ID,
	PUBLISHER_ID,
	DESCRIPTION
) VALUES (
	STOCK_SEQ.NEXTVAL,
	'Один день Ивана Денисовича',
	2,
	2007,
	100,
	1,
	3,
	1,
	'«Я в 50-м году, в какой-то долгий лагерный зимний день таскал носилки с напарником и подумал: как описать всю нашу лагерную жизнь? По сути достаточно описать один всего день в подробностях… и день самого простого работяги, и тут отразится вся наша жизнь.'
);

INSERT INTO STOCK(
	ID,
	BOOK_NAME,
	AMOUNT,
	PUBLICATION_YEAR,
	COST,
	TYPE_ID,
	AGE_LIMIT_ID,
	PUBLISHER_ID,
	DESCRIPTION
) VALUES (
	STOCK_SEQ.NEXTVAL,
	'Евгений Онегин',
	6,
	2018,
	128,
	1,
	4,
	5,
	'Роман А. С. Пушкина "Евгений Онегин" приводится в иллюстрациях известного живописца XX века Лидии Тимошенко. Главное пушкинское произведение стало единственной книгой, к которой Тимошенко обратилась как иллюстратор.'
);

INSERT INTO STOCK(
	ID,
	BOOK_NAME,
	AMOUNT,
	PUBLICATION_YEAR,
	COST,
	TYPE_ID,
	AGE_LIMIT_ID,
	PUBLISHER_ID,
	DESCRIPTION
) VALUES (
	STOCK_SEQ.NEXTVAL,
	'Скотный двор',
	8,
	2014,
	250,
	1,
	4,
	12,
	'В повести изображена эволюция общества животных, изгнавших со скотного двора (первоначально называвшегося ферма «Усадьба» или в других переводах — «Господский двор», «Райский уголок») его предыдущего владельца, жестокого мистера Джонса, от безграничной свободы к диктатуре свиньи по кличке Наполеон.'
);

INSERT INTO STOCK(
	ID,
	BOOK_NAME,
	AMOUNT,
	PUBLICATION_YEAR,
	COST,
	TYPE_ID,
	AGE_LIMIT_ID,
	PUBLISHER_ID,
	DESCRIPTION
) VALUES (
	STOCK_SEQ.NEXTVAL,
	'Война и мир',
	4,
	1999,
	300,
	1,
	3,
	18,
	'Война и мир» относится к литературному направлению реализм: в книге подробно описан ряд ключевых исторических событий, изображены типичные для российского общества персонажи, основной конфликт – «герой и общество».'
);

INSERT INTO STOCK(
	ID,
	BOOK_NAME,
	AMOUNT,
	PUBLICATION_YEAR,
	COST,
	TYPE_ID,
	AGE_LIMIT_ID,
	PUBLISHER_ID,
	DESCRIPTION
) VALUES (
	STOCK_SEQ.NEXTVAL,
	'Одноэтажная Америка',
	5,
	2003,
	350,
	1,
	4,
	11,
	'Книга о путешествии двух советских журналистов по Америке в середине 30х годов прошлого века. Книга написана в лучших традициях Ильфа и Петрова и рассказывает о быте простых американцев пост депрессионного периода.'
);

INSERT INTO STOCK(
	ID,
	BOOK_NAME,
	AMOUNT,
	PUBLICATION_YEAR,
	COST,
	TYPE_ID,
	AGE_LIMIT_ID,
	PUBLISHER_ID,
	DESCRIPTION
) VALUES (
	STOCK_SEQ.NEXTVAL,
	'Длинная серебряная ложка',
	5,
	2009,
	190,
	1,
	3,
	3,
	'Когда молодой англичанин Уолтер Стивенс приезжает в Трансильванию 1880х годов на поиски вампиров, он попадает в мир, где соседствуют сказка и реальность, а вампиры охотятся не только на людей, но и друг на друга. Уолтеру и его друзьям предстоит бороться как с внешними врагами, так и с внутренними демонами, пока они наконец не придут к выводу - даже если ты превратился в вампира, всегда можно остаться Человеком.'
);

INSERT INTO STOCK(
	ID,
	BOOK_NAME,
	AMOUNT,
	PUBLICATION_YEAR,
	COST,
	TYPE_ID,
	AGE_LIMIT_ID,
	PUBLISHER_ID,
	DESCRIPTION
) VALUES (
	STOCK_SEQ.NEXTVAL,
	'Архипелаг ГУЛАГ',
	5,
	2000,
	150,
	1,
	4,
	9,
	'«…Книга – о крови, о поте, о слезах, о страданиях, о безнадежности, а ее закрываешь с ощущением силы и света. Она показывает: человек во всех обстоятельствах может остаться человеком. Дает ощущение, что наш народ не кончился, мы прошли нижнюю точку, мы прошли катарсис. Исправлять жизнь будет трудно, но возможно».'
);

INSERT INTO STOCK(
	ID,
	BOOK_NAME,
	AMOUNT,
	PUBLICATION_YEAR,
	COST,
	TYPE_ID,
	AGE_LIMIT_ID,
	PUBLISHER_ID,
	DESCRIPTION
) VALUES (
	STOCK_SEQ.NEXTVAL,
	'Собачье сердце',
	5,
	2001,
	130,
	1,
	3,
	19,
	'Профессор Преображенский и доктор Борменталь, совсем как Шерлок Холмс и Ватсон, пускаются в настоящее приключение. Подобно Фаусту Гёте, они создают своего "гомункулуса", не представляя, чем обернется научный и человеческий эксперимент... '
);

INSERT INTO STOCK(
	ID,
	BOOK_NAME,
	AMOUNT,
	PUBLICATION_YEAR,
	COST,
	TYPE_ID,
	AGE_LIMIT_ID
) VALUES (
	STOCK_SEQ.NEXTVAL,
	'Крокодил(выпуск 27)',
	2,
	1952,
	1,
	3,
	3
);

INSERT INTO STOCK(
	ID,
	BOOK_NAME,
	AMOUNT,
	PUBLICATION_YEAR,
	COST,
	TYPE_ID,
	AGE_LIMIT_ID
) VALUES (
	STOCK_SEQ.NEXTVAL,
	'Коммерсантъ(выпуск 181)',
	3,
	1997,
	10,
	2,
	3
);

---------------------------------------------------------------------------------------------------------------------------------------------------
--Authors
INSERT INTO AUTHORS (
	ID,
	NAME,
	SURNAME
) VALUES (
	AUTHORS_SEQ.NEXTVAL,
	'Илья',
	'Ильф'
);

INSERT INTO AUTHORS (
	ID,
	NAME,
	SURNAME
) VALUES (
	AUTHORS_SEQ.NEXTVAL,
	'Евгений',
	'Петров'
);

INSERT INTO AUTHORS (
	ID,
	NAME,
	SURNAME
) VALUES (
	AUTHORS_SEQ.NEXTVAL,
	'Кэтрин',
	'Коути'
);

INSERT INTO AUTHORS (
	ID,
	NAME,
	SURNAME
) VALUES (
	AUTHORS_SEQ.NEXTVAL,
	'Кэрри',
	'Гринберг'
);

INSERT INTO AUTHORS (
	ID,
	NAME,
	SURNAME
) VALUES (
	AUTHORS_SEQ.NEXTVAL,
	'Александр',
	'Солженицын'
);

INSERT INTO AUTHORS (
	ID,
	NAME,
	SURNAME
) VALUES (
	AUTHORS_SEQ.NEXTVAL,
	'Михаил',
	'Булгаков'
);

INSERT INTO AUTHORS (
	ID,
	NAME,
	SURNAME
) VALUES (
	AUTHORS_SEQ.NEXTVAL,
	'Александр',
	'Пушкин'
);

INSERT INTO AUTHORS (
	ID,
	NAME,
	SURNAME
) VALUES (
	AUTHORS_SEQ.NEXTVAL,
	'Джордж',
	'Оруэлл'
);

INSERT INTO AUTHORS (
	ID,
	NAME,
	SURNAME
) VALUES (
	AUTHORS_SEQ.NEXTVAL,
	'Лев',
	'Толстой'
);

------------------------------------------------------------------------------------------------
--Author_stock--
--Один день Ивана Денисовича
INSERT INTO AUTHOR_STOCK VALUES (
	AUTHOR_STOCK_SEQ.NEXTVAL,
	5,
	1
);

--Евгений Онегин
INSERT INTO AUTHOR_STOCK VALUES (
	AUTHOR_STOCK_SEQ.NEXTVAL,
	7,
	2
);

--Скотный двор
INSERT INTO AUTHOR_STOCK VALUES (
	AUTHOR_STOCK_SEQ.NEXTVAL,
	8,
	3
);

--Война и мир
INSERT INTO AUTHOR_STOCK VALUES (
	AUTHOR_STOCK_SEQ.NEXTVAL,
	9,
	4
);

--Одноэтажная Америка
INSERT INTO AUTHOR_STOCK VALUES (
	AUTHOR_STOCK_SEQ.NEXTVAL,
	1,
	5
);

INSERT INTO AUTHOR_STOCK VALUES (
	AUTHOR_STOCK_SEQ.NEXTVAL,
	2,
	5
);

--Длинная серебряная ложка
INSERT INTO AUTHOR_STOCK VALUES (
	AUTHOR_STOCK_SEQ.NEXTVAL,
	3,
	6
);

INSERT INTO AUTHOR_STOCK VALUES (
	AUTHOR_STOCK_SEQ.NEXTVAL,
	4,
	6
);

--Архипелаг ГУЛАГ
INSERT INTO AUTHOR_STOCK VALUES (
	AUTHOR_STOCK_SEQ.NEXTVAL,
	5,
	7
);

--Собачье сердце
INSERT INTO AUTHOR_STOCK VALUES (
	AUTHOR_STOCK_SEQ.NEXTVAL,
	6,
	8
);

---------------------------------------------------------------------------------------------------------------------------------------------------
--Genres
INSERT INTO GENRES VALUES (
	GENRES_SEQ.NEXTVAL,
	'Драма'
);

INSERT INTO GENRES VALUES (
	GENRES_SEQ.NEXTVAL,
	'Роман'
);

INSERT INTO GENRES VALUES (
	GENRES_SEQ.NEXTVAL,
	'Фантастика'
);

INSERT INTO GENRES VALUES (
	GENRES_SEQ.NEXTVAL,
	'Поэзия'
);

INSERT INTO GENRES VALUES (
	GENRES_SEQ.NEXTVAL,
	'Сатира'
);

INSERT INTO GENRES VALUES (
	GENRES_SEQ.NEXTVAL,
	'Приключения'
);

INSERT INTO GENRES VALUES (
	GENRES_SEQ.NEXTVAL,
	'Проза'
);

INSERT INTO GENRES VALUES (
	GENRES_SEQ.NEXTVAL,
	'Детектив'
);

INSERT INTO GENRES VALUES (
	GENRES_SEQ.NEXTVAL,
	'Фэнтези'
);

INSERT INTO GENRES VALUES (
	GENRES_SEQ.NEXTVAL,
	'Детективы'
);

INSERT INTO GENRES VALUES (
	GENRES_SEQ.NEXTVAL,
	'Эротика'
);

INSERT INTO GENRES VALUES (
	GENRES_SEQ.NEXTVAL,
	'Триллеры'
);

INSERT INTO GENRES VALUES (
	GENRES_SEQ.NEXTVAL,
	'Публицистика'
);

------------------------------------------------------------------------------------------------
--Genres_stock--
--Один день Ивана Денисовича
INSERT INTO GENRE_STOCK VALUES (
    GENRE_STOCK_SEQ.NEXTVAL,
    2,
    1
);

--Евгений Онегин
INSERT INTO GENRE_STOCK VALUES (
    GENRE_STOCK_SEQ.NEXTVAL,
    4,
    2
);

--Скотный двор
INSERT INTO GENRE_STOCK VALUES (
    GENRE_STOCK_SEQ.NEXTVAL,
    5,
    3
);

--Война и мир
INSERT INTO GENRE_STOCK VALUES (
    GENRE_STOCK_SEQ.NEXTVAL,
    2,
    4
);

INSERT INTO GENRE_STOCK VALUES (
    GENRE_STOCK_SEQ.NEXTVAL,
    7,
    4
);

--Одноэтажная Америка
INSERT INTO GENRE_STOCK VALUES (
    GENRE_STOCK_SEQ.NEXTVAL,
    13,
    5
);

--Длинная серебряная ложка
INSERT INTO GENRE_STOCK VALUES (
    GENRE_STOCK_SEQ.NEXTVAL,
    6,
    6
);

--Архипелаг ГУЛАГ
INSERT INTO GENRE_STOCK VALUES (
    GENRE_STOCK_SEQ.NEXTVAL,
    2,
    7
);

--Собачье сердце
INSERT INTO GENRE_STOCK VALUES (
    GENRE_STOCK_SEQ.NEXTVAL,
    3,
    8
);
---------------------------------------------------------------------------------------------------------------------------------------------------
--Tags--
INSERT INTO TAGS VALUES (
    TAGS_SEQ.NEXTVAL,
	'ГУЛАГ'
);

INSERT INTO TAGS VALUES (
    TAGS_SEQ.NEXTVAL,
	'Лауреаты Нобелевской премии'
);

INSERT INTO TAGS VALUES (
    TAGS_SEQ.NEXTVAL,
	'Русская классика'
);

INSERT INTO TAGS VALUES (
    TAGS_SEQ.NEXTVAL,
	'Политическая сатира'
);

INSERT INTO TAGS VALUES (
    TAGS_SEQ.NEXTVAL,
	'Зарубежная классика'
);

INSERT INTO TAGS VALUES (
    TAGS_SEQ.NEXTVAL,
	'Любовные'
);

INSERT INTO TAGS VALUES (
    TAGS_SEQ.NEXTVAL,
	'Автобиография'
);

INSERT INTO TAGS VALUES (
    TAGS_SEQ.NEXTVAL,
	'Черный юмор'
);

INSERT INTO TAGS VALUES (
    TAGS_SEQ.NEXTVAL,
	'Философская'
);

---------------------------------------------------------------------------------------------------------------------------------------------------
--Tag_stock--
INSERT INTO TAG_STOCK VALUES (
    TAG_STOCK_SEQ.NEXTVAL,
	1,
	1
);

INSERT INTO TAG_STOCK VALUES (
    TAG_STOCK_SEQ.NEXTVAL,
	1,
	1
);

INSERT INTO TAG_STOCK VALUES (
    TAG_STOCK_SEQ.NEXTVAL,
	3,
	2
);

INSERT INTO TAG_STOCK VALUES (
    TAG_STOCK_SEQ.NEXTVAL,
	4,
	3
);

INSERT INTO TAG_STOCK VALUES (
    TAG_STOCK_SEQ.NEXTVAL,
	5,
	3
);

INSERT INTO TAG_STOCK VALUES (
    TAG_STOCK_SEQ.NEXTVAL,
	6,
	4
);

INSERT INTO TAG_STOCK VALUES (
    TAG_STOCK_SEQ.NEXTVAL,
	3,
	4
);

INSERT INTO TAG_STOCK VALUES (
    TAG_STOCK_SEQ.NEXTVAL,
	7,
	5
);

INSERT INTO TAG_STOCK VALUES (
    TAG_STOCK_SEQ.NEXTVAL,
	9,
	5
);

INSERT INTO TAG_STOCK VALUES (
    TAG_STOCK_SEQ.NEXTVAL,
	8,
	6
);

INSERT INTO TAG_STOCK VALUES (
    TAG_STOCK_SEQ.NEXTVAL,
	1,
	7
);

INSERT INTO TAG_STOCK VALUES (
    TAG_STOCK_SEQ.NEXTVAL,
	9,
	8
);

---------------------------------------------------------------------------------------------------------------------------------------------------

--Books
--Один день Ивана Денисовича
INSERT INTO BOOKS VALUES (
	BOOKS_SEQ.NEXTVAL,
	1,
	5
);

INSERT INTO BOOKS VALUES (
	BOOKS_SEQ.NEXTVAL,
	1,
	5
);

--Евгений Онегин
INSERT INTO BOOKS VALUES (
	BOOKS_SEQ.NEXTVAL,
	2,
	5
);

INSERT INTO BOOKS VALUES (
	BOOKS_SEQ.NEXTVAL,
	2,
	5
);

INSERT INTO BOOKS VALUES (
	BOOKS_SEQ.NEXTVAL,
	2,
	5
);

INSERT INTO BOOKS VALUES (
	BOOKS_SEQ.NEXTVAL,
	2,
	5
);

INSERT INTO BOOKS VALUES (
	BOOKS_SEQ.NEXTVAL,
	2,
	5
);

INSERT INTO BOOKS VALUES (
	BOOKS_SEQ.NEXTVAL,
	2,
	5
);

--Скотный двор
INSERT INTO BOOKS VALUES (
	BOOKS_SEQ.NEXTVAL,
	3,
	5
);

INSERT INTO BOOKS VALUES (
	BOOKS_SEQ.NEXTVAL,
	3,
	5
);

INSERT INTO BOOKS VALUES (
	BOOKS_SEQ.NEXTVAL,
	3,
	5
);

INSERT INTO BOOKS VALUES (
	BOOKS_SEQ.NEXTVAL,
	3,
	5
);

INSERT INTO BOOKS VALUES (
	BOOKS_SEQ.NEXTVAL,
	3,
	5
);

INSERT INTO BOOKS VALUES (
	BOOKS_SEQ.NEXTVAL,
	3,
	5
);

INSERT INTO BOOKS VALUES (
	BOOKS_SEQ.NEXTVAL,
	3,
	5
);

INSERT INTO BOOKS VALUES (
	BOOKS_SEQ.NEXTVAL,
	3,
	5
);

--Война и мир
INSERT INTO BOOKS VALUES (
	BOOKS_SEQ.NEXTVAL,
	4,
	5
);

INSERT INTO BOOKS VALUES (
	BOOKS_SEQ.NEXTVAL,
	4,
	5
);

INSERT INTO BOOKS VALUES (
	BOOKS_SEQ.NEXTVAL,
	4,
	5
);

INSERT INTO BOOKS VALUES (
	BOOKS_SEQ.NEXTVAL,
	4,
	5
);

--Одноэтажная Америка
INSERT INTO BOOKS VALUES (
	BOOKS_SEQ.NEXTVAL,
	5,
	5
);

INSERT INTO BOOKS VALUES (
	BOOKS_SEQ.NEXTVAL,
	5,
	5
);

INSERT INTO BOOKS VALUES (
	BOOKS_SEQ.NEXTVAL,
	5,
	5
);

INSERT INTO BOOKS VALUES (
	BOOKS_SEQ.NEXTVAL,
	5,
	5
);

INSERT INTO BOOKS VALUES (
	BOOKS_SEQ.NEXTVAL,
	5,
	5
);

--Длинная серебряная ложка
INSERT INTO BOOKS VALUES (
	BOOKS_SEQ.NEXTVAL,
	6,
	5
);

INSERT INTO BOOKS VALUES (
	BOOKS_SEQ.NEXTVAL,
	6,
	5
);

INSERT INTO BOOKS VALUES (
	BOOKS_SEQ.NEXTVAL,
	6,
	5
);

INSERT INTO BOOKS VALUES (
	BOOKS_SEQ.NEXTVAL,
	6,
	5
);

INSERT INTO BOOKS VALUES (
	BOOKS_SEQ.NEXTVAL,
	6,
	5
);

--Архипелаг ГУЛАГ
INSERT INTO BOOKS VALUES (
	BOOKS_SEQ.NEXTVAL,
	7,
	5
);

INSERT INTO BOOKS VALUES (
	BOOKS_SEQ.NEXTVAL,
	7,
	5
);

INSERT INTO BOOKS VALUES (
	BOOKS_SEQ.NEXTVAL,
	7,
	5
);

INSERT INTO BOOKS VALUES (
	BOOKS_SEQ.NEXTVAL,
	7,
	5
);

INSERT INTO BOOKS VALUES (
	BOOKS_SEQ.NEXTVAL,
	7,
	5
);

--Собачье сердце
INSERT INTO BOOKS VALUES (
	BOOKS_SEQ.NEXTVAL,
	8,
	5
);

INSERT INTO BOOKS VALUES (
	BOOKS_SEQ.NEXTVAL,
	8,
	5
);

INSERT INTO BOOKS VALUES (
	BOOKS_SEQ.NEXTVAL,
	8,
	5
);

INSERT INTO BOOKS VALUES (
	BOOKS_SEQ.NEXTVAL,
	8,
	5
);

INSERT INTO BOOKS VALUES (
	BOOKS_SEQ.NEXTVAL,
	8,
	5
);

--Крокодил
INSERT INTO BOOKS VALUES (
	BOOKS_SEQ.NEXTVAL,
	9,
	3
);

INSERT INTO BOOKS VALUES (
	BOOKS_SEQ.NEXTVAL,
	9,
	2
);

--Коммерсантъ
INSERT INTO BOOKS VALUES (
	BOOKS_SEQ.NEXTVAL,
	10,
	3
);

INSERT INTO BOOKS VALUES (
	BOOKS_SEQ.NEXTVAL,
	10,
	4
);

---------------------------------------------------------------------------------------------------------------------------------------------------

--Readers--
INSERT INTO READERS (
    LIBRARY_CARD,
	NAME,
	SURNAME,
	BIRTHD_DATE,
	RATING,
	SEX,
	BLACK_LIST,
	MONEY
) VALUES (
    READERS_SEQ.NEXTVAL,
	'Кирилл',
	'Овчинников',
	TO_DATE('1973-6-27 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),
	503,
	0,
	1,
	1887
);

INSERT INTO READERS (
    LIBRARY_CARD,
	NAME,
	SURNAME,
	BIRTHD_DATE,
	RATING,
	SEX,
	BLACK_LIST,
	MONEY
) VALUES (
    READERS_SEQ.NEXTVAL,
	'Ульяна',
	'Соболева',
	TO_DATE('2003-3-9 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),
	382,
	2,
	0,
	348
);

INSERT INTO READERS (
    LIBRARY_CARD,
	NAME,
	SURNAME,
	BIRTHD_DATE,
	RATING,
	SEX,
	BLACK_LIST,
	MONEY
) VALUES (
    READERS_SEQ.NEXTVAL,
	'Марк',
	'Семенов',
	TO_DATE('1991-8-5 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),
	356,
	2,
	1,
	1003
);

INSERT INTO READERS (
    LIBRARY_CARD,
	NAME,
	SURNAME,
	BIRTHD_DATE,
	RATING,
	SEX,
	BLACK_LIST,
	MONEY
) VALUES (
    READERS_SEQ.NEXTVAL,
	'Варвара',
	'Гладкова',
	TO_DATE('1995-4-4 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),
	95,
	0,
	1,
	1091
);

INSERT INTO READERS (
    LIBRARY_CARD,
	NAME,
	SURNAME,
	BIRTHD_DATE,
	RATING,
	SEX,
	BLACK_LIST,
	MONEY
) VALUES (
    READERS_SEQ.NEXTVAL,
	'Дмитрий',
	'Климов',
	TO_DATE('2000-7-17 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),
	988,
	0,
	0,
	48
);

INSERT INTO READERS (
    LIBRARY_CARD,
	NAME,
	SURNAME,
	BIRTHD_DATE,
	RATING,
	SEX,
	BLACK_LIST,
	MONEY
) VALUES (
    READERS_SEQ.NEXTVAL,
	'Аделина',
	'Пономарева',
	TO_DATE('1996-8-17 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),
	987,
	2,
	1,
	161
);

INSERT INTO READERS (
    LIBRARY_CARD,
	NAME,
	SURNAME,
	BIRTHD_DATE,
	RATING,
	SEX,
	BLACK_LIST,
	MONEY
) VALUES (
    READERS_SEQ.NEXTVAL,
	'Игорь',
	'Цветков',
	TO_DATE('1985-2-7 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),
	182,
	9,
	0,
	1638
);

INSERT INTO READERS (
    LIBRARY_CARD,
	NAME,
	SURNAME,
	BIRTHD_DATE,
	RATING,
	SEX,
	BLACK_LIST,
	MONEY
) VALUES (
    READERS_SEQ.NEXTVAL,
	'Вероника',
	'Андреева',
	TO_DATE('1992-11-11 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),
	411,
	9,
	1,
	1664
);

INSERT INTO READERS (
    LIBRARY_CARD,
	NAME,
	SURNAME,
	BIRTHD_DATE,
	RATING,
	SEX,
	BLACK_LIST,
	MONEY
) VALUES (
    READERS_SEQ.NEXTVAL,
	'Тимур',
	'Семенов',
	TO_DATE('1950-8-9 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),
	746,
	2,
	1,
	1995
);

INSERT INTO READERS (
    LIBRARY_CARD,
	NAME,
	SURNAME,
	BIRTHD_DATE,
	RATING,
	SEX,
	BLACK_LIST,
	MONEY
) VALUES (
    READERS_SEQ.NEXTVAL,
	'Кристина',
	'Черныха',
	TO_DATE('1964-10-11 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),
	963,
	2,
	0,
	501
);

INSERT INTO READERS (
    LIBRARY_CARD,
	NAME,
	SURNAME,
	BIRTHD_DATE,
	RATING,
	SEX,
	BLACK_LIST,
	MONEY
) VALUES (
    READERS_SEQ.NEXTVAL,
	'Юрий',
	'Савельев',
	TO_DATE('2007-4-21 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),
	29,
	0,
	1,
	172
);

INSERT INTO READERS (
    LIBRARY_CARD,
	NAME,
	SURNAME,
	BIRTHD_DATE,
	RATING,
	SEX,
	BLACK_LIST,
	MONEY
) VALUES (
    READERS_SEQ.NEXTVAL,
	'Маргарита',
	'Матвеева',
	TO_DATE('1951-6-12 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),
	609,
	0,
	0,
	1822
);

INSERT INTO READERS (
    LIBRARY_CARD,
	NAME,
	SURNAME,
	BIRTHD_DATE,
	RATING,
	SEX,
	BLACK_LIST,
	MONEY
) VALUES (
    READERS_SEQ.NEXTVAL,
	'Юрий',
	'Артемов',
	TO_DATE('1955-4-19 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),
	498,
	1,
	1,
	1436
);

INSERT INTO READERS (
    LIBRARY_CARD,
	NAME,
	SURNAME,
	BIRTHD_DATE,
	RATING,
	SEX,
	BLACK_LIST,
	MONEY
) VALUES (
    READERS_SEQ.NEXTVAL,
	'Кристина',
	'Матвеева',
	TO_DATE('2005-9-22 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),
	51,
	2,
	0,
	1375
);

INSERT INTO READERS (
    LIBRARY_CARD,
	NAME,
	SURNAME,
	BIRTHD_DATE,
	RATING,
	SEX,
	BLACK_LIST,
	MONEY
) VALUES (
    READERS_SEQ.NEXTVAL,
	'Алексей',
	'Новиков',
	TO_DATE('1990-5-6 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),
	697,
	1,
	0,
	553
);

INSERT INTO READERS (
    LIBRARY_CARD,
	NAME,
	SURNAME,
	BIRTHD_DATE,
	RATING,
	SEX,
	BLACK_LIST,
	MONEY
) VALUES (
    READERS_SEQ.NEXTVAL,
	'Арина',
	'Белоусова',
	TO_DATE('1975-4-28 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),
	795,
	9,
	0,
	704
);

INSERT INTO READERS (
    LIBRARY_CARD,
	NAME,
	SURNAME,
	BIRTHD_DATE,
	RATING,
	SEX,
	BLACK_LIST,
	MONEY
) VALUES (
    READERS_SEQ.NEXTVAL,
	'Тимофей',
	'Осипов',
	TO_DATE('1990-10-14 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),
	660,
	9,
	0,
	703
);

INSERT INTO READERS (
    LIBRARY_CARD,
	NAME,
	SURNAME,
	BIRTHD_DATE,
	RATING,
	SEX,
	BLACK_LIST,
	MONEY
) VALUES (
    READERS_SEQ.NEXTVAL,
	'Мелания',
	'Цветкова',
	TO_DATE('1978-6-10 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),
	155,
	9,
	0,
	1959
);

INSERT INTO READERS (
    LIBRARY_CARD,
	NAME,
	SURNAME,
	BIRTHD_DATE,
	RATING,
	SEX,
	BLACK_LIST,
	MONEY
) VALUES (
    READERS_SEQ.NEXTVAL,
	'Давид',
	'Иванов',
	TO_DATE('1995-10-20 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),
	655,
	2,
	0,
	1926
);

INSERT INTO READERS (
    LIBRARY_CARD,
	NAME,
	SURNAME,
	BIRTHD_DATE,
	RATING,
	SEX,
	BLACK_LIST,
	MONEY
) VALUES (
    READERS_SEQ.NEXTVAL,
	'Светлана',
	'Фокина',
	TO_DATE('1953-8-21 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),
	497,
	9,
	1,
	884
);

INSERT INTO READERS (
    LIBRARY_CARD,
	NAME,
	SURNAME,
	BIRTHD_DATE,
	RATING,
	SEX,
	BLACK_LIST,
	MONEY
) VALUES (
    READERS_SEQ.NEXTVAL,
	'Руслан',
	'Осипов',
	TO_DATE('1974-2-11 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),
	674,
	2,
	0,
	1054
);

INSERT INTO READERS (
    LIBRARY_CARD,
	NAME,
	SURNAME,
	BIRTHD_DATE,
	RATING,
	SEX,
	BLACK_LIST,
	MONEY
) VALUES (
    READERS_SEQ.NEXTVAL,
	'Арина',
	'Яковлева',
	TO_DATE('1965-7-11 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),
	620,
	2,
	1,
	120
);

INSERT INTO READERS (
    LIBRARY_CARD,
	NAME,
	SURNAME,
	BIRTHD_DATE,
	RATING,
	SEX,
	BLACK_LIST,
	MONEY
) VALUES (
    READERS_SEQ.NEXTVAL,
	'Артём',
	'Лосев',
	TO_DATE('1977-7-26 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),
	235,
	9,
	0,
	718
);

INSERT INTO READERS (
    LIBRARY_CARD,
	NAME,
	SURNAME,
	BIRTHD_DATE,
	RATING,
	SEX,
	BLACK_LIST,
	MONEY
) VALUES (
    READERS_SEQ.NEXTVAL,
	'Мила',
	'Лебедева',
	TO_DATE('2001-3-16 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),
	404,
	1,
	0,
	152
);

INSERT INTO READERS (
    LIBRARY_CARD,
	NAME,
	SURNAME,
	BIRTHD_DATE,
	RATING,
	SEX,
	BLACK_LIST,
	MONEY
) VALUES (
    READERS_SEQ.NEXTVAL,
	'Ярослав',
	'Осипов',
	TO_DATE('1947-10-27 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),
	832,
	2,
	0,
	864
);

INSERT INTO READERS (
    LIBRARY_CARD,
	NAME,
	SURNAME,
	BIRTHD_DATE,
	RATING,
	SEX,
	BLACK_LIST,
	MONEY
) VALUES (
    READERS_SEQ.NEXTVAL,
	'Диана',
	'Андреева',
	TO_DATE('1956-1-21 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),
	208,
	0,
	1,
	1924
);

INSERT INTO READERS (
    LIBRARY_CARD,
	NAME,
	SURNAME,
	BIRTHD_DATE,
	RATING,
	SEX,
	BLACK_LIST,
	MONEY
) VALUES (
    READERS_SEQ.NEXTVAL,
	'Алексей',
	'Сухов',
	TO_DATE('1993-8-19 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),
	394,
	9,
	0,
	1668
);

INSERT INTO READERS (
    LIBRARY_CARD,
	NAME,
	SURNAME,
	BIRTHD_DATE,
	RATING,
	SEX,
	BLACK_LIST,
	MONEY
) VALUES (
    READERS_SEQ.NEXTVAL,
	'Ярослава',
	'Цветкова',
	TO_DATE('2007-1-25 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),
	532,
	2,
	0,
	1213
);

INSERT INTO READERS (
    LIBRARY_CARD,
	NAME,
	SURNAME,
	BIRTHD_DATE,
	RATING,
	SEX,
	BLACK_LIST,
	MONEY
) VALUES (
    READERS_SEQ.NEXTVAL,
	'Арсений',
	'Кудряшов',
	TO_DATE('1981-9-15 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),
	240,
	2,
	1,
	502
);

INSERT INTO READERS (
    LIBRARY_CARD,
	NAME,
	SURNAME,
	BIRTHD_DATE,
	RATING,
	SEX,
	BLACK_LIST,
	MONEY
) VALUES (
    READERS_SEQ.NEXTVAL,
	'Нина',
	'Цветкова',
	TO_DATE('1984-11-17 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),
	660,
	0,
	1,
	1584
);

INSERT INTO READERS (
    LIBRARY_CARD,
	NAME,
	SURNAME,
	BIRTHD_DATE,
	RATING,
	SEX,
	BLACK_LIST,
	MONEY
) VALUES (
    READERS_SEQ.NEXTVAL,
	'Платон',
	'Овчинников',
	TO_DATE('1949-6-9 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),
	634,
	2,
	0,
	1283
);

INSERT INTO READERS (
    LIBRARY_CARD,
	NAME,
	SURNAME,
	BIRTHD_DATE,
	RATING,
	SEX,
	BLACK_LIST,
	MONEY
) VALUES (
    READERS_SEQ.NEXTVAL,
	'Яна',
	'Агафонова',
	TO_DATE('2000-1-17 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),
	881,
	9,
	0,
	767
);

INSERT INTO READERS (
    LIBRARY_CARD,
	NAME,
	SURNAME,
	BIRTHD_DATE,
	RATING,
	SEX,
	BLACK_LIST,
	MONEY
) VALUES (
    READERS_SEQ.NEXTVAL,
	'Кирилл',
	'Егоров',
	TO_DATE('1988-9-25 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),
	305,
	0,
	0,
	231
);

INSERT INTO READERS (
    LIBRARY_CARD,
	NAME,
	SURNAME,
	BIRTHD_DATE,
	RATING,
	SEX,
	BLACK_LIST,
	MONEY
) VALUES (
    READERS_SEQ.NEXTVAL,
	'Елизавета',
	'Фокина',
	TO_DATE('2007-9-13 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),
	625,
	9,
	1,
	929
);

INSERT INTO READERS (
    LIBRARY_CARD,
	NAME,
	SURNAME,
	BIRTHD_DATE,
	RATING,
	SEX,
	BLACK_LIST,
	MONEY
) VALUES (
    READERS_SEQ.NEXTVAL,
	'Леонид',
	'Семенов',
	TO_DATE('1995-4-28 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),
	935,
	2,
	0,
	632
);

INSERT INTO READERS (
    LIBRARY_CARD,
	NAME,
	SURNAME,
	BIRTHD_DATE,
	RATING,
	SEX,
	BLACK_LIST,
	MONEY
) VALUES (
    READERS_SEQ.NEXTVAL,
	'Мирослава',
	'Масленникова',
	TO_DATE('1946-3-31 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),
	206,
	1,
	0,
	1289
);

INSERT INTO READERS (
    LIBRARY_CARD,
	NAME,
	SURNAME,
	BIRTHD_DATE,
	RATING,
	SEX,
	BLACK_LIST,
	MONEY
) VALUES (
    READERS_SEQ.NEXTVAL,
	'Адам',
	'Семенов',
	TO_DATE('1948-12-11 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),
	385,
	9,
	0,
	765
);

INSERT INTO READERS (
    LIBRARY_CARD,
	NAME,
	SURNAME,
	BIRTHD_DATE,
	RATING,
	SEX,
	BLACK_LIST,
	MONEY
) VALUES (
    READERS_SEQ.NEXTVAL,
	'Ангелина',
	'Белоусова',
	TO_DATE('1992-10-8 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),
	648,
	1,
	0,
	559
);

INSERT INTO READERS (
    LIBRARY_CARD,
	NAME,
	SURNAME,
	BIRTHD_DATE,
	RATING,
	SEX,
	BLACK_LIST,
	MONEY
) VALUES (
    READERS_SEQ.NEXTVAL,
	'Антон',
	'Рожков',
	TO_DATE('1957-3-1 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),
	117,
	0,
	0,
	1266
);

INSERT INTO READERS (
    LIBRARY_CARD,
	NAME,
	SURNAME,
	BIRTHD_DATE,
	RATING,
	SEX,
	BLACK_LIST,
	MONEY
) VALUES (
    READERS_SEQ.NEXTVAL,
	'Анна',
	'Агафонова',
	TO_DATE('1968-6-7 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),
	174,
	2,
	0,
	1620
);
---------------------------------------------------------------------------------------------------------------------------------------------------

--Journal--
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
    TO_DATE('01.09.22', 'DD.MM.RR'),
    NULL,
    '13',
    '3',
    NULL,
    NULL,
    3
);

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
    TO_DATE('01.09.22', 'DD.MM.RR'),
    TO_DATE('07.09.22', 'DD.MM.RR'),
    '22',
    '15',
    NULL,
    NULL,
    4
);

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
    TO_DATE('02.06.22', 'DD.MM.RR'),
    NULL,
    '21',
    '12',
    NULL,
    NULL,
    4
);

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
    TO_DATE('12.08.22', 'DD.MM.RR'),
    NULL,
    '3',
    '16',
    NULL,
    NULL,
    4
);

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
    TO_DATE('10.08.22', 'DD.MM.RR'),
    TO_DATE('02.09.22', 'DD.MM.RR'),
    '4',
    '21',
    NULL,
    NULL,
    3
);

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
    TO_DATE('02.09.22', 'DD.MM.RR'),
    NULL,
    '5',
    '31',
    NULL,
    NULL,
    4
);

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
    TO_DATE('10.07.22', 'DD.MM.RR'),
    TO_DATE('01.09.22', 'DD.MM.RR'),
    '9',
    '31',
    NULL,
    NULL,
    3
);

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
    TO_DATE('10.07.22', 'DD.MM.RR'),
    TO_DATE('02.08.22', 'DD.MM.RR'),
    '19',
    '17',
    NULL,
    NULL,
    3
);

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
    TO_DATE('10.07.22', 'DD.MM.RR'),
    TO_DATE('09.09.22', 'DD.MM.RR'),
    '34',
    '14',
    NULL,
    NULL,
    4
);

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
    TO_DATE('01.05.22', 'DD.MM.RR'),
    NULL,
    '23',
    '13',
    NULL,
    NULL,
    3
);

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
    TO_DATE('01.09.22', 'DD.MM.RR'),
    TO_DATE('07.09.22', 'DD.MM.RR'),
    '12',
    '34',
    NULL,
    NULL,
    3
);

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
    TO_DATE('01.08.22', 'DD.MM.RR'),
    TO_DATE('14.09.22', 'DD.MM.RR'),
    '26',
    '13',
    NULL,
    NULL,
    3
);

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
    TO_DATE('12.08.22', 'DD.MM.RR'),
    TO_DATE('07.09.22', 'DD.MM.RR'),
    '22',
    '44',
    NULL,
    NULL,
    4
);

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
    TO_DATE('10.08.22', 'DD.MM.RR'),
    TO_DATE('02.09.22', 'DD.MM.RR'),
    '11',
    '21',
    NULL,
    NULL,
    4
);

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
    TO_DATE('02.06.22', 'DD.MM.RR'),
    NULL,
    '2',
    '32',
    NULL,
    NULL,
    3
);

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
    TO_DATE('10.07.22', 'DD.MM.RR'),
    TO_DATE('01.09.22', 'DD.MM.RR'),
    '13',
    '31',
    NULL,
    NULL,
    3
);

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
    TO_DATE('10.07.22', 'DD.MM.RR'),
    TO_DATE('01.09.22', 'DD.MM.RR'),
    '31',
    '17',
    NULL,
    NULL,
    3
);

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
    TO_DATE('10.07.22', 'DD.MM.RR'),
    TO_DATE('01.09.22', 'DD.MM.RR'),
    '5',
    '23',
    NULL,
    NULL,
    4
);

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
    TO_DATE('10.07.22', 'DD.MM.RR'),
    TO_DATE('01.09.22', 'DD.MM.RR'),
    '6',
    '24',
    NULL,
    NULL,
    4
);

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
    TO_DATE('10.06.22', 'DD.MM.RR'),
    TO_DATE('01.07.22', 'DD.MM.RR'),
    '7',
    '2',
    NULL,
    NULL,
    4
);

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
    TO_DATE('10.06.22', 'DD.MM.RR'),
    TO_DATE('01.07.22', 'DD.MM.RR'),
    '11',
    '43',
    NULL,
    NULL,
    3
);

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
    TO_DATE('10.06.22', 'DD.MM.RR'),
    NULL,
    '14',
    '1',
    NULL,
    NULL,
    4
);

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
    TO_DATE('10.06.22', 'DD.MM.RR'),
    NULL,
    '13',
    '35',
    NULL,
    NULL,
    3
);

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
    TO_DATE('01.08.22', 'DD.MM.RR'),
    NULL,
    '12',
    '36',
    NULL,
    NULL,
    4
);


