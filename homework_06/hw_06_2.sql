/*
2. Выведите только четные числа от 1 до 10 включительно.
Пример: 2,4,6,8,10 (можно сделать через шаг + 2: х = 2, х+=2)*/

DELIMITER $$
CREATE PROCEDURE numbers(num INT)
BEGIN
    DECLARE N INT default 0;  
    DROP TABLE IF EXISTS nums;
    CREATE TABLE nums (N INT);
        
    WHILE N < num DO   
	SET N = N + 2;
    INSERT INTO nums VALUES(N);   
	END WHILE;

SELECT * FROM nums;
END $$
DELIMITER ;

CALL numbers(10);
