use carsales;

---	3 ���������� ������� � �������������� ���������� ���������;

SELECT "NAME" AS '���' FROM BUYER
WHERE AGE > '30';

SELECT "NAME" AS '���' FROM EMPLOYEE
WHERE SALARY = '600';

SELECT * FROM CAR
WHERE PRICE > '3000';

---	3 ������� � �������������� ���������� ���������� AND, OR � NOT;

SELECT "NAME" AS '���' FROM BUYER
WHERE AGE > '30' OR POL = '�';

SELECT "NAME" AS '���' FROM EMPLOYEE
WHERE SALARY = '600' AND EXPERIENCE > '6';

SELECT * FROM CAR
WHERE NOT LOWER(COLOR) = '�����';

---	2 ������� �� ������������� ���������� ���������� ����������;

SELECT "NAME" AS '���' FROM BUYER
WHERE AGE > '30' OR (POL = '�' OR POL = '�');

SELECT "NAME" AS '���' FROM EMPLOYEE
WHERE SALARY = '600' AND (EXPERIENCE > '6' AND EXPERIENCE < '33');

---	2 ������� �� ������������� ��������� ��� ���������;

SELECT "NAME" AS '���', SUTFNAME AS '��������' FROM BUYER
WHERE AGE + AGE IN ('30', '60');

SELECT "NAME" AS '���' FROM EMPLOYEE
WHERE SALARY + EXPERIENCE IN('609');

---	2 ������� � ��������� �� �������������� ���������;

SELECT "NAME" AS '���', SUTFNAME AS '��������' FROM BUYER
WHERE AGE IN ('30', '60');

SELECT "NAME" AS '���' FROM EMPLOYEE
WHERE SALARY NOT IN('600');

---	2 ������� � ��������� �� �������������� ��������� ��������;

SELECT "NAME" AS '���', SUTFNAME AS '��������' FROM BUYER
WHERE AGE BETWEEN 30 AND 60;

SELECT "NAME" AS '���' FROM EMPLOYEE
WHERE UPPER("NAME") NOT BETWEEN '�' AND '�';

---	2 ������� � ��������� �� ������������ �������;

SELECT "NAME" AS '���', SUTFNAME AS '��������' FROM BUYER
WHERE AGE NOT LIKE '30';

SELECT "NAME" AS '���', SUTFNAME AS '��������' FROM BUYER
WHERE UPPER("NAME") LIKE '�_�%';

SELECT "NAME" AS '���' FROM EMPLOYEE
WHERE UPPER(NAME) LIKE '�%';

---	2 ������� � ��������� �� �������������� ��������.

SELECT "NAME" AS '���', SUTFNAME AS '��������' FROM BUYER
WHERE SUTFNAME IS NOT NULL;

SELECT "NAME" AS '���' FROM EMPLOYEE
WHERE "NAME" IS NULL;