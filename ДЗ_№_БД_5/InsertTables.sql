--Age_limits
INSERT INTO
	age_limits (age)
VALUES
	(0);

INSERT INTO
	age_limits (age)
VALUES
	(6);

INSERT INTO
	age_limits (age)
VALUES
	(12);

INSERT INTO
	age_limits (age)
VALUES
	(16);

INSERT INTO
	age_limits (age)
VALUES
	(18);

------------------------------------------------------------------------------------------------
--Positions
INSERT INTO
	Positions(Job_title)
VALUES
	('Директор');

INSERT INTO
	Positions(Job_title)
VALUES
	('Кладовщик');

INSERT INTO
	Positions(Job_title)
VALUES
	('Библиотекарь');

------------------------------------------------------------------------------------------------
--Employees
INSERT INTO
	Employees (name, surname, position_id)
VALUES
	('Клавдия', 'Борде', 1);

INSERT INTO
	Employees (name, surname, position_id)
VALUES
	('Герасим', 'Венгржановский', 2);

INSERT INTO
	Employees (name, surname, position_id)
VALUES
	('София', 'Рубинштейн', 3);

INSERT INTO
	Employees (name, surname, position_id)
VALUES
	('Агафья', 'Додефранц', 3);

INSERT INTO
	Employees (name, surname, position_id)
VALUES
	('Мария', 'Гаврилова', 3);

------------------------------------------------------------------------------------------------
--Types
INSERT INTO
	Types(Publication_type)
VALUES
	('Книга');

INSERT INTO
	Types(Publication_type)
VALUES
	('Газета');

INSERT INTO
	Types(Publication_type)
VALUES
	('Журнал');

------------------------------------------------------------------------------------------------
--Publishers 
INSERT INTO
	Publishers (Publisher_name)
VALUES
	('Просвещение');

INSERT INTO
	Publishers (Publisher_name)
VALUES
	('Азбука-Аттикус');

INSERT INTO
	Publishers (Publisher_name)
VALUES
	('РИПОЛ');

INSERT INTO
	Publishers (Publisher_name)
VALUES
	('Издательство');

INSERT INTO
	Publishers (Publisher_name)
VALUES
	('Лань');

INSERT INTO
	Publishers (Publisher_name)
VALUES
	('Экзамен');

INSERT INTO
	Publishers (Publisher_name)
VALUES
	('Дрофа');

INSERT INTO
	Publishers (Publisher_name)
VALUES
	('СИМБАТ');

INSERT INTO
	Publishers (Publisher_name)
VALUES
	('Росмэн');

INSERT INTO
	Publishers (Publisher_name)
VALUES
	('Манн Иванов и Фербер');

INSERT INTO
	Publishers (Publisher_name)
VALUES
	('ИНФРА-М');

INSERT INTO
	Publishers (Publisher_name)
VALUES
	('Бином. Лаборатория знаний');

INSERT INTO
	Publishers (Publisher_name)
VALUES
	('Вентана-Граф');

INSERT INTO
	Publishers (Publisher_name)
VALUES
	('Вече');

INSERT INTO
	Publishers (Publisher_name)
VALUES
	('Клевер-Медиа-Групп');

INSERT INTO
	Publishers (Publisher_name)
VALUES
	('Издательские решения');

INSERT INTO
	Publishers (Publisher_name)
VALUES
	('Перо');

INSERT INTO
	Publishers (Publisher_name)
VALUES
	('Издательский дом Лев');

INSERT INTO
	Publishers (Publisher_name)
VALUES
	('Феникс');

INSERT INTO
	Publishers (Publisher_name)
VALUES
	('Центрполиграф');

INSERT INTO
	Publishers (Publisher_name)
VALUES
	('Проспект');

INSERT INTO
	Publishers (Publisher_name)
VALUES
	('Стрекоза-Пресс');

INSERT INTO
	Publishers (Publisher_name)
VALUES
	('Флинта');

INSERT INTO
	Publishers (Publisher_name)
VALUES
	('Фламинго');

INSERT INTO
	Publishers (Publisher_name)
VALUES
	('ГЭОТАР-Медиа');

INSERT INTO
	Publishers (Publisher_name)
VALUES
	('Русское слово-учебник');

-------------------------------------------------------------------------------------------------------------------------------------------------
--Publication_types
INSERT INTO
	TYPES (publication_type)
VALUES
	('Книга');

INSERT INTO
	TYPES (publication_type)
VALUES
	('Газета');

INSERT INTO
	TYPES (publication_type)
VALUES
	('Журнал');

---------------------------------------------------------------------------------------------------------------------------------------------------
--Stock
INSERT INTO
	Stock(
		Book_name,
		Amount,
		Publication_year,
		Cost,
		Type_ID,
		Age_limit_ID,
		Publisher_ID,
		Description
	)
VALUES
	(
		'Один день Ивана Денисовича',
		2,
		2007,
		100,
		1,
		3,
		1,
		'«Я в 50-м году, в какой-то долгий лагерный зимний день таскал носилки с напарником и подумал: как описать всю нашу лагерную жизнь? По сути достаточно описать один всего день в подробностях… и день самого простого работяги, и тут отразится вся наша жизнь.'
	);

INSERT INTO
	Stock(
		Book_name,
		Amount,
		Publication_year,
		Cost,
		Type_ID,
		Age_limit_ID,
		Publisher_ID,
		Description
	)
