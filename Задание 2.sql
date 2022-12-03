use carsales;

---	3 простейших запроса с использованием операторов сравнения;

SELECT "NAME" AS 'Имя' FROM BUYER
WHERE AGE > '30';

SELECT "NAME" AS 'Имя' FROM EMPLOYEE
WHERE SALARY = '600';

SELECT * FROM CAR
WHERE PRICE > '3000';

---	3 запроса с использованием логических операторов AND, OR и NOT;

SELECT "NAME" AS 'Имя' FROM BUYER
WHERE AGE > '30' OR POL = 'М';

SELECT "NAME" AS 'Имя' FROM EMPLOYEE
WHERE SALARY = '600' AND EXPERIENCE > '6';

SELECT * FROM CAR
WHERE NOT LOWER(COLOR) = 'Белый';

---	2 запроса на использование комбинации логических операторов;

SELECT "NAME" AS 'Имя' FROM BUYER
WHERE AGE > '30' OR (POL = 'М' OR POL = 'м');

SELECT "NAME" AS 'Имя' FROM EMPLOYEE
WHERE SALARY = '600' AND (EXPERIENCE > '6' AND EXPERIENCE < '33');

---	2 запроса на использование выражений над столбцами;

SELECT "NAME" AS 'Имя', SUTFNAME AS 'Отчество' FROM BUYER
WHERE AGE + AGE IN ('30', '60');

SELECT "NAME" AS 'Имя' FROM EMPLOYEE
WHERE SALARY + EXPERIENCE IN('609');

---	2 запроса с проверкой на принадлежность множеству;

SELECT "NAME" AS 'Имя', SUTFNAME AS 'Отчество' FROM BUYER
WHERE AGE IN ('30', '60');

SELECT "NAME" AS 'Имя' FROM EMPLOYEE
WHERE SALARY NOT IN('600');

---	2 запроса с проверкой на принадлежность диапазону значений;

SELECT "NAME" AS 'Имя', SUTFNAME AS 'Отчество' FROM BUYER
WHERE AGE BETWEEN 30 AND 60;

SELECT "NAME" AS 'Имя' FROM EMPLOYEE
WHERE UPPER("NAME") NOT BETWEEN 'Л' AND 'Я';

---	2 запроса с проверкой на соответствие шаблону;

SELECT "NAME" AS 'Имя', SUTFNAME AS 'Отчество' FROM BUYER
WHERE AGE NOT LIKE '30';

SELECT "NAME" AS 'Имя', SUTFNAME AS 'Отчество' FROM BUYER
WHERE UPPER("NAME") LIKE 'Л_Л%';

SELECT "NAME" AS 'Имя' FROM EMPLOYEE
WHERE UPPER(NAME) LIKE 'Л%';

---	2 запроса с проверкой на неопределенное значение.

SELECT "NAME" AS 'Имя', SUTFNAME AS 'Отчество' FROM BUYER
WHERE SUTFNAME IS NOT NULL;

SELECT "NAME" AS 'Имя' FROM EMPLOYEE
WHERE "NAME" IS NULL;