USE carsales;

---	2 ������� � �������������� ����������� ������������ ���� ������;

SELECT * FROM BUYER, CARSALE;

SELECT * FROM EMPLOYEE, CARSALE;

---	3 ������� � �������������� ���������� ���� ������ �� ���������;

SELECT "NAME", DATESALE FROM CAR, CARSALE
WHERE CAR.KOD_CARBRAND = CARSALE.KOD_CARBRAND;

SELECT EMPLOYEE.NAME, CAR.NAME FROM EMPLOYEE, CAR
WHERE EMPLOYEE.SALARY = CAR.PRICE;

SELECT * FROM EMPLOYEE, BUYER
WHERE EMPLOYEE."NAME" = BUYER."NAME";

---	2 ������� � �������������� ���������� ���� ������ �� ��������� � �������� ������;

SELECT "NAME", DATESALE FROM CAR, CARSALE
WHERE CAR.KOD_CARBRAND = CARSALE.KOD_CARBRAND AND LOWER(CAR.COLOR)='�����';

SELECT EMPLOYEE.NAME, CAR.NAME FROM EMPLOYEE, CAR
WHERE EMPLOYEE.SALARY = CAR.PRICE AND EMPLOYEE.EXPERIENCE>33;

---	2 ������� � �������������� ���������� �� ���� ��������;

SELECT DISTINCT c."NAME" FROM CAR c, CARSALE cs, CARBRAND cb
WHERE c.KOD_CARBRAND = cs.KOD_CARBRAND AND cb.COUNTRY='��������';

SELECT EMPLOYEE.NAME, CAR.NAME FROM EMPLOYEE, CAR, BUYER
WHERE EMPLOYEE."NAME" = BUYER."NAME" AND CAR.PRICE>300;

---	������� ����� ����� ��������� �������� �� ���������� �� ��������� �� ������� � �������������� �������� ������� ���������� ������ (JOIN).
---	2 ������� � �������������� ������ �������� ����������;


SELECT "NAME", DATESALE FROM CARSALE
LEFT OUTER JOIN CAR
ON CAR.KOD_CARBRAND = CARSALE.KOD_CARBRAND;

SELECT EMPLOYEE.NAME, CAR.NAME FROM EMPLOYEE
LEFT OUTER JOIN CAR
ON EMPLOYEE.SALARY = CAR.PRICE;

---	2 ������� �� ������������� ������� �������� ����������;

SELECT EMPLOYEE.NAME, CAR.NAME FROM EMPLOYEE
RIGHT OUTER JOIN CAR
ON EMPLOYEE.SALARY = CAR.PRICE;

SELECT * FROM EMPLOYEE
RIGHT OUTER JOIN BUYER
ON EMPLOYEE."NAME" = BUYER."NAME";

---	2 ������� � �������������� ������������� ���������� � �������� ������������.

SELECT "NAME", DATESALE FROM CAR
JOIN CARSALE
ON CAR.KOD_CARBRAND = CARSALE.KOD_CARBRAND;

SELECT * FROM EMPLOYEE
JOIN BUYER
ON EMPLOYEE."NAME" != BUYER."NAME"
JOIN CARSALE
ON CARSALE.KOD_BUYER = BUYER.ID;