VALUES
	(
		'Евгений Онегин',
		6,
		2018,
		128,
		1,
		4,
		5,
		'Роман А. С. Пушкина "Евгений Онегин" приводится в иллюстрациях известного живописца XX века Лидии Тимошенко. Главное пушкинское произведение стало единственной книгой, к которой Тимошенко обратилась как иллюстратор.'
	);

INSERT INTO
	Stock(
		Book_name,
		Amount,
		Publication_year,
		Cost,
		Type_ID,
		Age_limit_ID,
		Publisher_ID,
		Description
	)
VALUES
	(
		'Скотный двор',
		8,
		2014,
		250,
		1,
		4,
		12,
		'В повести изображена эволюция общества животных, изгнавших со скотного двора (первоначально называвшегося ферма «Усадьба» или в других переводах — «Господский двор», «Райский уголок») его предыдущего владельца, жестокого мистера Джонса, от безграничной свободы к диктатуре свиньи по кличке Наполеон.'
	);

INSERT INTO
	Stock(
		Book_name,
		Amount,
		Publication_year,
		Cost,
		Type_ID,
		Age_limit_ID,
		Publisher_ID,
		Description
	)
VALUES
	(
		'Война и мир',
		4,
		1999,
		300,
		1,
		3,
		18,
		'Война и мир» относится к литературному направлению реализм: в книге подробно описан ряд ключевых исторических событий, изображены типичные для российского общества персонажи, основной конфликт – «герой и общество».'
	);

INSERT INTO
	Stock(
		Book_name,
		Amount,
		Publication_year,
		Cost,
		Type_ID,
		Age_limit_ID,
		Publisher_ID,
		Description
	)
VALUES
	(
		'Одноэтажная Америка',
		5,
		2003,
		350,
		1,
		4,
		11,
		'Книга о путешествии двух советских журналистов по Америке в середине 30х годов прошлого века. Книга написана в лучших традициях Ильфа и Петрова и рассказывает о быте простых американцев пост депрессионного периода.'
	);

INSERT INTO
	Stock(
		Book_name,
		Amount,
		Publication_year,
		Cost,
		Type_ID,
		Age_limit_ID,
		Publisher_ID,
		Description
	)
VALUES
	(
		'Длинная серебряная ложка',
		5,
		2009,
		190,
		1,
		3,
		3,
		'Когда молодой англичанин Уолтер Стивенс приезжает в Трансильванию 1880х годов на поиски вампиров, он попадает в мир, где соседствуют сказка и реальность, а вампиры охотятся не только на людей, но и друг на друга. Уолтеру и его друзьям предстоит бороться как с внешними врагами, так и с внутренними демонами, пока они наконец не придут к выводу - даже если ты превратился в вампира, всегда можно остаться Человеком.'
	);

INSERT INTO
	Stock(
		Book_name,
		Amount,
		Publication_year,
		Cost,
		Type_ID,
		Age_limit_ID,
		Publisher_ID,
		Description
	)
VALUES
	(
		'Архипелаг ГУЛАГ',
		5,
		2000,
		150,
		1,
		4,
		9,
		'«…Книга – о крови, о поте, о слезах, о страданиях, о безнадежности, а ее закрываешь с ощущением силы и света. Она показывает: человек во всех обстоятельствах может остаться человеком. Дает ощущение, что наш народ не кончился, мы прошли нижнюю точку, мы прошли катарсис. Исправлять жизнь будет трудно, но возможно».'
	);

INSERT INTO
	Stock(
		Book_name,
		Amount,
		Publication_year,
		Cost,
		Type_ID,
		Age_limit_ID,
		Publisher_ID,
		Description
	)
VALUES
	(
		'Собачье сердце',
		5,
		2001,
		130,
		1,
		3,
		19,
		'Профессор Преображенский и доктор Борменталь, совсем как Шерлок Холмс и Ватсон, пускаются в настоящее приключение. Подобно Фаусту Гёте, они создают своего "гомункулуса", не представляя, чем обернется научный и человеческий эксперимент... '
	);

INSERT INTO
	Stock(
		Book_name,
		Amount,
		Publication_year,
		Cost,
		Type_ID,
		Age_limit_ID
	)
VALUES
	('Крокодил(выпуск 27)', 2, 1952, 1, 3, 3);

INSERT INTO
	Stock(
		Book_name,
		Amount,
		Publication_year,
		Cost,
		Type_ID,
		Age_limit_ID
	)
VALUES
	('Коммерсантъ(выпуск 181)', 3, 1997, 10, 2, 3);

---------------------------------------------------------------------------------------------------------------------------------------------------
--Books
--Один день Ивана Денисовича
INSERT INTO
	Books (Stock_ID, Condition)
VALUES
	(1, 5);

INSERT INTO
	Books (Stock_ID, Condition)
VALUES
	(1, 5);

--Евгений Онегин
INSERT INTO
	Books (Stock_ID, Condition)
VALUES
	(2, 5);

INSERT INTO
	Books (Stock_ID, Condition)
VALUES
	(2, 5);

INSERT INTO
	Books (Stock_ID, Condition)
VALUES
	(2, 5);

INSERT INTO
	Books (Stock_ID, Condition)
VALUES
	(2, 5);

INSERT INTO
	Books (Stock_ID, Condition)
VALUES
	(2, 5);

INSERT INTO
	Books (Stock_ID, Condition)
VALUES
	(2, 5);

--Скотный двор 
INSERT INTO
	Books (Stock_ID, Condition)
VALUES
	(3, 5);

