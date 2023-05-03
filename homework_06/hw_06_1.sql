/*
1. Создайте функцию, которая принимает кол-во сек и форматирует их в кол-во дней, часов, минут и секунд.
Пример: 123456 ->'1 days 10 hours 17 minutes 36 seconds '*/

DELIMITER $$
CREATE PROCEDURE CounterSeconds(times INT)
BEGIN
    DECLARE days INT default 0;
    DECLARE hours INT default 0;
    DECLARE minutes INT default 0;
    DECLARE seconds INT default 0;
	
    SET days = FLOOR(times / 86400);
    SET hours = FLOOR((times - days * 86400) / 3600);
    SET minutes = FLOOR((times - days * 86400 - hours * 3600) / 60);
    SET seconds = times - days * 86400 - hours * 3600 - minutes * 60;
   
SELECT days, hours, minutes, seconds;
END $$
DELIMITER ;

CALL CounterSeconds(123456);
