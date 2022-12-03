USE carsales;

---	2 запроса с использованием функции COUNT;

SELECT COUNT(PRICE) FROM CAR WHERE COLOR='Белый';

SELECT COUNT(PRICE) FROM CAR;

---	2 запроса с использованием функции SUM;

SELECT SUM(PRICE) FROM CAR WHERE COLOR='Белый';

SELECT SUM(PRICE) FROM CAR;

---	2 запроса с использованием функций UPPER, LOWER;

SELECT UPPER("NAME") FROM CAR WHERE COLOR = 'Белый';

SELECT LOWER("NAME") FROM CAR;

---	2 запроса с использованием временных функций;

SELECT * FROM CARSALE WHERE DATENAME(YEAR, DATESALE) = 2022;

SELECT *, DATEADD(MONTH, 3, DATESALE) FROM CARSALE;

---	2 запроса с использованием группировки по одному столбцу;

SELECT KOD_CAR, COUNT(*) AS "Кол-во одинаковых машин" FROM CARSALE GROUP BY KOD_CAR;

SELECT KOD_BUYER, COUNT(*) AS "Кол-во по продавцу" FROM CARSALE GROUP BY KOD_BUYER;

---	2 запроса на использование группировки по нескольким столбцам;

------------------------------------------------------------------------------------------------------------------ ПЕРЕСМОТРЕТЬ
SELECT KOD_CAR, COLOR, COUNT(*) AS "Кол-во одинаковых машин" FROM CARSALE, CAR
WHERE CAR.ID = CARSALE.KOD_CAR
GROUP BY KOD_CAR, COLOR;

SELECT KOD_EMPLOYEE, EMPLOYEE.SALARY, COUNT(*) AS "Кол-во по продавцу" FROM CARSALE, EMPLOYEE
WHERE EMPLOYEE."NAME" = 'Лилия'
GROUP BY KOD_EMPLOYEE, EMPLOYEE.SALARY;

---	2 запроса с использованием условия отбора групп HAVING;

SELECT KOD_CAR, COUNT(*)
FROM CARSALE
GROUP BY KOD_CAR HAVING COUNT(*)>1;

SELECT KOD_BUYER
FROM CARSALE
GROUP BY KOD_BUYER HAVING COUNT(KOD_BUYER)>1;

---	2 запроса с использованием фразы HAVING без фразы GROUP BY;

SELECT COUNT(*)
FROM CARSALE
HAVING COUNT(*)>1;

SELECT AVG(PRICE)
FROM CAR
HAVING SUM(PRICE + PRICE)>6000;

---	2 запроса с использованием сортировки по столбцу;

SELECT *
FROM CAR
ORDER BY KOD_CARBRAND;

SELECT *
FROM CAR
ORDER BY COLOR;

---	2 запроса на добавление новых данных в таблицу;

INSERT INTO CAR("NAME", KOD_CARBRAND, PRICE, COLOR)
VALUES('хеундай','5','30000','Белый');

INSERT INTO CAR("NAME", KOD_CARBRAND, PRICE, COLOR)
VALUES('хеундай','3','30','Белый');

---	2 запроса на добавление новых данных по результатам запроса в качестве вставляемого значения;


INSERT INTO CAR("NAME", KOD_CARBRAND, PRICE, COLOR)
VALUES(
(SELECT "NAME"
FROM CAR
WHERE ID = '1'
)
,'5','7488','Белый');

INSERT INTO CAR("NAME", KOD_CARBRAND, PRICE, COLOR)
VALUES('Джили','5','30000',
(SELECT COLOR
FROM CAR
WHERE ID = '5'
));


---	2 запроса на обновление существующих данных в таблице;

UPDATE CAR
SET PRICE = 9*PRICE;

UPDATE EMPLOYEE
SET SALARY = 2+SALARY;

---	2 запроса на обновление существующих данных по результатам подзапроса во фразе WHERE;

UPDATE CAR
SET "NAME" = 'ХендайУльтимейт'
WHERE "NAME" = 'хеундай';

UPDATE EMPLOYEE
SET SALARY = 7000
WHERE SALARY<6000;

---	2 запроса на удаление существующих данных.

DELETE FROM CAR
WHERE "NAME" = 'ХендайУльтимейт';

DELETE FROM CAR
WHERE PRICE = '7488';