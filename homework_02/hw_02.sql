CREATE DATABASE hw_02;

USE hw_02;

/*
1. Используя операторы языка SQL, создайте табличку “sales”. Заполните ее данными
*/
CREATE TABLE sales
(
id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
order_date VARCHAR(15) NOT NULL,
bucket VARCHAR(15) NOT NULL
);
INSERT INTO sales(order_date, bucket)
VALUES
("2021-01-01", "100 до 300"),

("2021-01-02", "100 до 300"),
("2021-01-03", "меньше 100"),
("2021-01-04", "100 до 300"),
("2021-01-05", "больше 300");

/*
2. Сгруппируйте значений количества в 3 сегмента — меньше 100, 100-300 и больше 300.
*/
SELECT*,
CASE
WHEN bucket = "меньше 100" THEN "маленький заказ"
WHEN bucket = "100 до 300" THEN "средний заказ"
WHEN bucket = "больше 300" THEN "большой заказ"
ELSE 'Fail'
END 
AS orders FROM sales
ORDER BY bucket DESC;

/*
3. Создайте таблицу “orders”, заполните ее значениями. Покажите “полный” статус заказа, используя оператор CASE
*/
CREATE TABLE orders
(
Orderid INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
Employeeid VARCHAR(15) NOT NULL,
Amount DOUBLE NOT NULL,
OrderStatus VARCHAR(30) NOT NULL
);
INSERT INTO orders(Employeeid, Amount, OrderStatus)
VALUES
("e03", 15.00, "OPEN"),
("e01", 25.50, "OPEN"),
("e05", 100.70, "CLOSED"),
("e02", 22.18, "OPEN"),
("e04", 9.50, "CANCELLED"),
("e04", 99.99, "OPEN");

SELECT*,
CASE
WHEN OrderStatus = "OPEN" THEN "Order is in open state"
WHEN OrderStatus = "OPEN" THEN "Order is in open state"
WHEN OrderStatus = "CLOSED" THEN "Order is closed"
WHEN OrderStatus = "OPEN" THEN "Order is in open state"
WHEN OrderStatus = "CANCELLED" THEN "Order is cancelled"
WHEN OrderStatus = "OPEN" THEN "Order is in open state"
ELSE 'Fail'
END 
AS FullStatus FROM orders;

/*
4. Чем 0 отличается от NULL?

"0" — является значением. NULL обозначает отсутствие значения. 
*/
