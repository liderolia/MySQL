CREATE TABLE AUTO 
(       
	REGNUM VARCHAR(10) PRIMARY KEY, 
	MARK VARCHAR(10), 
	COLOR VARCHAR(15),
	RELEASEDT DATE, 
	PHONENUM VARCHAR(15)
);

INSERT INTO AUTO (REGNUM, MARK,	COLOR, RELEASEDT, PHONENUM ) 
VALUES (111114,'LADA', 'КРАСНЫЙ', date'2008-01-01', '9152222221'),
       (111115,'VOLVO', 'КРАСНЫЙ', date'2013-01-01', '9173333334'),
       (111116,'BMW', 'СИНИЙ', date'2015-01-01', '9173333334'),
       (111121,'AUDI', 'СИНИЙ', date'2009-01-01', '9173333332'),
       (111122,'AUDI', 'СИНИЙ', date'2011-01-01', '9213333336'),
       (111113,'BMW', 'ЗЕЛЕНЫЙ', date'2007-01-01', '9214444444'),
       (111126,'LADA', 'ЗЕЛЕНЫЙ', date'2005-01-01', null),
       (111117,'BMW', 'СИНИЙ', date'2005-01-01', null),
       (111119,'LADA', 'СИНИЙ', date'2017-01-01', 9213333331);

#1. Вывести на экран сколько машин каждого цвета для машин марок BMW и LADA
SELECT MARK, color, COUNT(color) FROM AUTO
WHERE MARK in ('BMW', 'LADA')
GROUP BY color, mark;

#2. Вывести на экран марку авто и количество AUTO не этой марки
SELECT MARK, COUNT(mark), ANOTHER-count(mark) AS another FROM AUTO
join (select count(*) as ANOTHER from auto) as mi
GROUP BY mark, another;

#Задание №3

CREATE TABLE test_a 
(id_number int, data varchar(1));

CREATE TABLE test_b 
(id_number int);

INSERT INTO test_a(id, test) 
VALUES (10, 'A'),
       (20, 'A'),
       (30, 'F'),
       (40, 'D'),
       (50, 'C');
INSERT INTO test_b(id) 
VALUES (10),
       (30),
       (50);

#Напишите запрос, который вернет строки из таблицы test_a, id которых нет в таблице test_b, НЕ используя ключевого слова NOT.
SELECT id FROM test_a
NATURAL LEFT JOIN test_b
WHERE test_b.id IS NULL;
