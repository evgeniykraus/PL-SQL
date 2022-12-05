DECLARE
 --Age_limits VARIABLE
	V_ID_AGE_LIMITS_0                   NUMBER;
	V_ID_AGE_LIMITS_6                   NUMBER;
	V_ID_AGE_LIMITS_12                  NUMBER;
	V_ID_AGE_LIMITS_16                  NUMBER;
	V_ID_AGE_LIMITS_18                  NUMBER;
 --Types VARIABLE
	V_ID_TYPES_КНИГА                    NUMBER;
	V_ID_TYPES_ГАЗЕТА                   NUMBER;
	V_ID_TYPES_ЖУРНАЛ                   NUMBER;
 --Stock VARIABLE
	V_ID_STOCK_ОДИН_ДЕНЬ                NUMBER;
	V_ID_STOCK_ЕВГЕНИЙ_ОНЕГИН           NUMBER;
	V_ID_STOCK_СКОТНЫЙ_ДВОР             NUMBER;
	V_ID_STOCK_ВОЙНА_МИР                NUMBER;
	V_ID_STOCK_ОДНОЭТАЖНАЯ_АМЕРИКА      NUMBER;
	V_ID_STOCK_ДЛИННАЯ_СЕРЕБРЯНАЯ_ЛОЖКА NUMBER;
	V_ID_STOCK_ГУЛАГ                    NUMBER;
	V_ID_STOCK_СОБАЧЬЕ_СЕРДЦЕ           NUMBER;
	V_ID_STOCK_КРОКОДИЛ_27              NUMBER;
	V_ID_STOCK_КОММЕРСАНТЪ_181          NUMBER;
 --Genres VARIABLE
	V_ID_GENRES_ПУБЛИЦИСТИКА            NUMBER;
	V_ID_GENRES_ТРИЛЛЕР                 NUMBER;
	V_ID_GENRES_ЭРОТИКА                 NUMBER;
	V_ID_GENRES_ДЕТЕКТИВ                NUMBER;
	V_ID_GENRES_ФЭНТЕЗИ                 NUMBER;
	V_ID_GENRES_ПРОЗА                   NUMBER;
	V_ID_GENRES_ПРИКЛЮЧЕНИЯ             NUMBER;
	V_ID_GENRES_САТИРА                  NUMBER;
	V_ID_GENRES_ПОЭЗИЯ                  NUMBER;
	V_ID_GENRES_ФАНТАСТИКА              NUMBER;
	V_ID_GENRES_РОМАН                   NUMBER;
	V_ID_GENRES_ДРАМА                   NUMBER;
 --Authors VARIABLE
	V_ID_AUTHORS_ИЛЬЯ_ИЛЬФ              NUMBER;
	V_ID_AUTHORS_ЕВГЕНИЙ_ПЕТРОВ         NUMBER;
	V_ID_AUTHORS_КЭТРИН_КОУТИ           NUMBER;
	V_ID_AUTHORS_КЭРРИ_ГРИНБЕРГ         NUMBER;
	V_ID_AUTHORS_АЛЕКСАНДР_СОЛЖЕНИЦЫН   NUMBER;
	V_ID_AUTHORS_МИХАИЛ_БУЛГАКОВ        NUMBER;
	V_ID_AUTHORS_АЛЕКСАНДР_ПУШКИН       NUMBER;
	V_ID_AUTHORS_ДЖОРДЖ_ОРУЭЛЛ          NUMBER;
	V_ID_AUTHORS_ЛЕВ_ТОЛСТОЙ            NUMBER;
 --Tags VARIABLE
	V_ID_TAGS_ГУЛАГ                     NUMBER;
	V_ID_TAGS_ЛАУРЕАТЫ_НОБЕЛЕВСКОЙ      NUMBER;
	V_ID_TAGS_РУССКАЯ_КЛАССИКА          NUMBER;
	V_ID_TAGS_ПОЛИТИЧЕСКАЯ_САТИРА       NUMBER;
	V_ID_TAGS_ЗАРУБЕЖНАЯ_КЛАССИКА       NUMBER;
	V_ID_TAGS_ЛЮБОВНЫЕ                  NUMBER;
	V_ID_TAGS_АВТОБИОГРАФИЯ             NUMBER;
	V_ID_TAGS_ЧЕРНЫЙ                    NUMBER;
	V_ID_TAGS_ФИЛОСОФСКАЯ               NUMBER;
 --Publisher VARIABLE
	V_ID_PUBLISHERS_ПРОСВЕЩЕНИЕ         NUMBER;
	V_ID_PUBLISHERS_АЗБУКА              NUMBER;
	V_ID_PUBLISHERS_РИПОЛ               NUMBER;
	V_ID_PUBLISHERS_ЛАНЬ                NUMBER;
	V_ID_PUBLISHERS_ЭКЗАМЕН             NUMBER;
	V_ID_PUBLISHERS_ДРОФА               NUMBER;
	V_ID_PUBLISHERS_СИМБАТ              NUMBER;
	V_ID_PUBLISHERS_РОСМЭН              NUMBER;
	V_ID_PUBLISHERS_МАНН                NUMBER;
	V_ID_PUBLISHERS_ИНФРА               NUMBER;
	V_ID_PUBLISHERS_БИНОМ               NUMBER;
	V_ID_PUBLISHERS_ВЕНТАНА             NUMBER;
	V_ID_PUBLISHERS_ВЕЧЕ                NUMBER;
	V_ID_PUBLISHERS_РЕШЕНИЯ             NUMBER;
	V_ID_PUBLISHERS_ПЕРО                NUMBER;
	V_ID_PUBLISHERS_ИЗДАТЕЛЬСКИЙ        NUMBER;
	V_ID_PUBLISHERS_ФЕНИКС              NUMBER;
	V_ID_PUBLISHERS_ЦЕНТРПОЛИГРАФ       NUMBER;
	V_ID_PUBLISHERS_ПРОСПЕКТ            NUMBER;
	V_ID_PUBLISHERS_СТРЕКОЗА            NUMBER;
	V_ID_PUBLISHERS_ФЛИНТА              NUMBER;
	V_ID_PUBLISHERS_ФЛАМИНГО            NUMBER;
