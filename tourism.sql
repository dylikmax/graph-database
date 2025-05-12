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
(1, '�������', '������', 'M', '1990-05-12'),
(2, '����', '����', 'M', '1985-07-23'),
(3, '�����', '�������', 'F', '1992-03-15'),
(4, '������', '�������', 'F', '1988-11-30'),
(5, '�����', '�����', 'M', '1980-01-05'),
(6, '�� ��', '���', 'F', '1995-06-18'),
(7, '��� ����', '�����', 'M', '1983-12-10'),
(8, '���������', '������', 'M', '1991-09-25'),
(9, '�����', '�������', 'M', '1979-04-20'),
(10, '������', '��', 'F', '1994-08-14');

INSERT INTO Country (id, name, population) VALUES
(1, '�������', 47000000),
(2, '�������', 65000000),
(4, '������', 60000000),
(3, '��������', 84000000),
(5, '��������������', 67000000),
(7, '���', 331000000),
(8, '������', 146000000),
(10, '����� �����', 52000000),
(9, '������', 125000000),
(6, '������', 104000000)

INSERT INTO City (id, name) VALUES
(1, '������'),
(2, '�������'),
(3, '�����'),
(4, '�������'),
(5, '������'),
(6, '���'),
(7, '�����'),
(8, '������'),
(9, '�������'),
(10, '����-���-����'),
(11, '��c-�������'),
(12, '���-�����'),
(13, '���-����'),
(14, '������'),
(15, '�����-���������'),
(16, '�����'),
(17, '����')

INSERT INTO Tour (id, name, cost) VALUES
(1, '���������� �������', 3700),
(2, '�������� ������', 5600),
(3, '��������� ������', 8900),
(4, '������ �����', 4300),
(5, '���������� ������', 6000),
(6, '����� �� ����', 3200),
(7, '����� ��� ������', 13800),
(8, '������ �������', 6900),
(9, '������� ����', 4300),
(10, '������������ ��������', 2100)

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

-- 1. ����������, ����� ������� ����������� � ���� "��������� ������".
SELECT DISTINCT T.name AS [���], T.surname AS [�������], tour_date AS [���� �������]
FROM Tourist AS T
, GoesToTour
, Tour
WHERE MATCH(T-(GoesToTour)->Tour)
AND Tour.name = N'��������� ������'

-- 2. ������, ����� ������ ��������� � ��������������.
SELECT C.name AS [�������� ������]  
FROM City AS C
, situatedIn
, Country
WHERE MATCH(C-(situatedIn)->Country)
AND Country.name = N'��������������'

-- 3. ������, ����� ���� �������� ����� ������.
SELECT T.name
FROM City AS C
, IncludedInTour
, Tour AS T
WHERE MATCH(C-(IncludedInTour)->T)
AND C.name = N'������'

-- 4. ����������, ��� �� �������� ��������� � ������.
SELECT T.name, T.surname
FROM Tourist AS T
, LivesIn
, Country AS C
WHERE MATCH(T-(LivesIn)->C)
AND C.name = N'������'

-- 5. ���������� ��� ������, ��� ��������� �������.
SELECT DISTINCT C.name
FROM Country AS C
, LivesIn
, Tourist AS T
WHERE MATCH(T-(LivesIn)->C)

-- 6. ������� ��������� ���� � ���� ������ �� ���������� �� ������� � �������� ���������� ����� ��� �������� ����� ����.
SELECT [��� ��������], [���� �� ������� ��������], [�����]
FROM (
    SELECT
        Person1.name AS [��� ��������],
        STRING_AGG(Person2.name, '->') WITHIN GROUP (GRAPH PATH) AS [���� �� ������� ��������],
        LAST_VALUE(Person2.name) WITHIN GROUP (GRAPH PATH) AS LastNode,
        COUNT(Person2.name) WITHIN GROUP (GRAPH PATH) AS [�����]
    FROM
        Tourist AS Person1,
        friendOf FOR PATH AS fo,
        Tourist FOR PATH AS Person2
    WHERE MATCH(SHORTEST_PATH(Person1(-(fo)->Person2)+))
    AND Person1.name = '���������'
) AS Q
WHERE Q.LastNode = '�������'

-- 7. ������� ������ � ������ ������ ������
SELECT [��� ��������], [������ ������]
FROM (
    SELECT
        Person1.name AS [��� ��������],
        STRING_AGG(Person2.name, '->') WITHIN GROUP (GRAPH PATH) AS [������ ������],
        COUNT(Person2.name) WITHIN GROUP (GRAPH PATH) AS levels
    FROM
        Tourist AS Person1,
        friendOf FOR PATH AS fo,
        Tourist FOR PATH  AS Person2
    WHERE MATCH(SHORTEST_PATH(Person1(-(fo)->Person2){1,2}))
    AND Person1.name = '������'
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

	SELECT C.name AS [�������� ������], Country.name AS [�������� ������], 'Country' + CAST(Country.id AS NVARCHAR) AS [Country image], 'City' AS [City image]
FROM City AS C
, situatedIn
, Country
WHERE MATCH(C-(situatedIn)->Country)
