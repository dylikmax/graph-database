USE master;
DROP DATABASE IF EXISTS Tourism;
CREATE DATABASE Tourism;
USE Tourism;

CREATE TABLE Tourist
(
id INT NOT NULL PRIMARY KEY,
name NVARCHAR(50) NOT NULL,
surname NVARCHAR(50) NOT NULL,
gender CHAR(1) NOT NULL,
birth_date DATE NOT NULL
) AS NODE;

CREATE TABLE Country
(
id INT NOT NULL PRIMARY KEY,
name NVARCHAR(50) NOT NULL,
population INT NOT NULL
) AS NODE;

CREATE TABLE City
(
id INT NOT NULL PRIMARY KEY,
name NVARCHAR(50) NOT NULL,
) AS NODE;

CREATE TABLE Tour
(
id INT NOT NULL PRIMARY KEY,
name NVARCHAR(50) NOT NULL,
cost MONEY NOT NULL
) AS NODE;

CREATE TABLE SituatedIn AS EDGE;

CREATE TABLE LivesIn AS EDGE;

CREATE TABLE IncludedInTour AS EDGE;

CREATE TABLE GoesToTour (tour_date DATE) AS EDGE;

CREATE TABLE FriendOf AS EDGE;

ALTER TABLE SituatedIn
ADD CONSTRAINT EC_SituatedIn CONNECTION (City TO Country);

ALTER TABLE LivesIn
ADD CONSTRAINT EC_LivesIn CONNECTION (Tourist TO Country);

ALTER TABLE IncludedInTour
ADD CONSTRAINT EC_IncludedInTour CONNECTION (City TO Tour);

ALTER TABLE GoesToTour
ADD CONSTRAINT EC_GoesToTour CONNECTION (Tourist TO Tour);

ALTER TABLE FriendOf
ADD CONSTRAINT EC_FriendOf CONNECTION (Tourist TO Tourist);

INSERT INTO Tourist (id, name, surname, gender, birth_date) VALUES
(1, 'Алексей', 'Иванов', 'M', '1990-05-12'),
(2, 'Джон', 'Смит', 'M', '1985-07-23'),
(3, 'Елена', 'Петрова', 'F', '1992-03-15'),
(4, 'Сьюзен', 'Джонсон', 'F', '1988-11-30'),
(5, 'Марко', 'Росси', 'M', '1980-01-05'),
(6, 'Ир Ын', 'Ким', 'F', '1995-06-18'),
(7, 'Жан Поль', 'Дюпон', 'M', '1983-12-10'),
(8, 'Кристофер', 'Мартин', 'M', '1991-09-25'),
(9, 'Вадим', 'Сидоров', 'M', '1979-04-20'),
(10, 'Моника', 'Ли', 'F', '1994-08-14');

INSERT INTO Country (id, name, population) VALUES
(1, 'Испания', 47000000),
(2, 'Франция', 65000000),
(4, 'Италия', 60000000),
(3, 'Германия', 84000000),
(5, 'Великобритания', 67000000),
(7, 'США', 331000000),
(8, 'Россия', 146000000),
(10, 'Южная корея', 52000000),
(9, 'Япония', 125000000),
(6, 'Египет', 104000000)

INSERT INTO City (id, name) VALUES
(1, 'Лондон'),
(2, 'Оксфорд'),
(3, 'Париж'),
(4, 'Марсель'),
(5, 'Мадрид'),
(6, 'Рим'),
(7, 'Милан'),
(8, 'Берлин'),
(9, 'Хургада'),
(10, 'Шерм-Эль-Шейх'),
(11, 'Лоc-Анжелес'),
(12, 'Лас-Вегас'),
(13, 'Нью-Йорк'),
(14, 'Москва'),
(15, 'Санкт-Петербург'),
(16, 'Токио'),
(17, 'Сеул')

INSERT INTO Tour (id, name, cost) VALUES
(1, 'Культурная столица', 3700),
(2, 'Классика Европы', 5600),
(3, 'Солнечные берега', 8900),
(4, 'Вечный город', 4300),
(5, 'Загадочный восток', 6000),
(6, 'Город на воде', 3200),
(7, 'Через всю Европу', 13800),
(8, 'Города Америки', 6900),
(9, 'Столица моды', 4300),
(10, 'Исторические маршруты', 2100)