INSERT INTO
	Books (Stock_ID, Condition)
VALUES
	(3, 5);

INSERT INTO
	Books (Stock_ID, Condition)
VALUES
	(3, 5);

INSERT INTO
	Books (Stock_ID, Condition)
VALUES
	(3, 5);

INSERT INTO
	Books (Stock_ID, Condition)
VALUES
	(3, 5);

INSERT INTO
	Books (Stock_ID, Condition)
VALUES
	(3, 5);

INSERT INTO
	Books (Stock_ID, Condition)
VALUES
	(3, 5);

INSERT INTO
	Books (Stock_ID, Condition)
VALUES
	(3, 5);

--Война и мир
INSERT INTO
	Books (Stock_ID, Condition)
VALUES
	(4, 5);

INSERT INTO
	Books (Stock_ID, Condition)
VALUES
	(4, 5);

INSERT INTO
	Books (Stock_ID, Condition)
VALUES
	(4, 5);

INSERT INTO
	Books (Stock_ID, Condition)
VALUES
	(4, 5);

--Одноэтажная Америка
INSERT INTO
	Books (Stock_ID, Condition)
VALUES
	(5, 5);

INSERT INTO
	Books (Stock_ID, Condition)
VALUES
	(5, 5);

INSERT INTO
	Books (Stock_ID, Condition)
VALUES
	(5, 5);

INSERT INTO
	Books (Stock_ID, Condition)
VALUES
	(5, 5);

INSERT INTO
	Books (Stock_ID, Condition)
VALUES
	(5, 5);

--Длинная серебряная ложка
INSERT INTO
	Books (Stock_ID, Condition)
VALUES
	(6, 5);

INSERT INTO
	Books (Stock_ID, Condition)
VALUES
	(6, 5);

INSERT INTO
	Books (Stock_ID, Condition)
VALUES
	(6, 5);

INSERT INTO
	Books (Stock_ID, Condition)
VALUES
	(6, 5);

INSERT INTO
	Books (Stock_ID, Condition)
VALUES
	(6, 5);

--Архипелаг ГУЛАГ
INSERT INTO
	Books (Stock_ID, Condition)
VALUES
	(7, 5);

INSERT INTO
	Books (Stock_ID, Condition)
VALUES
	(7, 5);

INSERT INTO
	Books (Stock_ID, Condition)
VALUES
	(7, 5);

INSERT INTO
	Books (Stock_ID, Condition)
VALUES
	(7, 5);

INSERT INTO
	Books (Stock_ID, Condition)
VALUES
	(7, 5);

--Собачье сердце
INSERT INTO
	Books (Stock_ID, Condition)
VALUES
	(8, 5);

INSERT INTO
	Books (Stock_ID, Condition)
VALUES
	(8, 5);

INSERT INTO
	Books (Stock_ID, Condition)
VALUES
	(8, 5);

INSERT INTO
	Books (Stock_ID, Condition)
VALUES
	(8, 5);

INSERT INTO
	Books (Stock_ID, Condition)
VALUES
	(8, 5);

--Крокодил
INSERT INTO
	Books (Stock_ID, Condition)
VALUES
	(9, 3);

INSERT INTO
	Books (Stock_ID, Condition)
VALUES
	(9, 2);

--Коммерсантъ
INSERT INTO
	Books (Stock_ID, Condition)
VALUES
	(10, 3);

INSERT INTO
	Books (Stock_ID, Condition)
VALUES
	(10, 4);

---------------------------------------------------------------------------------------------------------------------------------------------------
--Authors
INSERT INTO
	Authors (name, surname)
VALUES
	('Илья', 'Ильф');

INSERT INTO
	Authors (name, surname)
VALUES
	('Евгений', 'Петров');

INSERT INTO
	Authors (name, surname)
VALUES
	('Кэтрин', 'Коути');

INSERT INTO
	Authors (name, surname)
VALUES
	('Кэрри', 'Гринберг');

INSERT INTO
	Authors (name, surname)
VALUES
	('Александр', 'Солженицын');

INSERT INTO
	Authors (name, surname)
VALUES
	('Михаил', 'Булгаков');

INSERT INTO
	Authors (name, surname)
VALUES
	('Александр', 'Пушкин');

INSERT INTO
	Authors (name, surname)
VALUES
	('Джордж', 'Оруэлл');

INSERT INTO
	Authors (name, surname)
VALUES
	('Лев', 'Толстой');

------------------------------------------------------------------------------------------------
--Author_stock--
--Один день Ивана Денисовича
INSERT INTO
	Author_stock (author_id, stock_ID)
VALUES
	(5, 1);

--Евгений Онегин
INSERT INTO
	Author_stock (author_id, stock_ID)
VALUES
	(7, 2);

--Скотный двор 
INSERT INTO
	Author_stock (author_id, stock_ID)
VALUES
	(8, 3);

--Война и мир
INSERT INTO
	Author_stock (author_id, stock_ID)
VALUES
	(9, 4);

--Одноэтажная Америка
INSERT INTO
	Author_stock (author_id, stock_ID)
VALUES
	(1, 5);

INSERT INTO
	Author_stock (author_id, stock_ID)
VALUES
	(2, 5);

--Длинная серебряная ложка
INSERT INTO
	Author_stock (author_id, stock_ID)
VALUES
	(3, 6);

INSERT INTO
	Author_stock (author_id, stock_ID)
VALUES
	(4, 6);

--Архипелаг ГУЛАГ
INSERT INTO
	Author_stock (author_id, stock_ID)
