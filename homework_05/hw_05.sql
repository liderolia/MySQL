CREATE TABLE  AUTO 
(       
	ID INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
	Cars VARCHAR(45), 	
  	Cost DECIMAL
);

INSERT INTO AUTO (Cars, Cost) VALUES
('Audi', 52642),
('Mercedes', 57127),
('Skoda', 9000),
('Volvo', 2900),
('Bentley', 350000),
('Citroen', 21000),
('Hummer', 41400),
('Volkswagen', 25600); #Изменила стоимость, для корректного отображение 2 задания (иначе нет машин стоимостью более 25 и менее 30)

#Создайте представление, в которое попадут автомобили стоимостью до 25 000 долларов
CREATE VIEW cars_name
AS SELECT *
FROM AUTO
WHERE Cost < 25000;

#Измените в существующем представлении порог для стоимости: пусть цена будет до 30 000 долларов (используя оператор ALTER VIEW)
ALTER VIEW cars_name 
AS SELECT *
FROM AUTO
WHERE Cost < 30000;

#Создайте представление, в котором будут только автомобили марки “Шкода” и “Ауди”
CREATE VIEW skoda_and_audi
AS SELECT *
FROM AUTO
WHERE Cars='SKODA' OR Cars='AUDI';
-----------

CREATE TABLE  Analysis
(
an_id INT PRIMARY KEY NOT NULL,
an_name VARCHAR(100) NOT NULL,
an_cost INT NOT NULL,
an_price INT NOT NULL,
an_group VARCHAR(30) NOT NULL
);

INSERT Analysis(an_id, an_name, an_cost, an_price, an_group)
VALUES
(1, "общий анализ крови", 100, 300, "кровь"),
(2, "общий анализ мочи", 100, 250, "моча"),
(3, "биохимический анализ крови", 150, 500, "кровь"),
(4, "Исследование мочи по методу Нечипоренко", 150, 250, "моча"),
(5, "Общий белок (суточная моча)", 50, 200, "моча"),
(6, "Глюкоза в крови", 50, 150, "кровь"),
(7, "IgE общий (Иммуноглобулин Е общий)", 200, 500, "Аллергологические"),
(8, "Респираторная панель", 1000, 5500, "Аллергологические"); 

select * from Analysis;

CREATE TABLE analiz_Groups
(
gr_id INT PRIMARY KEY NOT NULL,
gr_name VARCHAR(45) NOT NULL,
gr_temp VARCHAR(15) NOT NULL
);

INSERT analiz_Groups(gr_id, gr_name, gr_temp)
VALUES
(1, "кровь", "10-20"),
(2, "моча", "20-25"),
(3, "Аллергологические", "5-10");

select * from analiz_Groups;

CREATE TABLE analiz_Orders
(
ord_id INT PRIMARY KEY NOT NULL,
ord_datetime DATE NOT NULL,
ord_an INT NOT NULL
);

INSERT analiz_Orders(ord_id, ord_datetime, ord_an)
VALUES
(1, "2020-02-03", 1),
(2, "2020-02-05", 2),
(3, "2020-02-04", 3),
(4, "2020-02-05", 4),
(5, "2020-02-06", 5),
(6, "2020-02-07", 6),
(7, "2020-02-08", 7),
(8, "2020-02-09", 8),
(9, "2020-02-10", 5);

select * from analiz_Orders;

#Вывести название и цену для всех анализов, которые продавались 5 февраля 2020 и всю следующую неделю.
select Analysis.an_name, Analysis.an_price, analiz_Orders.ord_datetime
from Analysis Analysis
JOIN analiz_Orders analiz_Orders
ON analiz_Orders.ord_an=Analysis.an_id
WHERE analiz_Orders.ord_datetime BETWEEN "2020-02-05" AND "2020-02-09"