INSERT INTO SituatedIn ($from_id, $to_id)
VALUES ((SELECT $node_id FROM City WHERE id = 1),
 (SELECT $node_id FROM Country WHERE id = 5)),
 ((SELECT $node_id FROM City WHERE id = 2),
 (SELECT $node_id FROM Country WHERE id = 5)),
 ((SELECT $node_id FROM City WHERE id = 3),
 (SELECT $node_id FROM Country WHERE id = 2)),
 ((SELECT $node_id FROM City WHERE id = 4),
 (SELECT $node_id FROM Country WHERE id = 2)),
 ((SELECT $node_id FROM City WHERE id = 5),
 (SELECT $node_id FROM Country WHERE id = 1)),
 ((SELECT $node_id FROM City WHERE id = 6),
 (SELECT $node_id FROM Country WHERE id = 4)),
 ((SELECT $node_id FROM City WHERE id = 7),
 (SELECT $node_id FROM Country WHERE id = 4)),
 ((SELECT $node_id FROM City WHERE id = 8),
 (SELECT $node_id FROM Country WHERE id = 3)),
 ((SELECT $node_id FROM City WHERE id = 9),
 (SELECT $node_id FROM Country WHERE id = 6)),
 ((SELECT $node_id FROM City WHERE id = 10),
 (SELECT $node_id FROM Country WHERE id = 6)),
 ((SELECT $node_id FROM City WHERE id = 11),
 (SELECT $node_id FROM Country WHERE id = 7)),
 ((SELECT $node_id FROM City WHERE id = 12),
 (SELECT $node_id FROM Country WHERE id = 7)),
 ((SELECT $node_id FROM City WHERE id = 13),
 (SELECT $node_id FROM Country WHERE id = 7)),
 ((SELECT $node_id FROM City WHERE id = 14),
 (SELECT $node_id FROM Country WHERE id = 8)),
 ((SELECT $node_id FROM City WHERE id = 15),
 (SELECT $node_id FROM Country WHERE id = 8)),
 ((SELECT $node_id FROM City WHERE id = 16),
 (SELECT $node_id FROM Country WHERE id = 9)),
 ((SELECT $node_id FROM City WHERE id = 17),
 (SELECT $node_id FROM Country WHERE id = 10))

INSERT INTO LivesIn ($from_id, $to_id)
VALUES ((SELECT $node_id FROM Tourist WHERE id = 1),
 (SELECT $node_id FROM Country WHERE id = 8)),
 ((SELECT $node_id FROM Tourist WHERE id = 2),
 (SELECT $node_id FROM Country WHERE id = 5)),
 ((SELECT $node_id FROM Tourist WHERE id = 3),
 (SELECT $node_id FROM Country WHERE id = 8)),
 ((SELECT $node_id FROM Tourist WHERE id = 4),
 (SELECT $node_id FROM Country WHERE id = 7)),
 ((SELECT $node_id FROM Tourist WHERE id = 5),
 (SELECT $node_id FROM Country WHERE id = 4)),
 ((SELECT $node_id FROM Tourist WHERE id = 6),
 (SELECT $node_id FROM Country WHERE id = 10)),
 ((SELECT $node_id FROM Tourist WHERE id = 7),
 (SELECT $node_id FROM Country WHERE id = 2)),
 ((SELECT $node_id FROM Tourist WHERE id = 8),
 (SELECT $node_id FROM Country WHERE id = 7)),
((SELECT $node_id FROM Tourist WHERE id = 9),
 (SELECT $node_id FROM Country WHERE id = 8)),
 ((SELECT $node_id FROM Tourist WHERE id = 10),
 (SELECT $node_id FROM Country WHERE id = 4))

INSERT INTO IncludedInTour ($from_id, $to_id)
VALUES ((SELECT $node_id FROM City WHERE id = 8),
(SELECT $node_id FROM Tour WHERE id = 1)),
((SELECT $node_id FROM City WHERE id = 14),
(SELECT $node_id FROM Tour WHERE id = 1)),
((SELECT $node_id FROM City WHERE id = 15),
(SELECT $node_id FROM Tour WHERE id = 1)),
((SELECT $node_id FROM City WHERE id = 1),
(SELECT $node_id FROM Tour WHERE id = 2)),
((SELECT $node_id FROM City WHERE id = 2),
(SELECT $node_id FROM Tour WHERE id = 2)),
((SELECT $node_id FROM City WHERE id = 3),
(SELECT $node_id FROM Tour WHERE id = 2)),
((SELECT $node_id FROM City WHERE id = 5),
(SELECT $node_id FROM Tour WHERE id = 3)),
((SELECT $node_id FROM City WHERE id = 9),
 (SELECT $node_id FROM Tour WHERE id = 3)),