VALUES
	(5, 7);

--Собачье сердце
INSERT INTO
	Author_stock (author_id, stock_ID)
VALUES
	(6, 8);

---------------------------------------------------------------------------------------------------------------------------------------------------
--Genres
INSERT INTO
	Genres (gener_name)
VALUES
	('Драма');

INSERT INTO
	Genres (gener_name)
VALUES
	('Роман');

INSERT INTO
	Genres (gener_name)
VALUES
	('Фантастика');

INSERT INTO
	Genres (gener_name)
VALUES
	('Поэзия');

INSERT INTO
	Genres (gener_name)
VALUES
	('Сатира');

INSERT INTO
	Genres (gener_name)
VALUES
	('Приключения');

INSERT INTO
	Genres (gener_name)
VALUES
	('Проза');

INSERT INTO
	Genres (gener_name)
VALUES
	('Детектив');

INSERT INTO
	Genres (gener_name)
VALUES
	('Фэнтези');

INSERT INTO
	Genres (gener_name)
VALUES
	('Детективы');

INSERT INTO
	Genres (gener_name)
VALUES
	('Эротика');

INSERT INTO
	Genres (gener_name)
VALUES
	('Триллеры');

INSERT INTO
	Genres (gener_name)
VALUES
	('Публицистика');

------------------------------------------------------------------------------------------------
--Genres_stock--
--Один день Ивана Денисовича
INSERT INTO
	Genre_stock (Genre_id, stock_ID)
VALUES
	(2, 1);

--Евгений Онегин
INSERT INTO
	Genre_stock (Genre_id, stock_ID)
VALUES
	(4, 2);

--Скотный двор 
INSERT INTO
	Genre_stock (Genre_id, stock_ID)
VALUES
	(5, 3);

--Война и мир
INSERT INTO
	Genre_stock (Genre_id, stock_ID)
VALUES
	(2, 4);

INSERT INTO
	Genre_stock (Genre_id, stock_ID)
VALUES
	(7, 4);

--Одноэтажная Америка
INSERT INTO
	Genre_stock (Genre_id, stock_ID)
VALUES
	(13, 5);

--Длинная серебряная ложка
INSERT INTO
	Genre_stock (Genre_id, stock_ID)
VALUES
	(6, 6);

--Архипелаг ГУЛАГ
INSERT INTO
	Genre_stock (Genre_id, stock_ID)
VALUES
	(2, 7);

--Собачье сердце
INSERT INTO
	Genre_stock (Genre_id, stock_ID)
VALUES
	(3, 8);

---------------------------------------------------------------------------------------------------------------------------------------------------
--Tags--
INSERT INTO
	Tags (Tag_name)
VALUES
	('ГУЛАГ');

INSERT INTO
	Tags (Tag_name)
VALUES
	('Лауреаты Нобелевской премии');

INSERT INTO
	Tags (Tag_name)
VALUES
	('Русская классика');

INSERT INTO
	Tags (Tag_name)
VALUES
	('Политическая сатира');

INSERT INTO
	Tags (Tag_name)
VALUES
	('Зарубежная классика');

INSERT INTO
	Tags (Tag_name)
VALUES
	('Любовные');

INSERT INTO
	Tags (Tag_name)
VALUES
	('Автобиография');

INSERT INTO
	Tags (Tag_name)
VALUES
	('Черный юмор');

INSERT INTO
	Tags (Tag_name)
VALUES
	('Философская');

---------------------------------------------------------------------------------------------------------------------------------------------------
--Tag_stock--
INSERT INTO
	Tag_stock (Tag_id, stock_ID)
VALUES
	(1, 1);

INSERT INTO
	Tag_stock (Tag_id, stock_ID)
VALUES
	(1, 1);

INSERT INTO
	Tag_stock (Tag_id, stock_ID)
VALUES
	(3, 2);

INSERT INTO
	Tag_stock (Tag_id, stock_ID)
VALUES
	(4, 3);

INSERT INTO
	Tag_stock (Tag_id, stock_ID)
VALUES
	(5, 3);

INSERT INTO
	Tag_stock (Tag_id, stock_ID)
VALUES
	(6, 4);

INSERT INTO
	Tag_stock (Tag_id, stock_ID)
VALUES
	(3, 4);

INSERT INTO
	Tag_stock (Tag_id, stock_ID)
VALUES
	(7, 5);

INSERT INTO
	Tag_stock (Tag_id, stock_ID)
VALUES
	(9, 5);

INSERT INTO
	Tag_stock (Tag_id, stock_ID)
VALUES
	(8, 6);

INSERT INTO
	Tag_stock (Tag_id, stock_ID)
VALUES
	(1, 7);

INSERT INTO
	Tag_stock (Tag_id, stock_ID)
VALUES
	(9, 8);

---------------------------------------------------------------------------------------------------------------------------------------------------
--Journal--
Insert into
	JOURNAL (
		RECIVE_DATE,
		RETURN_DATE,
		LIBRARY_CARD_ID,
		BOOK_ID,
		BOOK_RATING,
		WHERE_READS,
		EMPLOYEES_ID
	)
values
	(
		to_date('01.09.22', 'DD.MM.RR'),
		null,
		'13',
		'3',
		null,
		null,
		3
	);

Insert into
	JOURNAL (
		RECIVE_DATE,
		RETURN_DATE,
		LIBRARY_CARD_ID,
		BOOK_ID,
		BOOK_RATING,
		WHERE_READS,
		EMPLOYEES_ID
	)
