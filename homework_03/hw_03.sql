#Задание №1
CREATE TABLE SALESPEOPLE
(
Snum INT PRIMARY KEY NOT NULL,
Sname VARCHAR(15) NOT NULL,
City VARCHAR(15) NOT NULL,
Comm VARCHAR(30) NOT NULL
);
INSERT INTO SALESPEOPLE(Snum, Sname, City, Comm)
VALUES
(1001, "Peel", "London", "0.12"),
(1002, "Serres", "San Jones", "0.13"),
(1004, "Motika", "London", "0.11"),
(1007, "Refkin", "Barcelona", "0.15"),
(1003, "Alexrod", "New York", "0.10");

CREATE TABLE CUSTOMERS
(
Cnum INT PRIMARY KEY NOT NULL,
Cname VARCHAR(15) NOT NULL,
City VARCHAR(15) NOT NULL,
Rating INT NOT NULL,
Snum INT NOT NULL
);
INSERT INTO CUSTOMERS(Cnum, Cname, City, Rating, Snum)
VALUES
(2001, "Hoffman", "London", 100, 1001),
(2002, "Giovanni", "Rome", 200, 1003),
(2003, "Liu", "SanJose", 200, 1002),
(2004, "Grass", "Berlin", 300, 1002),
(2006, "Clemens", "London", 100, 1001),
(2008, "Cisneros", "SanJones", 300, 1007),
(2007, "Pereira", "Rome", 100, 104);

CREATE TABLE ORDERS
(
Onum INT PRIMARY KEY NOT NULL,
Amt DOUBLE NOT NULL,
Odate DATE NOT NULL,
Cnum INT NOT NULL,
Snum INT NOT NULL
);

/*исправила даты для соответствия с заданием*/
INSERT INTO ORDERS(Onum, Amt, Odate, Cnum, Snum)
VALUES
(3001, 18.69, "2016-01-01", 2008, 1007),
(3003, 767.19, "2016-01-01", 2001, 1001),
(3002, 1900.10, "2016-03-01", 2007, 1004),
(3005, 5160.45, "2016-03-01", 2003, 1002),
(3006, 1713.23, "2016-04-01", 2002, 1003),
(3009, 1713.23, "2016-04-01", 2002, 1003),
(3007, 75.75, "2016-04-01", 2004, 1002),
(3008, 4723.00, "2016-05-01", 2006, 1001),
(3010, 1309.95, "2016-06-01", 2004, 1002),
(3011, 9891.88, "2016-06-01", 2006, 1001);

#1. Напишите запрос, который сосчитал бы все суммы заказов, выполненных 1 января 2016 года.
SELECT ROUND (SUM(Amt), 2) FROM ORDERS
where Odate = "2016-01-01";

#2. Напишите запрос, который сосчитал бы число различных, отличных от NULL значений поля city в таблице заказчиков.
SELECT COUNT(distinct City) FROM CUSTOMERS;

#3. Напишите запрос, который выбрал бы наименьшую сумму для каждого заказчика.
SELECT Cnum, sum(Amt) FROM ORDERS
GROUP BY Cnum;

#4*. Напишите запрос, который бы выбирал заказчиков чьи имена начинаются с буквы G. Используется оператор "LIKE":
SELECT*
FROM CUSTOMERS
WHERE Cname like "%G%";

/*5.Отсортируйте поле “сумма” 
в порядке убывания:*/
SELECT* FROM ORDERS
ORDER BY Amt DESC;

#в порядке возрастания:
SELECT* FROM ORDERS
ORDER BY Amt;

#Задание №2
create table staff (
	id int primary key auto_increment,
    name varchar (20) not null,
    surname varchar (20) not null,
    speciality varchar (20) not null,
    seniority int not null,
    salary int not null,
    age int not null
);

insert staff( name, surname, speciality, seniority, salary, age)
values
	('Вася', 'Васькин', 'начальник', 40, 100000, 60),
    ('Петя', 'Петькин', 'начальник', 8, 70000, 30),
    ('Катя', 'Катькина', 'инженер', 2, 70000, 25),
    ('Саша', 'Сашкин', 'инженер', 12, 50000, 35),
    ('Иван', 'Иванов', 'рабочий', 40, 30000, 59),
    ('Петр', 'Петров', 'рабочий', 20, 25000, 40),
    ('Сидор', 'Сидоров', 'рабочий', 10, 20000, 35),
    ('Антон', 'Антонов', 'рабочий', 8, 19000, 28),
    ('Юра', 'Юркин', 'рабочий', 5, 15000, 25),
    ('Максим', 'Воронин', 'рабочий', 2, 11000, 22),
    ('Юра', 'Галкин', 'рабочий', 3, 12000, 24),
	('Люся', 'Люськина', 'уборщик', 10, 10000, 49);

#Отсортируйте по возрастанию поле “Зарплата” и выведите 5 строк с наибольшей заработной платой
SELECT* FROM staff
ORDER BY salary limit 5;
#6.Выполните группировку всех сотрудников по специальности “рабочий”, зарплата которых превышает 20000
SELECT * FROM staff
where salary > 20000 and speciality ='рабочий';