((SELECT $node_id FROM City WHERE id = 10),
(SELECT $node_id FROM Tour WHERE id = 3)),
((SELECT $node_id FROM City WHERE id = 6),
(SELECT $node_id FROM Tour WHERE id = 4)),
((SELECT $node_id FROM City WHERE id = 16),
(SELECT $node_id FROM Tour WHERE id = 5)),
((SELECT $node_id FROM City WHERE id = 17),
(SELECT $node_id FROM Tour WHERE id = 5)),
((SELECT $node_id FROM City WHERE id = 15),
(SELECT $node_id FROM Tour WHERE id = 6)),
((SELECT $node_id FROM City WHERE id = 14),
(SELECT $node_id FROM Tour WHERE id = 7)),
((SELECT $node_id FROM City WHERE id = 8),
(SELECT $node_id FROM Tour WHERE id = 7)),
((SELECT $node_id FROM City WHERE id = 6),
(SELECT $node_id FROM Tour WHERE id = 7)),
((SELECT $node_id FROM City WHERE id = 5),
(SELECT $node_id FROM Tour WHERE id = 7)),
((SELECT $node_id FROM City WHERE id = 3),
(SELECT $node_id FROM Tour WHERE id = 7)),
((SELECT $node_id FROM City WHERE id = 1),
(SELECT $node_id FROM Tour WHERE id = 7)),
((SELECT $node_id FROM City WHERE id = 11),
(SELECT $node_id FROM Tour WHERE id = 8)),
((SELECT $node_id FROM City WHERE id = 12),
(SELECT $node_id FROM Tour WHERE id = 8)),
((SELECT $node_id FROM City WHERE id = 13),
(SELECT $node_id FROM Tour WHERE id = 8)),
((SELECT $node_id FROM City WHERE id = 3),
(SELECT $node_id FROM Tour WHERE id = 9)),
((SELECT $node_id FROM City WHERE id = 7),
(SELECT $node_id FROM Tour WHERE id = 9)),
((SELECT $node_id FROM City WHERE id = 3),
(SELECT $node_id FROM Tour WHERE id = 10)),
((SELECT $node_id FROM City WHERE id = 4),
(SELECT $node_id FROM Tour WHERE id = 10)),
((SELECT $node_id FROM City WHERE id = 5),
(SELECT $node_id FROM Tour WHERE id = 10))

