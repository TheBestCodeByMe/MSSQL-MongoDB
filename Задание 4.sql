USE carsales;

---	2 ������� � �������������� ������� COUNT;

SELECT COUNT(PRICE) FROM CAR WHERE COLOR='�����';

SELECT COUNT(PRICE) FROM CAR;

---	2 ������� � �������������� ������� SUM;

SELECT SUM(PRICE) FROM CAR WHERE COLOR='�����';

SELECT SUM(PRICE) FROM CAR;

---	2 ������� � �������������� ������� UPPER, LOWER;

SELECT UPPER("NAME") FROM CAR WHERE COLOR = '�����';

SELECT LOWER("NAME") FROM CAR;

---	2 ������� � �������������� ��������� �������;

SELECT * FROM CARSALE WHERE DATENAME(YEAR, DATESALE) = 2022;

SELECT *, DATEADD(MONTH, 3, DATESALE) FROM CARSALE;

---	2 ������� � �������������� ����������� �� ������ �������;

SELECT KOD_CAR, COUNT(*) AS "���-�� ���������� �����" FROM CARSALE GROUP BY KOD_CAR;

SELECT KOD_BUYER, COUNT(*) AS "���-�� �� ��������" FROM CARSALE GROUP BY KOD_BUYER;

---	2 ������� �� ������������� ����������� �� ���������� ��������;

------------------------------------------------------------------------------------------------------------------ ������������
SELECT KOD_CAR, COLOR, COUNT(*) AS "���-�� ���������� �����" FROM CARSALE, CAR
WHERE CAR.ID = CARSALE.KOD_CAR
GROUP BY KOD_CAR, COLOR;

SELECT KOD_EMPLOYEE, EMPLOYEE.SALARY, COUNT(*) AS "���-�� �� ��������" FROM CARSALE, EMPLOYEE
WHERE EMPLOYEE."NAME" = '�����'
GROUP BY KOD_EMPLOYEE, EMPLOYEE.SALARY;

---	2 ������� � �������������� ������� ������ ����� HAVING;

SELECT KOD_CAR, COUNT(*)
FROM CARSALE
GROUP BY KOD_CAR HAVING COUNT(*)>1;

SELECT KOD_BUYER
FROM CARSALE
GROUP BY KOD_BUYER HAVING COUNT(KOD_BUYER)>1;

---	2 ������� � �������������� ����� HAVING ��� ����� GROUP BY;

SELECT COUNT(*)
FROM CARSALE
HAVING COUNT(*)>1;

SELECT AVG(PRICE)
FROM CAR
HAVING SUM(PRICE + PRICE)>6000;

---	2 ������� � �������������� ���������� �� �������;

SELECT *
FROM CAR
ORDER BY KOD_CARBRAND;

SELECT *
FROM CAR
ORDER BY COLOR;

---	2 ������� �� ���������� ����� ������ � �������;

INSERT INTO CAR("NAME", KOD_CARBRAND, PRICE, COLOR)
VALUES('�������','5','30000','�����');

INSERT INTO CAR("NAME", KOD_CARBRAND, PRICE, COLOR)
VALUES('�������','3','30','�����');

---	2 ������� �� ���������� ����� ������ �� ����������� ������� � �������� ������������ ��������;


INSERT INTO CAR("NAME", KOD_CARBRAND, PRICE, COLOR)
VALUES(
(SELECT "NAME"
FROM CAR
WHERE ID = '1'
)
,'5','7488','�����');

INSERT INTO CAR("NAME", KOD_CARBRAND, PRICE, COLOR)
VALUES('�����','5','30000',
(SELECT COLOR
FROM CAR
WHERE ID = '5'
));


---	2 ������� �� ���������� ������������ ������ � �������;

UPDATE CAR
SET PRICE = 9*PRICE;

UPDATE EMPLOYEE
SET SALARY = 2+SALARY;

---	2 ������� �� ���������� ������������ ������ �� ����������� ���������� �� ����� WHERE;

UPDATE CAR
SET "NAME" = '���������������'
WHERE "NAME" = '�������';

UPDATE EMPLOYEE
SET SALARY = 7000
WHERE SALARY<6000;

---	2 ������� �� �������� ������������ ������.

DELETE FROM CAR
WHERE "NAME" = '���������������';

DELETE FROM CAR
WHERE PRICE = '7488';