values
	(
		to_date('01.09.22', 'DD.MM.RR'),
		to_date('07.09.22', 'DD.MM.RR'),
		'22',
		'15',
		null,
		null,
		4
	);

Insert into
	JOURNAL (
		RECIVE_DATE,
		RETURN_DATE,
		LIBRARY_CARD_ID,
		BOOK_ID,
		BOOK_RATING,
		WHERE_READS,
		EMPLOYEES_ID
	)
values
	(
		to_date('02.06.22', 'DD.MM.RR'),
		null,
		'21',
		'12',
		null,
		null,
		4
	);

Insert into
	JOURNAL (
		RECIVE_DATE,
		RETURN_DATE,
		LIBRARY_CARD_ID,
		BOOK_ID,
		BOOK_RATING,
		WHERE_READS,
		EMPLOYEES_ID
	)
values
	(
		to_date('12.08.22', 'DD.MM.RR'),
		null,
		'3',
		'16',
		null,
		null,
		4
	);

Insert into
	JOURNAL (
		RECIVE_DATE,
		RETURN_DATE,
		LIBRARY_CARD_ID,
		BOOK_ID,
		BOOK_RATING,
		WHERE_READS,
		EMPLOYEES_ID
	)
values
	(
		to_date('10.08.22', 'DD.MM.RR'),
		to_date('02.09.22', 'DD.MM.RR'),
		'4',
		'21',
		null,
		null,
		3
	);

Insert into
	JOURNAL (
		RECIVE_DATE,
		RETURN_DATE,
		LIBRARY_CARD_ID,
		BOOK_ID,
		BOOK_RATING,
		WHERE_READS,
		EMPLOYEES_ID
	)
values
	(
		to_date('02.09.22', 'DD.MM.RR'),
		null,
		'5',
		'31',
		null,
		null,
		4
	);

Insert into
	JOURNAL (
		RECIVE_DATE,
		RETURN_DATE,
		LIBRARY_CARD_ID,
		BOOK_ID,
		BOOK_RATING,
		WHERE_READS,
		EMPLOYEES_ID
	)
values
	(
		to_date('10.07.22', 'DD.MM.RR'),
		to_date('01.09.22', 'DD.MM.RR'),
		'9',
		'31',
		null,
		null,
		3
	);

Insert into
	JOURNAL (
		RECIVE_DATE,
		RETURN_DATE,
		LIBRARY_CARD_ID,
		BOOK_ID,
		BOOK_RATING,
		WHERE_READS,
		EMPLOYEES_ID
	)
values
	(
		to_date('10.07.22', 'DD.MM.RR'),
		to_date('02.08.22', 'DD.MM.RR'),
		'19',
		'17',
		null,
		null,
		3
	);

Insert into
	JOURNAL (
		RECIVE_DATE,
		RETURN_DATE,
		LIBRARY_CARD_ID,
		BOOK_ID,
		BOOK_RATING,
		WHERE_READS,
		EMPLOYEES_ID
	)
values
	(
		to_date('10.07.22', 'DD.MM.RR'),
		to_date('09.09.22', 'DD.MM.RR'),
		'34',
		'14',
		null,
		null,
		4
	);

Insert into
	JOURNAL (
		RECIVE_DATE,
		RETURN_DATE,
		LIBRARY_CARD_ID,
		BOOK_ID,
		BOOK_RATING,
		WHERE_READS,
		EMPLOYEES_ID
	)
values
	(
		to_date('01.05.22', 'DD.MM.RR'),
		null,
		'23',
		'13',
		null,
		null,
		3
	);

Insert into
	JOURNAL (
		RECIVE_DATE,
		RETURN_DATE,
		LIBRARY_CARD_ID,
		BOOK_ID,
		BOOK_RATING,
		WHERE_READS,
		EMPLOYEES_ID
	)
values
	(
		to_date('01.09.22', 'DD.MM.RR'),
		to_date('07.09.22', 'DD.MM.RR'),
		'12',
		'34',
		null,
		null,
		3
	);

Insert into
	JOURNAL (
		RECIVE_DATE,
		RETURN_DATE,
		LIBRARY_CARD_ID,
		BOOK_ID,
		BOOK_RATING,
		WHERE_READS,
		EMPLOYEES_ID
	)
values
	(
		to_date('01.08.22', 'DD.MM.RR'),
		to_date('14.09.22', 'DD.MM.RR'),
		'26',
		'13',
		null,
		null,
		3
	);

Insert into
	JOURNAL (
		RECIVE_DATE,
		RETURN_DATE,
		LIBRARY_CARD_ID,
		BOOK_ID,
		BOOK_RATING,
		WHERE_READS,
		EMPLOYEES_ID
	)
values
	(
		to_date('12.08.22', 'DD.MM.RR'),
		to_date('07.09.22', 'DD.MM.RR'),
		'22',
		'44',
		null,
		null,
		4
	);

Insert into
	JOURNAL (
		RECIVE_DATE,
		RETURN_DATE,
		LIBRARY_CARD_ID,
		BOOK_ID,
		BOOK_RATING,
		WHERE_READS,
		EMPLOYEES_ID
	)
values
	(
		to_date('10.08.22', 'DD.MM.RR'),
		to_date('02.09.22', 'DD.MM.RR'),
		'11',
		'21',
		null,
		null,
		4
	);