INSERT INTO GoesToTour($from_id, $to_id, tour_date)
VALUES ((SELECT $node_id FROM Tourist WHERE id = 1),
(SELECT $node_id FROM Tour WHERE id = 3), '2004-03-15'),
((SELECT $node_id FROM Tourist WHERE id = 2),
(SELECT $node_id FROM Tour WHERE id = 4), '2004-05-14'),
((SELECT $node_id FROM Tourist WHERE id = 2),
(SELECT $node_id FROM Tour WHERE id = 9), '2004-04-12'),
((SELECT $node_id FROM Tourist WHERE id = 3),
(SELECT $node_id FROM Tour WHERE id = 3), '2004-10-15'),
((SELECT $node_id FROM Tourist WHERE id = 3),
(SELECT $node_id FROM Tour WHERE id = 7), '2004-10-08'),
((SELECT $node_id FROM Tourist WHERE id = 4),
(SELECT $node_id FROM Tour WHERE id = 1), '2004-09-11'),
((SELECT $node_id FROM Tourist WHERE id = 4),
(SELECT $node_id FROM Tour WHERE id = 5), '2004-08-05'),
((SELECT $node_id FROM Tourist WHERE id = 5),
(SELECT $node_id FROM Tour WHERE id = 6), '2004-03-11'),
((SELECT $node_id FROM Tourist WHERE id = 5),
(SELECT $node_id FROM Tour WHERE id = 8), '2007-03-18'),
((SELECT $node_id FROM Tourist WHERE id = 6),
(SELECT $node_id FROM Tour WHERE id = 10), '2007-01-11'),
((SELECT $node_id FROM Tourist WHERE id = 7),
(SELECT $node_id FROM Tour WHERE id = 2), '2008-04-08'),
((SELECT $node_id FROM Tourist WHERE id = 7),
(SELECT $node_id FROM Tour WHERE id = 5), '2010-03-13'),
((SELECT $node_id FROM Tourist WHERE id = 8),
(SELECT $node_id FROM Tour WHERE id = 4), '2010-01-25'),
((SELECT $node_id FROM Tourist WHERE id = 8),
(SELECT $node_id FROM Tour WHERE id = 9), '2011-12-11'),
((SELECT $node_id FROM Tourist WHERE id = 9),
(SELECT $node_id FROM Tour WHERE id = 1), '2013-07-06'),
((SELECT $node_id FROM Tourist WHERE id = 9),
(SELECT $node_id FROM Tour WHERE id = 8), '2013-03-28'),
((SELECT $node_id FROM Tourist WHERE id = 10),
(SELECT $node_id FROM Tour WHERE id = 1), '2014-04-12'),
((SELECT $node_id FROM Tourist WHERE id = 10),
(SELECT $node_id FROM Tour WHERE id = 7), '2014-12-01'),
((SELECT $node_id FROM Tourist WHERE id = 10),
(SELECT $node_id FROM Tour WHERE id = 8), '2018-03-15')

INSERT INTO FriendOf($from_id, $to_id)
VALUES ((SELECT $node_id FROM Tourist WHERE id = 1),
(SELECT $node_id FROM Tourist WHERE id = 6)),
((SELECT $node_id FROM Tourist WHERE id = 1),
(SELECT $node_id FROM Tourist WHERE id = 3)),
((SELECT $node_id FROM Tourist WHERE id = 1),
(SELECT $node_id FROM Tourist WHERE id = 9)),
((SELECT $node_id FROM Tourist WHERE id = 2),
(SELECT $node_id FROM Tourist WHERE id = 4)),
((SELECT $node_id FROM Tourist WHERE id = 2),
(SELECT $node_id FROM Tourist WHERE id = 6)),
((SELECT $node_id FROM Tourist WHERE id = 3),
(SELECT $node_id FROM Tourist WHERE id = 9)),
((SELECT $node_id FROM Tourist WHERE id = 4),
(SELECT $node_id FROM Tourist WHERE id = 8)),
((SELECT $node_id FROM Tourist WHERE id = 4),
(SELECT $node_id FROM Tourist WHERE id = 10)),
((SELECT $node_id FROM Tourist WHERE id = 5),
(SELECT $node_id FROM Tourist WHERE id = 8)),
((SELECT $node_id FROM Tourist WHERE id = 5),
(SELECT $node_id FROM Tourist WHERE id = 10)),
((SELECT $node_id FROM Tourist WHERE id = 6),
(SELECT $node_id FROM Tourist WHERE id = 7)),
((SELECT $node_id FROM Tourist WHERE id = 7),
(SELECT $node_id FROM Tourist WHERE id = 8)),
((SELECT $node_id FROM Tourist WHERE id = 6),
(SELECT $node_id FROM Tourist WHERE id = 1)),
((SELECT $node_id FROM Tourist WHERE id = 3),
(SELECT $node_id FROM Tourist WHERE id = 1)),
((SELECT $node_id FROM Tourist WHERE id = 9),
(SELECT $node_id FROM Tourist WHERE id = 1)),
((SELECT $node_id FROM Tourist WHERE id = 4),
(SELECT $node_id FROM Tourist WHERE id = 2)),
((SELECT $node_id FROM Tourist WHERE id = 6),
(SELECT $node_id FROM Tourist WHERE id = 2)),
((SELECT $node_id FROM Tourist WHERE id = 9),
(SELECT $node_id FROM Tourist WHERE id = 3)),
((SELECT $node_id FROM Tourist WHERE id = 8),
(SELECT $node_id FROM Tourist WHERE id = 4)),
((SELECT $node_id FROM Tourist WHERE id = 10),
(SELECT $node_id FROM Tourist WHERE id = 4)),
((SELECT $node_id FROM Tourist WHERE id = 8),
(SELECT $node_id FROM Tourist WHERE id = 5)),
((SELECT $node_id FROM Tourist WHERE id = 10),
(SELECT $node_id FROM Tourist WHERE id = 5)),
((SELECT $node_id FROM Tourist WHERE id = 7),
(SELECT $node_id FROM Tourist WHERE id = 6)),
((SELECT $node_id FROM Tourist WHERE id = 8),
(SELECT $node_id FROM Tourist WHERE id = 7))