BEGIN
 --Age_limits
	INSERT INTO AGE_LIMITS VALUES (
		AGE_LIMITS_SEQ.NEXTVAL,
		0
	) RETURNING ID INTO V_ID_AGE_LIMITS_0;
	INSERT INTO AGE_LIMITS VALUES (
		AGE_LIMITS_SEQ.NEXTVAL,
		6
	) RETURNING ID INTO V_ID_AGE_LIMITS_6;
	INSERT INTO AGE_LIMITS VALUES (
		AGE_LIMITS_SEQ.NEXTVAL,
		12
	) RETURNING ID INTO V_ID_AGE_LIMITS_12;
	INSERT INTO AGE_LIMITS VALUES (
		AGE_LIMITS_SEQ.NEXTVAL,
		16
	) RETURNING ID INTO V_ID_AGE_LIMITS_16;
	INSERT INTO AGE_LIMITS VALUES (
		AGE_LIMITS_SEQ.NEXTVAL,
		18
	) RETURNING ID INTO V_ID_AGE_LIMITS_18;
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
	) RETURNING ID INTO V_ID_TYPES_КНИГА;
	INSERT INTO TYPES VALUES (
		TYPES_SEQ.NEXTVAL,
		'Газета'
	) RETURNING ID INTO V_ID_TYPES_ГАЗЕТА;
	INSERT INTO TYPES VALUES (
		TYPES_SEQ.NEXTVAL,
		'Журнал'
	) RETURNING ID INTO V_ID_TYPES_ЖУРНАЛ;
 ------------------------------------------------------------------------------------------------
 --Publishers
	INSERT INTO PUBLISHERS VALUES (
		PUBLISHERS_SEQ.NEXTVAL,
		'Просвещение'
	) RETURNING ID INTO V_ID_PUBLISHERS_ПРОСВЕЩЕНИЕ;
	INSERT INTO PUBLISHERS VALUES (
		PUBLISHERS_SEQ.NEXTVAL,
		'Азбука-Аттикус'
	) RETURNING ID INTO V_ID_PUBLISHERS_АЗБУКА;
	INSERT INTO PUBLISHERS VALUES (
		PUBLISHERS_SEQ.NEXTVAL,
		'РИПОЛ'
	) RETURNING ID INTO V_ID_PUBLISHERS_РИПОЛ;
	INSERT INTO PUBLISHERS VALUES (
		PUBLISHERS_SEQ.NEXTVAL,
		'Лань'
	) RETURNING ID INTO V_ID_PUBLISHERS_ЛАНЬ;
	INSERT INTO PUBLISHERS VALUES (
		PUBLISHERS_SEQ.NEXTVAL,
		'Экзамен'
	) RETURNING ID INTO V_ID_PUBLISHERS_ЭКЗАМЕН;
	INSERT INTO PUBLISHERS VALUES (
		PUBLISHERS_SEQ.NEXTVAL,
		'Дрофа'
	) RETURNING ID INTO V_ID_PUBLISHERS_ДРОФА;
	INSERT INTO PUBLISHERS VALUES (
		PUBLISHERS_SEQ.NEXTVAL,
		'СИМБАТ'
	) RETURNING ID INTO V_ID_PUBLISHERS_СИМБАТ;
	INSERT INTO PUBLISHERS VALUES (
		PUBLISHERS_SEQ.NEXTVAL,
		'Росмэн'
	) RETURNING ID INTO V_ID_PUBLISHERS_РОСМЭН;
	INSERT INTO PUBLISHERS VALUES (
		PUBLISHERS_SEQ.NEXTVAL,
		'Манн Иванов и Фербер'
	) RETURNING ID INTO V_ID_PUBLISHERS_МАНН;
	INSERT INTO PUBLISHERS VALUES (
		PUBLISHERS_SEQ.NEXTVAL,
		'ИНФРА-М'
	) RETURNING ID INTO V_ID_PUBLISHERS_ИНФРА;
	INSERT INTO PUBLISHERS VALUES (
		PUBLISHERS_SEQ.NEXTVAL,
		'Бином. Лаборатория знаний'
	) RETURNING ID INTO V_ID_PUBLISHERS_БИНОМ;
	INSERT INTO PUBLISHERS VALUES (
		PUBLISHERS_SEQ.NEXTVAL,
		'Вентана-Граф'
	) RETURNING ID INTO V_ID_PUBLISHERS_ВЕНТАНА;
	INSERT INTO PUBLISHERS VALUES (
		PUBLISHERS_SEQ.NEXTVAL,
		'Вече'
	) RETURNING ID INTO V_ID_PUBLISHERS_ВЕЧЕ;
	INSERT INTO PUBLISHERS VALUES (
		PUBLISHERS_SEQ.NEXTVAL,
		'Издательские решения'
	) RETURNING ID INTO V_ID_PUBLISHERS_РЕШЕНИЯ;
	INSERT INTO PUBLISHERS VALUES (
		PUBLISHERS_SEQ.NEXTVAL,
		'Перо'
	) RETURNING ID INTO V_ID_PUBLISHERS_ПЕРО;
	INSERT INTO PUBLISHERS VALUES (
		PUBLISHERS_SEQ.NEXTVAL,
		'Издательский дом Лев'
	) RETURNING ID INTO V_ID_PUBLISHERS_ИЗДАТЕЛЬСКИЙ;
	INSERT INTO PUBLISHERS VALUES (
		PUBLISHERS_SEQ.NEXTVAL,
		'Феникс'
	) RETURNING ID INTO V_ID_PUBLISHERS_ФЕНИКС;
	INSERT INTO PUBLISHERS VALUES (
		PUBLISHERS_SEQ.NEXTVAL,
		'Центрполиграф'
	) RETURNING ID INTO V_ID_PUBLISHERS_ЦЕНТРПОЛИГРАФ;
	INSERT INTO PUBLISHERS VALUES (
		PUBLISHERS_SEQ.NEXTVAL,
		'Проспект'
	) RETURNING ID INTO V_ID_PUBLISHERS_ПРОСПЕКТ;
	INSERT INTO PUBLISHERS VALUES (
		PUBLISHERS_SEQ.NEXTVAL,
		'Стрекоза-Пресс'
	) RETURNING ID INTO V_ID_PUBLISHERS_СТРЕКОЗА;
	INSERT INTO PUBLISHERS VALUES (
		PUBLISHERS_SEQ.NEXTVAL,
		'Флинта'
	) RETURNING ID INTO V_ID_PUBLISHERS_ФЛИНТА;
	INSERT INTO PUBLISHERS VALUES (
		PUBLISHERS_SEQ.NEXTVAL,
		'Фламинго'
	) RETURNING ID INTO V_ID_PUBLISHERS_ФЛАМИНГО;
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
		DESCRIPTION,
		RECEIPT_DATE
	) VALUES (
		STOCK_SEQ.NEXTVAL,
		'Один день Ивана Денисовича',
		2,
		2007,
		100,
		V_ID_TYPES_КНИГА,
		V_ID_AGE_LIMITS_12,
		V_ID_PUBLISHERS_ПРОСВЕЩЕНИЕ,
		'«Я в 50-м году, в какой-то долгий лагерный зимний день таскал носилки с напарником и подумал: как описать всю нашу лагерную жизнь? По сути достаточно описать один всего день в подробностях… и день самого простого работяги, и тут отразится вся наша жизнь.',
		SYSDATE
	) RETURNING ID INTO V_ID_STOCK_ОДИН_ДЕНЬ;
	INSERT INTO STOCK(
		ID,
		BOOK_NAME,
		AMOUNT,
		PUBLICATION_YEAR,
		COST,
		TYPE_ID,
		AGE_LIMIT_ID,
		PUBLISHER_ID,
		DESCRIPTION,
		RECEIPT_DATE
	) VALUES (
		STOCK_SEQ.NEXTVAL,
		'Евгений Онегин',
		6,
		2018,
		128,
		V_ID_TYPES_КНИГА,
		V_ID_AGE_LIMITS_16,
		V_ID_PUBLISHERS_РИПОЛ,
		'Роман А. С. Пушкина "Евгений Онегин" приводится в иллюстрациях известного живописца XX века Лидии Тимошенко. Главное пушкинское произведение стало единственной книгой, к которой Тимошенко обратилась как иллюстратор.',
		SYSDATE
	) RETURNING ID INTO V_ID_STOCK_ЕВГЕНИЙ_ОНЕГИН;
	INSERT INTO STOCK(
		ID,
		BOOK_NAME,
		AMOUNT,
		PUBLICATION_YEAR,
		COST,
		TYPE_ID,
		AGE_LIMIT_ID,
		PUBLISHER_ID,
		DESCRIPTION,
		RECEIPT_DATE
	) VALUES (
		STOCK_SEQ.NEXTVAL,
		'Скотный двор',
		8,
		2014,
		250,
		V_ID_TYPES_КНИГА,
		V_ID_AGE_LIMITS_16,
		V_ID_PUBLISHERS_ЛАНЬ,
		'В повести изображена эволюция общества животных, изгнавших со скотного двора (первоначально называвшегося ферма «Усадьба» или в других переводах — «Господский двор», «Райский уголок») его предыдущего владельца, жестокого мистера Джонса, от безграничной свободы к диктатуре свиньи по кличке Наполеон.',
		SYSDATE
	) RETURNING ID INTO V_ID_STOCK_СКОТНЫЙ_ДВОР;
	INSERT INTO STOCK(
		ID,
		BOOK_NAME,
		AMOUNT,
		PUBLICATION_YEAR,
		COST,
		TYPE_ID,
		AGE_LIMIT_ID,
		PUBLISHER_ID,
		DESCRIPTION,
		RECEIPT_DATE
	) VALUES (
		STOCK_SEQ.NEXTVAL,
		'Война и мир',
		4,
		1999,
		300,
		V_ID_TYPES_КНИГА,
		V_ID_AGE_LIMITS_16,
		V_ID_PUBLISHERS_ДРОФА,
		'Война и мир» относится к литературному направлению реализм: в книге подробно описан ряд ключевых исторических событий, изображены типичные для российского общества персонажи, основной конфликт – «герой и общество».',
		SYSDATE
	) RETURNING ID INTO V_ID_STOCK_ВОЙНА_МИР;
	INSERT INTO STOCK(
		ID,
		BOOK_NAME,
		AMOUNT,
		PUBLICATION_YEAR,
		COST,
		TYPE_ID,
		AGE_LIMIT_ID,
		PUBLISHER_ID,
		DESCRIPTION,
		RECEIPT_DATE
	) VALUES (
		STOCK_SEQ.NEXTVAL,
		'Одноэтажная Америка',
		5,
		2003,
		350,
		V_ID_TYPES_КНИГА,
		V_ID_AGE_LIMITS_18,
		V_ID_PUBLISHERS_СИМБАТ,
		'Книга о путешествии двух советских журналистов по Америке в середине 30х годов прошлого века. Книга написана в лучших традициях Ильфа и Петрова и рассказывает о быте простых американцев пост депрессионного периода.',
		SYSDATE
	) RETURNING ID INTO V_ID_STOCK_ОДНОЭТАЖНАЯ_АМЕРИКА;
	INSERT INTO STOCK(
		ID,
		BOOK_NAME,
		AMOUNT,
		PUBLICATION_YEAR,
		COST,
		TYPE_ID,
		AGE_LIMIT_ID,
		PUBLISHER_ID,
		DESCRIPTION,
		RECEIPT_DATE
	) VALUES (
		STOCK_SEQ.NEXTVAL,
		'Длинная серебряная ложка',
		5,
		2009,
		190,
		V_ID_TYPES_КНИГА,
		V_ID_AGE_LIMITS_12,
		V_ID_PUBLISHERS_РОСМЭН,
		'Когда молодой англичанин Уолтер Стивенс приезжает в Трансильванию 1880х годов на поиски вампиров, он попадает в мир, где соседствуют сказка и реальность, а вампиры охотятся не только на людей, но и друг на друга. Уолтеру и его друзьям предстоит бороться как с внешними врагами, так и с внутренними демонами, пока они наконец не придут к выводу - даже если ты превратился в вампира, всегда можно остаться Человеком.',
		SYSDATE
	) RETURNING ID INTO V_ID_STOCK_ДЛИННАЯ_СЕРЕБРЯНАЯ_ЛОЖКА;
	INSERT INTO STOCK(
		ID,
		BOOK_NAME,
		AMOUNT,
		PUBLICATION_YEAR,
		COST,
		TYPE_ID,
		AGE_LIMIT_ID,
		PUBLISHER_ID,
		DESCRIPTION,
		RECEIPT_DATE
	) VALUES (
		STOCK_SEQ.NEXTVAL,
		'Архипелаг ГУЛАГ',
		5,
		2000,
		150,
		V_ID_TYPES_КНИГА,
		V_ID_AGE_LIMITS_18,
		V_ID_PUBLISHERS_МАНН,
		'«…Книга – о крови, о поте, о слезах, о страданиях, о безнадежности, а ее закрываешь с ощущением силы и света. Она показывает: человек во всех обстоятельствах может остаться человеком. Дает ощущение, что наш народ не кончился, мы прошли нижнюю точку, мы прошли катарсис. Исправлять жизнь будет трудно, но возможно».',
		SYSDATE
	) RETURNING ID INTO V_ID_STOCK_ГУЛАГ;
	INSERT INTO STOCK(
		ID,
		BOOK_NAME,
		AMOUNT,
		PUBLICATION_YEAR,
		COST,
		TYPE_ID,
		AGE_LIMIT_ID,
		PUBLISHER_ID,
		DESCRIPTION,
		RECEIPT_DATE
	) VALUES (
		STOCK_SEQ.NEXTVAL,
		'Собачье сердце',
		5,
		2001,
		130,
		V_ID_TYPES_КНИГА,
		V_ID_AGE_LIMITS_12,
		V_ID_PUBLISHERS_ИНФРА,
		'Профессор Преображенский и доктор Борменталь, совсем как Шерлок Холмс и Ватсон, пускаются в настоящее приключение. Подобно Фаусту Гёте, они создают своего "гомункулуса", не представляя, чем обернется научный и человеческий эксперимент... ',
		SYSDATE
	) RETURNING ID INTO V_ID_STOCK_СОБАЧЬЕ_СЕРДЦЕ;
	INSERT INTO STOCK(
		ID,
		BOOK_NAME,
		AMOUNT,
		PUBLICATION_YEAR,
		COST,
		TYPE_ID,
		AGE_LIMIT_ID,
		RECEIPT_DATE
	) VALUES (
		STOCK_SEQ.NEXTVAL,
		'Крокодил(выпуск 27)',
		2,
		1952,
		1,
		V_ID_TYPES_ЖУРНАЛ,
		V_ID_AGE_LIMITS_12,
		SYSDATE
	) RETURNING ID INTO V_ID_STOCK_КРОКОДИЛ_27;
	INSERT INTO STOCK(
		ID,
		BOOK_NAME,
		AMOUNT,
		PUBLICATION_YEAR,
		COST,
		TYPE_ID,
		AGE_LIMIT_ID,
		RECEIPT_DATE
	) VALUES (
		STOCK_SEQ.NEXTVAL,
		'Коммерсантъ(выпуск 181)',
		3,
		1997,
		10,
		V_ID_TYPES_ГАЗЕТА,
		V_ID_AGE_LIMITS_12,
		SYSDATE
	) RETURNING ID INTO V_ID_STOCK_КОММЕРСАНТЪ_181;
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
	) RETURNING ID INTO V_ID_AUTHORS_ИЛЬЯ_ИЛЬФ;
	INSERT INTO AUTHORS (
		ID,
		NAME,
		SURNAME
	) VALUES (
		AUTHORS_SEQ.NEXTVAL,
		'Евгений',
		'Петров'
	) RETURNING ID INTO V_ID_AUTHORS_ЕВГЕНИЙ_ПЕТРОВ;
	INSERT INTO AUTHORS (
		ID,
		NAME,
		SURNAME
	) VALUES (
		AUTHORS_SEQ.NEXTVAL,
		'Кэтрин',
		'Коути'
	) RETURNING ID INTO V_ID_AUTHORS_КЭТРИН_КОУТИ;
	INSERT INTO AUTHORS (
		ID,
		NAME,
		SURNAME
	) VALUES (
		AUTHORS_SEQ.NEXTVAL,
		'Кэрри',
		'Гринберг'
	) RETURNING ID INTO V_ID_AUTHORS_КЭРРИ_ГРИНБЕРГ;
	INSERT INTO AUTHORS (
		ID,
		NAME,
		SURNAME
	) VALUES (
		AUTHORS_SEQ.NEXTVAL,
		'Александр',
		'Солженицын'
	) RETURNING ID INTO V_ID_AUTHORS_АЛЕКСАНДР_СОЛЖЕНИЦЫН;
	INSERT INTO AUTHORS (
		ID,
		NAME,
		SURNAME
	) VALUES (
		AUTHORS_SEQ.NEXTVAL,
		'Михаил',
		'Булгаков'
	) RETURNING ID INTO V_ID_AUTHORS_МИХАИЛ_БУЛГАКОВ;
	INSERT INTO AUTHORS (
		ID,
		NAME,
		SURNAME
	) VALUES (
		AUTHORS_SEQ.NEXTVAL,
		'Александр',
		'Пушкин'
	) RETURNING ID INTO V_ID_AUTHORS_АЛЕКСАНДР_ПУШКИН;
	INSERT INTO AUTHORS (
		ID,
		NAME,
		SURNAME
	) VALUES (
		AUTHORS_SEQ.NEXTVAL,
		'Джордж',
		'Оруэлл'
	) RETURNING ID INTO V_ID_AUTHORS_ДЖОРДЖ_ОРУЭЛЛ;
	INSERT INTO AUTHORS (
		ID,
		NAME,
		SURNAME
	) VALUES (
		AUTHORS_SEQ.NEXTVAL,
		'Лев',
		'Толстой'
	) RETURNING ID INTO V_ID_AUTHORS_ЛЕВ_ТОЛСТОЙ;
 ------------------------------------------------------------------------------------------------
 --Author_stock--
 --Один день Ивана Денисовича
	INSERT INTO AUTHOR_STOCK VALUES (
		AUTHOR_STOCK_SEQ.NEXTVAL,
		V_ID_AUTHORS_АЛЕКСАНДР_СОЛЖЕНИЦЫН,
		V_ID_STOCK_ОДИН_ДЕНЬ
	);
 --Евгений Онегин
	INSERT INTO AUTHOR_STOCK VALUES (
		AUTHOR_STOCK_SEQ.NEXTVAL,
		V_ID_AUTHORS_АЛЕКСАНДР_ПУШКИН,
		V_ID_STOCK_ЕВГЕНИЙ_ОНЕГИН
	);
 --Скотный двор
	INSERT INTO AUTHOR_STOCK VALUES (
		AUTHOR_STOCK_SEQ.NEXTVAL,
		V_ID_AUTHORS_ДЖОРДЖ_ОРУЭЛЛ,
		V_ID_STOCK_СКОТНЫЙ_ДВОР
	);
 --Война и мир
	INSERT INTO AUTHOR_STOCK VALUES (
		AUTHOR_STOCK_SEQ.NEXTVAL,
		V_ID_AUTHORS_ЛЕВ_ТОЛСТОЙ,
		V_ID_STOCK_ВОЙНА_МИР
	);
 --Одноэтажная Америка
	INSERT INTO AUTHOR_STOCK VALUES (
		AUTHOR_STOCK_SEQ.NEXTVAL,
		V_ID_AUTHORS_ЕВГЕНИЙ_ПЕТРОВ,
		V_ID_STOCK_ОДНОЭТАЖНАЯ_АМЕРИКА
	);
	INSERT INTO AUTHOR_STOCK VALUES (
		AUTHOR_STOCK_SEQ.NEXTVAL,
		V_ID_AUTHORS_ИЛЬЯ_ИЛЬФ,
		V_ID_STOCK_ОДНОЭТАЖНАЯ_АМЕРИКА
	);
 --Длинная серебряная ложка
	INSERT INTO AUTHOR_STOCK VALUES (
		AUTHOR_STOCK_SEQ.NEXTVAL,
		V_ID_AUTHORS_КЭТРИН_КОУТИ,
		V_ID_STOCK_ДЛИННАЯ_СЕРЕБРЯНАЯ_ЛОЖКА
	);
	INSERT INTO AUTHOR_STOCK VALUES (
		AUTHOR_STOCK_SEQ.NEXTVAL,
		V_ID_AUTHORS_КЭРРИ_ГРИНБЕРГ,
		V_ID_STOCK_ДЛИННАЯ_СЕРЕБРЯНАЯ_ЛОЖКА
	);
 --Архипелаг ГУЛАГ
	INSERT INTO AUTHOR_STOCK VALUES (
		AUTHOR_STOCK_SEQ.NEXTVAL,
		V_ID_AUTHORS_АЛЕКСАНДР_СОЛЖЕНИЦЫН,
		V_ID_STOCK_ГУЛАГ
	);
 --Собачье сердце
	INSERT INTO AUTHOR_STOCK VALUES (
		AUTHOR_STOCK_SEQ.NEXTVAL,
		V_ID_AUTHORS_МИХАИЛ_БУЛГАКОВ,
		V_ID_STOCK_СОБАЧЬЕ_СЕРДЦЕ
	);
 ---------------------------------------------------------------------------------------------------------------------------------------------------
 --Genres
	INSERT INTO GENRES VALUES (
		GENRES_SEQ.NEXTVAL,
		'Драма'
	) RETURNING ID INTO V_ID_GENRES_ДРАМА;
	INSERT INTO GENRES VALUES (
		GENRES_SEQ.NEXTVAL,
		'Роман'
	) RETURNING ID INTO V_ID_GENRES_РОМАН;
	INSERT INTO GENRES VALUES (
		GENRES_SEQ.NEXTVAL,
		'Фантастика'
	) RETURNING ID INTO V_ID_GENRES_ФАНТАСТИКА;
	INSERT INTO GENRES VALUES (
		GENRES_SEQ.NEXTVAL,
		'Поэзия'
	) RETURNING ID INTO V_ID_GENRES_ПОЭЗИЯ;
	INSERT INTO GENRES VALUES (
		GENRES_SEQ.NEXTVAL,
		'Сатира'
	) RETURNING ID INTO V_ID_GENRES_САТИРА;
	INSERT INTO GENRES VALUES (
		GENRES_SEQ.NEXTVAL,
		'Приключения'
	) RETURNING ID INTO V_ID_GENRES_ПРИКЛЮЧЕНИЯ;
	INSERT INTO GENRES VALUES (
		GENRES_SEQ.NEXTVAL,
		'Проза'
	) RETURNING ID INTO V_ID_GENRES_ПРОЗА;
	INSERT INTO GENRES VALUES (
		GENRES_SEQ.NEXTVAL,
		'Фэнтези'
	) RETURNING ID INTO V_ID_GENRES_ФЭНТЕЗИ;
	INSERT INTO GENRES VALUES (
		GENRES_SEQ.NEXTVAL,
		'Детектив'
	) RETURNING ID INTO V_ID_GENRES_ДЕТЕКТИВ;
	INSERT INTO GENRES VALUES (
		GENRES_SEQ.NEXTVAL,
		'Эротика'
	) RETURNING ID INTO V_ID_GENRES_ЭРОТИКА;
	INSERT INTO GENRES VALUES (
		GENRES_SEQ.NEXTVAL,
		'Триллер'
	) RETURNING ID INTO V_ID_GENRES_ТРИЛЛЕР;
	INSERT INTO GENRES VALUES (
		GENRES_SEQ.NEXTVAL,
		'Публицистика'
	) RETURNING ID INTO V_ID_GENRES_ПУБЛИЦИСТИКА;
 ------------------------------------------------------------------------------------------------
 --Genres_stock--
 --Один день Ивана Денисовича
	INSERT INTO GENRE_STOCK VALUES (
		GENRE_STOCK_SEQ.NEXTVAL,
		V_ID_GENRES_РОМАН,
		V_ID_STOCK_ОДИН_ДЕНЬ
	);
 --Евгений Онегин
	INSERT INTO GENRE_STOCK VALUES (
		GENRE_STOCK_SEQ.NEXTVAL,
		V_ID_GENRES_ПОЭЗИЯ,
		V_ID_STOCK_ЕВГЕНИЙ_ОНЕГИН
	);
 --Скотный двор
	INSERT INTO GENRE_STOCK VALUES (
		GENRE_STOCK_SEQ.NEXTVAL,
		V_ID_GENRES_САТИРА,
		V_ID_STOCK_СКОТНЫЙ_ДВОР
	);
 --Война и мир
	INSERT INTO GENRE_STOCK VALUES (
		GENRE_STOCK_SEQ.NEXTVAL,
		V_ID_GENRES_РОМАН,
		V_ID_STOCK_ВОЙНА_МИР
	);
	INSERT INTO GENRE_STOCK VALUES (
		GENRE_STOCK_SEQ.NEXTVAL,
		V_ID_GENRES_ПРОЗА,
		V_ID_STOCK_ВОЙНА_МИР
	);
 --Одноэтажная Америка
	INSERT INTO GENRE_STOCK VALUES (
		GENRE_STOCK_SEQ.NEXTVAL,
		V_ID_GENRES_ПУБЛИЦИСТИКА,
		V_ID_STOCK_ОДНОЭТАЖНАЯ_АМЕРИКА
	);
 --Длинная серебряная ложка
	INSERT INTO GENRE_STOCK VALUES (
		GENRE_STOCK_SEQ.NEXTVAL,
		V_ID_GENRES_ПРИКЛЮЧЕНИЯ,
		V_ID_STOCK_ДЛИННАЯ_СЕРЕБРЯНАЯ_ЛОЖКА
	);
 --Архипелаг ГУЛАГ
	INSERT INTO GENRE_STOCK VALUES (
		GENRE_STOCK_SEQ.NEXTVAL,
		V_ID_GENRES_РОМАН,
		V_ID_STOCK_ГУЛАГ
	);
 --Архипелаг ГУЛАГ
	INSERT INTO GENRE_STOCK VALUES (
		GENRE_STOCK_SEQ.NEXTVAL,
		V_ID_GENRES_САТИРА,
		V_ID_STOCK_ГУЛАГ
	);
 --Собачье сердце
	INSERT INTO GENRE_STOCK VALUES (
		GENRE_STOCK_SEQ.NEXTVAL,
		V_ID_GENRES_ФАНТАСТИКА,
		V_ID_STOCK_СОБАЧЬЕ_СЕРДЦЕ
	);
 ---------------------------------------------------------------------------------------------------------------------------------------------------
 --Tags--
	INSERT INTO TAGS VALUES (
		TAGS_SEQ.NEXTVAL,
		'ГУЛАГ'
	) RETURNING ID INTO V_ID_TAGS_ГУЛАГ;
	INSERT INTO TAGS VALUES (
		TAGS_SEQ.NEXTVAL,
		'Лауреаты Нобелевской премии'
	) RETURNING ID INTO V_ID_TAGS_ЛАУРЕАТЫ_НОБЕЛЕВСКОЙ;
	INSERT INTO TAGS VALUES (
		TAGS_SEQ.NEXTVAL,
		'Русская классика'
	) RETURNING ID INTO V_ID_TAGS_РУССКАЯ_КЛАССИКА;
	INSERT INTO TAGS VALUES (
		TAGS_SEQ.NEXTVAL,
		'Политическая сатира'
	) RETURNING ID INTO V_ID_TAGS_ПОЛИТИЧЕСКАЯ_САТИРА;
	INSERT INTO TAGS VALUES (
		TAGS_SEQ.NEXTVAL,
		'Зарубежная классика'
	) RETURNING ID INTO V_ID_TAGS_ЗАРУБЕЖНАЯ_КЛАССИКА;
	INSERT INTO TAGS VALUES (
		TAGS_SEQ.NEXTVAL,
		'Любовные'
	) RETURNING ID INTO V_ID_TAGS_ЛЮБОВНЫЕ;
	INSERT INTO TAGS VALUES (
		TAGS_SEQ.NEXTVAL,
		'Автобиография'
	) RETURNING ID INTO V_ID_TAGS_АВТОБИОГРАФИЯ;
	INSERT INTO TAGS VALUES (
		TAGS_SEQ.NEXTVAL,
		'Черный юмор'
	) RETURNING ID INTO V_ID_TAGS_ЧЕРНЫЙ;
	INSERT INTO TAGS VALUES (
		TAGS_SEQ.NEXTVAL,
		'Философская'
	) RETURNING ID INTO V_ID_TAGS_ФИЛОСОФСКАЯ;
 ---------------------------------------------------------------------------------------------------------------------------------------------------
 --Tag_stock--
	INSERT INTO TAG_STOCK VALUES (
		TAG_STOCK_SEQ.NEXTVAL,
		V_ID_TAGS_РУССКАЯ_КЛАССИКА,
		V_ID_STOCK_ОДИН_ДЕНЬ
	);
	INSERT INTO TAG_STOCK VALUES (
		TAG_STOCK_SEQ.NEXTVAL,
		V_ID_TAGS_ПОЛИТИЧЕСКАЯ_САТИРА,
		V_ID_STOCK_ОДИН_ДЕНЬ
	);
	INSERT INTO TAG_STOCK VALUES (
		TAG_STOCK_SEQ.NEXTVAL,
		V_ID_TAGS_РУССКАЯ_КЛАССИКА,
		V_ID_STOCK_ЕВГЕНИЙ_ОНЕГИН
	);
	INSERT INTO TAG_STOCK VALUES (
		TAG_STOCK_SEQ.NEXTVAL,
		V_ID_TAGS_ПОЛИТИЧЕСКАЯ_САТИРА,
		V_ID_STOCK_СКОТНЫЙ_ДВОР
	);
	INSERT INTO TAG_STOCK VALUES (
		TAG_STOCK_SEQ.NEXTVAL,
		V_ID_TAGS_ЗАРУБЕЖНАЯ_КЛАССИКА,
		V_ID_STOCK_СКОТНЫЙ_ДВОР
	);
	INSERT INTO TAG_STOCK VALUES (
		TAG_STOCK_SEQ.NEXTVAL,
		V_ID_TAGS_ЛЮБОВНЫЕ,
		V_ID_STOCK_ВОЙНА_МИР
	);
	INSERT INTO TAG_STOCK VALUES (
		TAG_STOCK_SEQ.NEXTVAL,
		V_ID_TAGS_РУССКАЯ_КЛАССИКА,
		V_ID_STOCK_ВОЙНА_МИР
	);
	INSERT INTO TAG_STOCK VALUES (
		TAG_STOCK_SEQ.NEXTVAL,
		V_ID_TAGS_АВТОБИОГРАФИЯ,
		V_ID_STOCK_ОДНОЭТАЖНАЯ_АМЕРИКА
	);
	INSERT INTO TAG_STOCK VALUES (
		TAG_STOCK_SEQ.NEXTVAL,
		V_ID_TAGS_ЧЕРНЫЙ,
		V_ID_STOCK_ОДНОЭТАЖНАЯ_АМЕРИКА
	);
	INSERT INTO TAG_STOCK VALUES (
		TAG_STOCK_SEQ.NEXTVAL,
		V_ID_TAGS_ЧЕРНЫЙ,
		V_ID_STOCK_ДЛИННАЯ_СЕРЕБРЯНАЯ_ЛОЖКА
	);
	INSERT INTO TAG_STOCK VALUES (
		TAG_STOCK_SEQ.NEXTVAL,
		V_ID_TAGS_ГУЛАГ,
		V_ID_STOCK_ГУЛАГ
	);
	INSERT INTO TAG_STOCK VALUES (
		TAG_STOCK_SEQ.NEXTVAL,
		V_ID_TAGS_ФИЛОСОФСКАЯ,
		V_ID_STOCK_СОБАЧЬЕ_СЕРДЦЕ
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
 ---------------------------------------------------------------------------------------------------------------------------------------------------,
 --READERS
	INSERT INTO READERS (
		LIBRARY_CARD,
		NAME,
		SURNAME,
		BIRTHD_DATE,
		RATING,
		SEX,
		BLACK_LIST,
		MONEY,
		REGISTRATION_DATE
	) VALUES (
		READERS_SEQ.NEXTVAL,
		'Кирилл',
		'Овчинников',
		TO_DATE('1973-6-27 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),
		503,
		0,
		0,
		1887,
		SYSDATE
	);
	INSERT INTO READERS (
		LIBRARY_CARD,
		NAME,
		SURNAME,
		BIRTHD_DATE,
		RATING,
		SEX,
		BLACK_LIST,
		MONEY,
		REGISTRATION_DATE
	) VALUES (
		READERS_SEQ.NEXTVAL,
		'Ульяна',
		'Соболева',
		TO_DATE('2003-3-9 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),
		382,
		2,
		0,
		348,
		SYSDATE
	);
	INSERT INTO READERS (
		LIBRARY_CARD,
		NAME,
		SURNAME,
		BIRTHD_DATE,
		RATING,
		SEX,
		BLACK_LIST,
		MONEY,
		REGISTRATION_DATE
	) VALUES (
		READERS_SEQ.NEXTVAL,
		'Марк',
		'Семенов',
		TO_DATE('1991-8-5 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),
		356,
		2,
		1,
		1003,
		SYSDATE
	);
	INSERT INTO READERS (
		LIBRARY_CARD,
		NAME,
		SURNAME,
		BIRTHD_DATE,
		RATING,
		SEX,
		BLACK_LIST,
		MONEY,
		REGISTRATION_DATE
	) VALUES (
		READERS_SEQ.NEXTVAL,
		'Варвара',
		'Гладкова',
		TO_DATE('1995-4-4 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),
		95,
		0,
		1,
		1091,
		SYSDATE
	);
	INSERT INTO READERS (
		LIBRARY_CARD,
		NAME,
		SURNAME,
		BIRTHD_DATE,
		RATING,
		SEX,
		BLACK_LIST,
		MONEY,
		REGISTRATION_DATE
	) VALUES (
		READERS_SEQ.NEXTVAL,
		'Дмитрий',
		'Климов',
		TO_DATE('2000-7-17 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),
		988,
		0,
		0,
		48,
		SYSDATE
	);
	INSERT INTO READERS (
		LIBRARY_CARD,
		NAME,
		SURNAME,
		BIRTHD_DATE,
		RATING,
		SEX,
		BLACK_LIST,
		MONEY,
		REGISTRATION_DATE
	) VALUES (
		READERS_SEQ.NEXTVAL,
		'Аделина',
		'Пономарева',
		TO_DATE('1996-8-17 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),
		987,
		2,
		1,
		161,
		SYSDATE
	);
	INSERT INTO READERS (
		LIBRARY_CARD,
		NAME,
		SURNAME,
		BIRTHD_DATE,
		RATING,
		SEX,
		BLACK_LIST,
		MONEY,
		REGISTRATION_DATE
	) VALUES (
		READERS_SEQ.NEXTVAL,
		'Игорь',
		'Цветков',
		TO_DATE('1985-2-7 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),
		182,
		9,
		0,
		1638,
		SYSDATE
	);
	INSERT INTO READERS (
		LIBRARY_CARD,
		NAME,
		SURNAME,
		BIRTHD_DATE,
		RATING,
		SEX,
		BLACK_LIST,
		MONEY,
		REGISTRATION_DATE
	) VALUES (
		READERS_SEQ.NEXTVAL,
		'Вероника',
		'Андреева',
		TO_DATE('1992-11-11 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),
		411,
		9,
		1,
		1664,
		SYSDATE
	);
	INSERT INTO READERS (
		LIBRARY_CARD,
		NAME,
		SURNAME,
		BIRTHD_DATE,
		RATING,
		SEX,
		BLACK_LIST,
		MONEY,
		REGISTRATION_DATE
	) VALUES (
		READERS_SEQ.NEXTVAL,
		'Тимур',
		'Семенов',
		TO_DATE('1950-8-9 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),
		746,
		2,
		1,
		1995,
		SYSDATE
	);
	INSERT INTO READERS (
		LIBRARY_CARD,
		NAME,
		SURNAME,
		BIRTHD_DATE,
		RATING,
		SEX,
		BLACK_LIST,
		MONEY,
		REGISTRATION_DATE
	) VALUES (
		READERS_SEQ.NEXTVAL,
		'Кристина',
		'Черныха',
		TO_DATE('1964-10-11 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),
		963,
		2,
		0,
		501,
		SYSDATE
	);
	INSERT INTO READERS (
		LIBRARY_CARD,
		NAME,
		SURNAME,
		BIRTHD_DATE,
		RATING,
		SEX,
		BLACK_LIST,
		MONEY,
		REGISTRATION_DATE
	) VALUES (
		READERS_SEQ.NEXTVAL,
		'Юрий',
		'Савельев',
		TO_DATE('2007-4-21 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),
		29,
		0,
		1,
		172,
		SYSDATE
	);
	INSERT INTO READERS (
		LIBRARY_CARD,
		NAME,
		SURNAME,
		BIRTHD_DATE,
		RATING,
		SEX,
		BLACK_LIST,
		MONEY,
		REGISTRATION_DATE
	) VALUES (
		READERS_SEQ.NEXTVAL,
		'Маргарита',
		'Матвеева',
		TO_DATE('1951-6-12 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),
		609,
		0,
		0,
		1822,
		SYSDATE
	);
	INSERT INTO READERS (
		LIBRARY_CARD,
		NAME,
		SURNAME,
		BIRTHD_DATE,
		RATING,
		SEX,
		BLACK_LIST,
		MONEY,
		REGISTRATION_DATE
	) VALUES (
		READERS_SEQ.NEXTVAL,
		'Юрий',
		'Артемов',
		TO_DATE('1955-4-19 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),
		498,
		1,
		1,
		1436,
		SYSDATE
	);
	INSERT INTO READERS (
		LIBRARY_CARD,
		NAME,
		SURNAME,
		BIRTHD_DATE,
		RATING,
		SEX,
		BLACK_LIST,
		MONEY,
		REGISTRATION_DATE
	) VALUES (
		READERS_SEQ.NEXTVAL,
		'Кристина',
		'Матвеева',
		TO_DATE('2005-9-22 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),
		51,
		2,
		0,
		1375,
		SYSDATE
	);
	INSERT INTO READERS (
		LIBRARY_CARD,
		NAME,
		SURNAME,
		BIRTHD_DATE,
		RATING,
		SEX,
		BLACK_LIST,
		MONEY,
		REGISTRATION_DATE
	) VALUES (
		READERS_SEQ.NEXTVAL,
		'Алексей',
		'Новиков',
		TO_DATE('1990-5-6 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),
		697,
		1,
		0,
		553,
		SYSDATE
	);
	INSERT INTO READERS (
		LIBRARY_CARD,
		NAME,
		SURNAME,
		BIRTHD_DATE,
		RATING,
		SEX,
		BLACK_LIST,
		MONEY,
		REGISTRATION_DATE
	) VALUES (
		READERS_SEQ.NEXTVAL,
		'Арина',
		'Белоусова',
		TO_DATE('1975-4-28 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),
		795,
		9,
		0,
		704,
		SYSDATE
	);
	INSERT INTO READERS (
		LIBRARY_CARD,
		NAME,
		SURNAME,
		BIRTHD_DATE,
		RATING,
		SEX,
		BLACK_LIST,
		MONEY,
		REGISTRATION_DATE
	) VALUES (
		READERS_SEQ.NEXTVAL,
		'Тимофей',
		'Осипов',
		TO_DATE('1990-10-14 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),
		660,
		9,
		0,
		703,
		SYSDATE
	);
	INSERT INTO READERS (
		LIBRARY_CARD,
		NAME,
		SURNAME,
		BIRTHD_DATE,
		RATING,
		SEX,
		BLACK_LIST,
		MONEY,
		REGISTRATION_DATE
	) VALUES (
		READERS_SEQ.NEXTVAL,
		'Мелания',
		'Цветкова',
		TO_DATE('1978-6-10 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),
		155,
		9,
		0,
		1959,
		SYSDATE
	);
	INSERT INTO READERS (
		LIBRARY_CARD,
		NAME,
		SURNAME,
		BIRTHD_DATE,
		RATING,
		SEX,
		BLACK_LIST,
		MONEY,
		REGISTRATION_DATE
	) VALUES (
		READERS_SEQ.NEXTVAL,
		'Давид',
		'Иванов',
		TO_DATE('1995-10-20 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),
		655,
		2,
		0,
		1926,
		SYSDATE
	);
	INSERT INTO READERS (
		LIBRARY_CARD,
		NAME,
		SURNAME,
		BIRTHD_DATE,
		RATING,
		SEX,
		BLACK_LIST,
		MONEY,
		REGISTRATION_DATE
	) VALUES (
		READERS_SEQ.NEXTVAL,
		'Светлана',
		'Фокина',
		TO_DATE('1953-8-21 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),
		497,
		9,
		1,
		884,
		SYSDATE
	);
	INSERT INTO READERS (
		LIBRARY_CARD,
		NAME,
		SURNAME,
		BIRTHD_DATE,
		RATING,
		SEX,
		BLACK_LIST,
		MONEY,
		REGISTRATION_DATE
	) VALUES (
		READERS_SEQ.NEXTVAL,
		'Руслан',
		'Осипов',
		TO_DATE('1974-2-11 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),
		674,
		2,
		0,
		1054,
		SYSDATE
	);
	INSERT INTO READERS (
		LIBRARY_CARD,
		NAME,
		SURNAME,
		BIRTHD_DATE,
		RATING,
		SEX,
		BLACK_LIST,
		MONEY,
		REGISTRATION_DATE
	) VALUES (
		READERS_SEQ.NEXTVAL,
		'Арина',
		'Яковлева',
		TO_DATE('1965-7-11 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),
		620,
		2,
		1,
		120,
		SYSDATE
	);
	INSERT INTO READERS (
		LIBRARY_CARD,
		NAME,
		SURNAME,
		BIRTHD_DATE,
		RATING,
		SEX,
		BLACK_LIST,
		MONEY,
		REGISTRATION_DATE
	) VALUES (
		READERS_SEQ.NEXTVAL,
		'Артём',
		'Лосев',
		TO_DATE('1977-7-26 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),
		235,
		9,
		0,
		718,
		SYSDATE
	);
	INSERT INTO READERS (
		LIBRARY_CARD,
		NAME,
		SURNAME,
		BIRTHD_DATE,
		RATING,
		SEX,
		BLACK_LIST,
		MONEY,
		REGISTRATION_DATE
	) VALUES (
		READERS_SEQ.NEXTVAL,
		'Мила',
		'Лебедева',
		TO_DATE('2001-3-16 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),
		404,
		1,
		0,
		152,
		SYSDATE
	);
	INSERT INTO READERS (
		LIBRARY_CARD,
		NAME,
		SURNAME,
		BIRTHD_DATE,
		RATING,
		SEX,
		BLACK_LIST,
		MONEY,
		REGISTRATION_DATE
	) VALUES (
		READERS_SEQ.NEXTVAL,
		'Ярослав',
		'Осипов',
		TO_DATE('1947-10-27 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),
		832,
		2,
		0,
		864,
		SYSDATE
	);
	INSERT INTO READERS (
		LIBRARY_CARD,
		NAME,
		SURNAME,
		BIRTHD_DATE,
		RATING,
		SEX,
		BLACK_LIST,
		MONEY,
		REGISTRATION_DATE
	) VALUES (
		READERS_SEQ.NEXTVAL,
		'Диана',
		'Андреева',
		TO_DATE('1956-1-21 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),
		208,
		0,
		1,
		1924,
		SYSDATE
	);
	INSERT INTO READERS (
		LIBRARY_CARD,
		NAME,
		SURNAME,
		BIRTHD_DATE,
		RATING,
		SEX,
		BLACK_LIST,
		MONEY,
		REGISTRATION_DATE
	) VALUES (
		READERS_SEQ.NEXTVAL,
		'Алексей',
		'Сухов',
		TO_DATE('1993-8-19 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),
		394,
		9,
		0,
		1668,
		SYSDATE
	);
	INSERT INTO READERS (
		LIBRARY_CARD,
		NAME,
		SURNAME,
		BIRTHD_DATE,
		RATING,
		SEX,
		BLACK_LIST,
		MONEY,
		REGISTRATION_DATE
	) VALUES (
		READERS_SEQ.NEXTVAL,
		'Ярослава',
		'Цветкова',
		TO_DATE('2007-1-25 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),
		532,
		2,
		0,
		1213,
		SYSDATE
	);
	INSERT INTO READERS (
		LIBRARY_CARD,
		NAME,
		SURNAME,
		BIRTHD_DATE,
		RATING,
		SEX,
		BLACK_LIST,
		MONEY,
		REGISTRATION_DATE
	) VALUES (
		READERS_SEQ.NEXTVAL,
		'Арсений',
		'Кудряшов',
		TO_DATE('1981-9-15 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),
		240,
		2,
		1,
		502,
		SYSDATE
	);
	INSERT INTO READERS (
		LIBRARY_CARD,
		NAME,
		SURNAME,
		BIRTHD_DATE,
		RATING,
		SEX,
		BLACK_LIST,
		MONEY,
		REGISTRATION_DATE
	) VALUES (
		READERS_SEQ.NEXTVAL,
		'Нина',
		'Цветкова',
		TO_DATE('1984-11-17 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),
		660,
		0,
		1,
		1584,
		SYSDATE
	);
	INSERT INTO READERS (
		LIBRARY_CARD,
		NAME,
		SURNAME,
		BIRTHD_DATE,
		RATING,
		SEX,
		BLACK_LIST,
		MONEY,
		REGISTRATION_DATE
	) VALUES (
		READERS_SEQ.NEXTVAL,
		'Платон',
		'Овчинников',
		TO_DATE('1949-6-9 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),
		634,
		2,
		0,
		1283,
		SYSDATE
	);
	INSERT INTO READERS (
		LIBRARY_CARD,
		NAME,
		SURNAME,
		BIRTHD_DATE,
		RATING,
		SEX,
		BLACK_LIST,
		MONEY,
		REGISTRATION_DATE
	) VALUES (
		READERS_SEQ.NEXTVAL,
		'Яна',
		'Агафонова',
		TO_DATE('2000-1-17 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),
		881,
		9,
		0,
		767,
		SYSDATE
	);
	INSERT INTO READERS (
		LIBRARY_CARD,
		NAME,
		SURNAME,
		BIRTHD_DATE,
		RATING,
		SEX,
		BLACK_LIST,
		MONEY,
		REGISTRATION_DATE
	) VALUES (
		READERS_SEQ.NEXTVAL,
		'Кирилл',
		'Егоров',
		TO_DATE('1988-9-25 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),
		305,
		0,
		0,
		231,
		SYSDATE
	);
	INSERT INTO READERS (
		LIBRARY_CARD,
		NAME,
		SURNAME,
		BIRTHD_DATE,
		RATING,
		SEX,
		BLACK_LIST,
		MONEY,
		REGISTRATION_DATE
	) VALUES (
		READERS_SEQ.NEXTVAL,
		'Елизавета',
		'Фокина',
		TO_DATE('2007-9-13 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),
		625,
		9,
		1,
		929,
		SYSDATE
	);
	INSERT INTO READERS (
		LIBRARY_CARD,
		NAME,
		SURNAME,
		BIRTHD_DATE,
		RATING,
		SEX,
		BLACK_LIST,
		MONEY,
		REGISTRATION_DATE
	) VALUES (
		READERS_SEQ.NEXTVAL,
		'Леонид',
		'Семенов',
		TO_DATE('1995-4-28 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),
		935,
		2,
		0,
		632,
		SYSDATE
	);
	INSERT INTO READERS (
		LIBRARY_CARD,
		NAME,
		SURNAME,
		BIRTHD_DATE,
		RATING,
		SEX,
		BLACK_LIST,
		MONEY,
		REGISTRATION_DATE
	) VALUES (
		READERS_SEQ.NEXTVAL,
		'Мирослава',
		'Масленникова',
		TO_DATE('1946-3-31 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),
		206,
		1,
		0,
		1289,
		SYSDATE
	);
	INSERT INTO READERS (
		LIBRARY_CARD,
		NAME,
		SURNAME,
		BIRTHD_DATE,
		RATING,
		SEX,
		BLACK_LIST,
		MONEY,
		REGISTRATION_DATE
	) VALUES (
		READERS_SEQ.NEXTVAL,
		'Адам',
		'Семенов',
		TO_DATE('1948-12-11 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),
		385,
		9,
		0,
		765,
		SYSDATE
	);
	INSERT INTO READERS (
		LIBRARY_CARD,
		NAME,
		SURNAME,
		BIRTHD_DATE,
		RATING,
		SEX,
		BLACK_LIST,
		MONEY,
		REGISTRATION_DATE
	) VALUES (
		READERS_SEQ.NEXTVAL,
		'Ангелина',
		'Белоусова',
		TO_DATE('1992-10-8 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),
		648,
		1,
		0,
		559,
		SYSDATE
	);
	INSERT INTO READERS (
		LIBRARY_CARD,
		NAME,
		SURNAME,
		BIRTHD_DATE,
		RATING,
		SEX,
		BLACK_LIST,
		MONEY,
		REGISTRATION_DATE
	) VALUES (
		READERS_SEQ.NEXTVAL,
		'Антон',
		'Рожков',
		TO_DATE('1957-3-1 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),
		117,
		0,
		0,
		1266,
		SYSDATE
	);
	INSERT INTO READERS (
		LIBRARY_CARD,
		NAME,
		SURNAME,
		BIRTHD_DATE,
		RATING,
		SEX,
		BLACK_LIST,
		MONEY,
		REGISTRATION_DATE
	) VALUES (
		READERS_SEQ.NEXTVAL,
		'Анна',
		'Агафонова',
		TO_DATE('1968-6-7 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),
		174,
		2,
		0,
		1620,
		SYSDATE
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
END;