Insert into
	JOURNAL (
		RECIVE_DATE,
		RETURN_DATE,
		LIBRARY_CARD_ID,
		BOOK_ID,
		BOOK_RATING,
		WHERE_READS,
		EMPLOYEES_ID
	)
values
	(
		to_date('02.06.22', 'DD.MM.RR'),
		null,
		'2',
		'32',
		null,
		null,
		3
	);

Insert into
	JOURNAL (
		RECIVE_DATE,
		RETURN_DATE,
		LIBRARY_CARD_ID,
		BOOK_ID,
		BOOK_RATING,
		WHERE_READS,
		EMPLOYEES_ID
	)
values
	(
		to_date('10.07.22', 'DD.MM.RR'),
		to_date('01.09.22', 'DD.MM.RR'),
		'13',
		'31',
		null,
		null,
		3
	);

Insert into
	JOURNAL (
		RECIVE_DATE,
		RETURN_DATE,
		LIBRARY_CARD_ID,
		BOOK_ID,
		BOOK_RATING,
		WHERE_READS,
		EMPLOYEES_ID
	)
values
	(
		to_date('10.07.22', 'DD.MM.RR'),
		to_date('01.09.22', 'DD.MM.RR'),
		'31',
		'17',
		null,
		null,
		3
	);

Insert into
	JOURNAL (
		RECIVE_DATE,
		RETURN_DATE,
		LIBRARY_CARD_ID,
		BOOK_ID,
		BOOK_RATING,
		WHERE_READS,
		EMPLOYEES_ID
	)
values
	(
		to_date('10.07.22', 'DD.MM.RR'),
		to_date('01.09.22', 'DD.MM.RR'),
		'5',
		'23',
		null,
		null,
		4
	);

Insert into
	JOURNAL (
		RECIVE_DATE,
		RETURN_DATE,
		LIBRARY_CARD_ID,
		BOOK_ID,
		BOOK_RATING,
		WHERE_READS,
		EMPLOYEES_ID
	)
values
	(
		to_date('10.07.22', 'DD.MM.RR'),
		to_date('01.09.22', 'DD.MM.RR'),
		'6',
		'24',
		null,
		null,
		4
	);

Insert into
	JOURNAL (
		RECIVE_DATE,
		RETURN_DATE,
		LIBRARY_CARD_ID,
		BOOK_ID,
		BOOK_RATING,
		WHERE_READS,
		EMPLOYEES_ID
	)
values
	(
		to_date('10.06.22', 'DD.MM.RR'),
		to_date('01.07.22', 'DD.MM.RR'),
		'7',
		'2',
		null,
		null,
		4
	);

Insert into
	JOURNAL (
		RECIVE_DATE,
		RETURN_DATE,
		LIBRARY_CARD_ID,
		BOOK_ID,
		BOOK_RATING,
		WHERE_READS,
		EMPLOYEES_ID
	)
values
	(
		to_date('10.06.22', 'DD.MM.RR'),
		to_date('01.07.22', 'DD.MM.RR'),
		'11',
		'43',
		null,
		null,
		3
	);

Insert into
	JOURNAL (
		RECIVE_DATE,
		RETURN_DATE,
		LIBRARY_CARD_ID,
		BOOK_ID,
		BOOK_RATING,
		WHERE_READS,
		EMPLOYEES_ID
	)
values
	(
		to_date('10.06.22', 'DD.MM.RR'),
		null,
		'14',
		'1',
		null,
		null,
		4
	);

Insert into
	JOURNAL (
		RECIVE_DATE,
		RETURN_DATE,
		LIBRARY_CARD_ID,
		BOOK_ID,
		BOOK_RATING,
		WHERE_READS,
		EMPLOYEES_ID
	)
values
	(
		to_date('10.06.22', 'DD.MM.RR'),
		null,
		'13',
		'35',
		null,
		null,
		3
	);

Insert into
	JOURNAL (
		RECIVE_DATE,
		RETURN_DATE,
		LIBRARY_CARD_ID,
		BOOK_ID,
		BOOK_RATING,
		WHERE_READS,
		EMPLOYEES_ID
	)
values
	(
		to_date('01.08.22', 'DD.MM.RR'),
		null,
		'12',
		'36',
		null,
		null,
		4
	);

---------------------------------------------------------------------------------------------------------------------------------------------------
--Readers--
INSERT INTO
	Readers (
		Name,
		Surname,
		Birthd_date,
		Rating,
		Sex,
		Black_list,
		Money
	)