-- 1. Определить, какие туристы участвовали в туре "Солнечные берега".
SELECT DISTINCT T.name AS [Имя], T.surname AS [Фамилия], tour_date AS [Дата поездки]
FROM Tourist AS T
, GoesToTour
, Tour
WHERE MATCH(T-(GoesToTour)->Tour)
AND Tour.name = N'Солнечные берега'

-- 2. Узнать, какие города находятся в Великобритании.
SELECT C.name AS [Название города]  
FROM City AS C
, situatedIn
, Country
WHERE MATCH(C-(situatedIn)->Country)
AND Country.name = N'Великобритания'

-- 3. Узнать, какие туры включают город Лондон.
SELECT T.name
FROM City AS C
, IncludedInTour
, Tour AS T
WHERE MATCH(C-(IncludedInTour)->T)
AND C.name = N'Лондон'

-- 4. Определить, кто из туристов проживает в России.
SELECT T.name, T.surname
FROM Tourist AS T
, LivesIn
, Country AS C
WHERE MATCH(T-(LivesIn)->C)
AND C.name = N'Россия'

-- 5. Определить все страны, где проживают туристы.
SELECT DISTINCT C.name
FROM Country AS C
, LivesIn
, Tourist AS T
WHERE MATCH(T-(LivesIn)->C)

-- 6. Найдите ближайший путь в сети друзей от Кристофера до Алексея и выведите количество шагов для перехода между ними.
SELECT [Имя человека], [Путь до другого человека], [Шагов]
FROM (
    SELECT
        Person1.name AS [Имя человека],
        STRING_AGG(Person2.name, '->') WITHIN GROUP (GRAPH PATH) AS [Путь до другого человека],
        LAST_VALUE(Person2.name) WITHIN GROUP (GRAPH PATH) AS LastNode,
        COUNT(Person2.name) WITHIN GROUP (GRAPH PATH) AS [Шагов]
    FROM
        Tourist AS Person1,
        friendOf FOR PATH AS fo,
        Tourist FOR PATH AS Person2
    WHERE MATCH(SHORTEST_PATH(Person1(-(fo)->Person2)+))
    AND Person1.name = 'Кристофер'
) AS Q
WHERE Q.LastNode = 'Алексей'

-- 7. Найдите друзей и друзей друзей Сьюзен
SELECT [Имя человека], [Друзья друзей]
FROM (
    SELECT
        Person1.name AS [Имя человека],
        STRING_AGG(Person2.name, '->') WITHIN GROUP (GRAPH PATH) AS [Друзья друзей],
        COUNT(Person2.name) WITHIN GROUP (GRAPH PATH) AS levels
    FROM
        Tourist AS Person1,
        friendOf FOR PATH AS fo,
        Tourist FOR PATH  AS Person2
    WHERE MATCH(SHORTEST_PATH(Person1(-(fo)->Person2){1,2}))
    AND Person1.name = 'Сьюзен'
) Q

SELECT 
    t1.name AS FirstName,
    t1.surname AS FirstSurname,
    t1.id AS FirstID,
    'Friend' + CAST(t1.id AS NVARCHAR) AS FirstImage,
    t2.name AS SecondName,
    t2.surname AS SecondSurname,
    t2.id AS SecondID,
    'Friend' + CAST(t2.id AS NVARCHAR) AS SecondImage
FROM 
    FriendOf f
JOIN 
    Tourist t1 ON f.$from_id = t1.$node_id
JOIN 
    Tourist t2 ON f.$to_id = t2.$node_id;

	SELECT C.name AS [Название города], Country.name AS [Название страны], 'Country' + CAST(Country.id AS NVARCHAR) AS [Country image], 'City' AS [City image]
FROM City AS C
, situatedIn
, Country
WHERE MATCH(C-(situatedIn)->Country)
