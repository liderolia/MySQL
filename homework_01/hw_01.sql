CREATE DATABASE hw_01;

USE hw_01;

CREATE TABLE telephone
(
id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
ProductName VARCHAR(45) NOT NULL,
Manufacturer VARCHAR(45) NOT NULL,
ProductCount INT NOT NULL,
Price INT NOT NULL
);

INSERT telephone(id, ProductName, Manufacturer, ProductCount, Price)
VALUES
(id,"Iphone X", "Apple", 3, 76000),
(id,"Iphone 8", "Apple", 2, 51000),
(id,"Galaxy S9", "Samsung", 2, 56000),
(id,"Galaxy S8", "Samsung", 1, 41000),
(id,"P20 Pro", "Huawei", 5, 36000);

SELECT ProductName, Manufacturer, Price FROM telephone
WHERE ProductCount > 2;

SELECT*
FROM telephone
WHERE Manufacturer = "Samsung";

SELECT*
FROM telephone
WHERE ProductName LIKE "Iphone%";

SELECT*
FROM telephone
WHERE Manufacturer LIKE "Samsung%";


SELECT*
FROM telephone
WHERE ProductName like "%8%";