VALUES
	(
		'Кирилл',
		'Овчинников',
		TO_DATE('1973-6-27 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),
		503,
		0,
		1,
		1887
	);

INSERT INTO
	Readers (
		Name,
		Surname,
		Birthd_date,
		Rating,
		Sex,
		Black_list,
		Money
	)
VALUES
	(
		'Ульяна',
		'Соболева',
		TO_DATE('2003-3-9 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),
		382,
		2,
		0,
		348
	);

INSERT INTO
	Readers (
		Name,
		Surname,
		Birthd_date,
		Rating,
		Sex,
		Black_list,
		Money
	)
VALUES
	(
		'Марк',
		'Семенов',
		TO_DATE('1991-8-5 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),
		356,
		2,
		1,
		1003
	);

INSERT INTO
	Readers (
		Name,
		Surname,
		Birthd_date,
		Rating,
		Sex,
		Black_list,
		Money
	)
VALUES
	(
		'Варвара',
		'Гладкова',
		TO_DATE('1995-4-4 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),
		95,
		0,
		1,
		1091
	);

INSERT INTO
	Readers (
		Name,
		Surname,
		Birthd_date,
		Rating,
		Sex,
		Black_list,
		Money
	)
VALUES
	(
		'Дмитрий',
		'Климов',
		TO_DATE('2000-7-17 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),
		988,
		0,
		0,
		48
	);

INSERT INTO
	Readers (
		Name,
		Surname,
		Birthd_date,
		Rating,
		Sex,
		Black_list,
		Money
	)
VALUES
	(
		'Аделина',
		'Пономарева',
		TO_DATE('1996-8-17 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),
		987,
		2,
		1,
		161
	);

INSERT INTO
	Readers (
		Name,
		Surname,
		Birthd_date,
		Rating,
		Sex,
		Black_list,
		Money
	)
VALUES
	(
		'Игорь',
		'Цветков',
		TO_DATE('1985-2-7 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),
		182,
		9,
		0,
		1638
	);

INSERT INTO
	Readers (
		Name,
		Surname,
		Birthd_date,
		Rating,
		Sex,
		Black_list,
		Money
	)
VALUES
	(
		'Вероника',
		'Андреева',
		TO_DATE('1992-11-11 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),
		411,
		9,
		1,
		1664
	);

INSERT INTO
	Readers (
		Name,
		Surname,
		Birthd_date,
		Rating,
		Sex,
		Black_list,
		Money
	)
VALUES
	(
		'Тимур',
		'Семенов',
		TO_DATE('1950-8-9 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),
		746,
		2,
		1,
		1995
	);

INSERT INTO
	Readers (
		Name,
		Surname,
		Birthd_date,
		Rating,
		Sex,
		Black_list,
		Money
	)
VALUES
	(
		'Кристина',
		'Черныха',
		TO_DATE('1964-10-11 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),
		963,
		2,
		0,
		501
	);

INSERT INTO
	Readers (
		Name,
		Surname,
		Birthd_date,
		Rating,
		Sex,
		Black_list,
		Money
	)
VALUES
	(
		'Юрий',
		'Савельев',
		TO_DATE('2007-4-21 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),
		29,
		0,
		1,
		172
	);

INSERT INTO
	Readers (
		Name,
		Surname,
		Birthd_date,
		Rating,
		Sex,
		Black_list,
		Money
	)
VALUES
	(
		'Маргарита',
		'Матвеева',
		TO_DATE('1951-6-12 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),
		609,
		0,
		0,
		1822
	);

INSERT INTO
	Readers (
		Name,
		Surname,
		Birthd_date,
		Rating,
		Sex,
		Black_list,
		Money
	)
VALUES
	(
		'Юрий',
		'Артемов',
		TO_DATE('1955-4-19 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),
		498,
		1,
		1,
		1436
	);

INSERT INTO
	Readers (
		Name,
		Surname,
		Birthd_date,
		Rating,
		Sex,
		Black_list,
		Money
	)
VALUES
	(
		'Кристина',
		'Матвеева',
		TO_DATE('2005-9-22 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),
		51,
		2,
		0,
		1375
	);

INSERT INTO
	Readers (
		Name,
		Surname,
		Birthd_date,
		Rating,
		Sex,
		Black_list,
		Money
	)
VALUES
	(
		'Алексей',
		'Новиков',
		TO_DATE('1990-5-6 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),
		697,
		1,
		0,
		553
	);

INSERT INTO
	Readers (
		Name,
		Surname,
		Birthd_date,
		Rating,
		Sex,
		Black_list,
		Money
	)
VALUES
	(
		'Арина',
		'Белоусова',
		TO_DATE('1975-4-28 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),
		795,
		9,
		0,
		704
	);

INSERT INTO
	Readers (
		Name,
		Surname,
		Birthd_date,
		Rating,
		Sex,
		Black_list,
		Money
	)
VALUES
	(
		'Тимофей',
		'Осипов',
		TO_DATE('1990-10-14 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),
		660,
		9,
		0,
		703
	);

INSERT INTO
	Readers (
		Name,
		Surname,
		Birthd_date,
		Rating,
		Sex,
		Black_list,
		Money
	)
VALUES
	(
		'Мелания',
		'Цветкова',
		TO_DATE('1978-6-10 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),
		155,
		9,
		0,
		1959
	);

INSERT INTO
	Readers (
		Name,
		Surname,
		Birthd_date,
		Rating,
		Sex,
		Black_list,
		Money
	)
VALUES
	(
		'Давид',
		'Иванов',
		TO_DATE('1995-10-20 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),
		655,
		2,
		0,
		1926
	);

INSERT INTO
	Readers (
		Name,
		Surname,
		Birthd_date,
		Rating,
		Sex,
		Black_list,
		Money
	)
VALUES
	(
		'Светлана',
		'Фокина',
		TO_DATE('1953-8-21 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),
		497,
		9,
		1,
		884
	);

INSERT INTO
	Readers (
		Name,
		Surname,
		Birthd_date,
		Rating,
		Sex,
		Black_list,
		Money
	)
VALUES
	(
		'Руслан',
		'Осипов',
		TO_DATE('1974-2-11 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),
		674,
		2,
		0,
		1054
	);

INSERT INTO
	Readers (
		Name,
		Surname,
		Birthd_date,
		Rating,
		Sex,
		Black_list,
		Money
	)
VALUES
	(
		'Арина',
		'Яковлева',
		TO_DATE('1965-7-11 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),
		620,
		2,
		1,
		120
	);

INSERT INTO
	Readers (
		Name,
		Surname,
		Birthd_date,
		Rating,
		Sex,
		Black_list,
		Money
	)
VALUES
	(
		'Артём',
		'Лосев',
		TO_DATE('1977-7-26 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),
		235,
		9,
		0,
		718
	);

INSERT INTO
	Readers (
		Name,
		Surname,
		Birthd_date,
		Rating,
		Sex,
		Black_list,
		Money
	)
VALUES
	(
		'Мила',
		'Лебедева',
		TO_DATE('2001-3-16 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),
		404,
		1,
		0,
		152
	);

INSERT INTO
	Readers (
		Name,
		Surname,
		Birthd_date,
		Rating,
		Sex,
		Black_list,
		Money
	)
VALUES
	(
		'Ярослав',
		'Осипов',
		TO_DATE('1947-10-27 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),
		832,
		2,
		0,
		864
	);

INSERT INTO
	Readers (
		Name,
		Surname,
		Birthd_date,
		Rating,
		Sex,
		Black_list,
		Money
	)
VALUES
	(
		'Диана',
		'Андреева',
		TO_DATE('1956-1-21 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),
		208,
		0,
		1,
		1924
	);

INSERT INTO
	Readers (
		Name,
		Surname,
		Birthd_date,
		Rating,
		Sex,
		Black_list,
		Money
	)
VALUES
	(
		'Алексей',
		'Сухов',
		TO_DATE('1993-8-19 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),
		394,
		9,
		0,
		1668
	);

INSERT INTO
	Readers (
		Name,
		Surname,
		Birthd_date,
		Rating,
		Sex,
		Black_list,
		Money
	)
VALUES
	(
		'Ярослава',
		'Цветкова',
		TO_DATE('2007-1-25 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),
		532,
		2,
		0,
		1213
	);

INSERT INTO
	Readers (
		Name,
		Surname,
		Birthd_date,
		Rating,
		Sex,
		Black_list,
		Money
	)
VALUES
	(
		'Арсений',
		'Кудряшов',
		TO_DATE('1981-9-15 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),
		240,
		2,
		1,
		502
	);

INSERT INTO
	Readers (
		Name,
		Surname,
		Birthd_date,
		Rating,
		Sex,
		Black_list,
		Money
	)
VALUES
	(
		'Нина',
		'Цветкова',
		TO_DATE('1984-11-17 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),
		660,
		0,
		1,
		1584
	);

INSERT INTO
	Readers (
		Name,
		Surname,
		Birthd_date,
		Rating,
		Sex,
		Black_list,
		Money
	)
VALUES
	(
		'Платон',
		'Овчинников',
		TO_DATE('1949-6-9 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),
		634,
		2,
		0,
		1283
	);

INSERT INTO
	Readers (
		Name,
		Surname,
		Birthd_date,
		Rating,
		Sex,
		Black_list,
		Money
	)
VALUES
	(
		'Яна',
		'Агафонова',
		TO_DATE('2000-1-17 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),
		881,
		9,
		0,
		767
	);

INSERT INTO
	Readers (
		Name,
		Surname,
		Birthd_date,
		Rating,
		Sex,
		Black_list,
		Money
	)
VALUES
	(
		'Кирилл',
		'Егоров',
		TO_DATE('1988-9-25 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),
		305,
		0,
		0,
		231
	);

INSERT INTO
	Readers (
		Name,
		Surname,
		Birthd_date,
		Rating,
		Sex,
		Black_list,
		Money
	)
VALUES
	(
		'Елизавета',
		'Фокина',
		TO_DATE('2007-9-13 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),
		625,
		9,
		1,
		929
	);

INSERT INTO
	Readers (
		Name,
		Surname,
		Birthd_date,
		Rating,
		Sex,
		Black_list,
		Money
	)
VALUES
	(
		'Леонид',
		'Семенов',
		TO_DATE('1995-4-28 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),
		935,
		2,
		0,
		632
	);

INSERT INTO
	Readers (
		Name,
		Surname,
		Birthd_date,
		Rating,
		Sex,
		Black_list,
		Money
	)
VALUES
	(
		'Мирослава',
		'Масленникова',
		TO_DATE('1946-3-31 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),
		206,
		1,
		0,
		1289
	);

INSERT INTO
	Readers (
		Name,
		Surname,
		Birthd_date,
		Rating,
		Sex,
		Black_list,
		Money
	)
VALUES
	(
		'Адам',
		'Семенов',
		TO_DATE('1948-12-11 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),
		385,
		9,
		0,
		765
	);

INSERT INTO
	Readers (
		Name,
		Surname,
		Birthd_date,
		Rating,
		Sex,
		Black_list,
		Money
	)
VALUES
	(
		'Ангелина',
		'Белоусова',
		TO_DATE('1992-10-8 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),
		648,
		1,
		0,
		559
	);

INSERT INTO
	Readers (
		Name,
		Surname,
		Birthd_date,
		Rating,
		Sex,
		Black_list,
		Money
	)
VALUES
	(
		'Антон',
		'Рожков',
		TO_DATE('1957-3-1 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),
		117,
		0,
		0,
		1266
	);

INSERT INTO
	Readers (
		Name,
		Surname,
		Birthd_date,
		Rating,
		Sex,
		Black_list,
		Money
	)
VALUES
	(
		'Анна',
		'Агафонова',
		TO_DATE('1968-6-7 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),
		174,
		2,
		0,
		1620
	);