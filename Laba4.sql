use carsales;
/*
--��� ��������� ���� ������, �������� ������ ��������, �������������� ������� �� ����� P-SQL 10 ��������:
--	1 ������ ��� �������� ��������� ������� ����� ���������� ���� TABLE;

DECLARE @mytable TABLE (id INT, myname CHAR(20) DEFAULT '������ ����')
INSERT INTO @mytable(id) VALUES (1)
INSERT INTO @mytable(id, myname) VALUES (2,'����� �������') 
SELECT * FROM @mytable;

--	2 ������� � �������������� �������� ����������� IF;

DECLARE @a INT 
DECLARE @str CHAR(30)
SET @a = (SELECT COUNT(*) FROM CAR) 
IF @a >10 BEGIN
SET @str = '���������� ����� ������ 10' SELECT @str
END ELSE BEGIN
SET @str = '���������� ����� = ' + str(@a) SELECT @str
END;

DECLARE @b INT 
DECLARE @str1 CHAR(90)
SET @b = (SELECT SUM(PRICE) FROM CAR WHERE COLOR='�����') 
IF @b >10000 BEGIN
SET @str1 = '��������� ��������� ����� ����� ������ 10000' SELECT @str1
END ELSE BEGIN
SET @str1 = '��������� ��������� ����� = ' + str(@b) SELECT @str1
END;

--	2 ������� � �������������� ����� WHILE;

DECLARE @c INT SET @c = 1 WHILE @c <100
BEGIN
PRINT @c
IF (@c>40) AND (@c<50)
BREAK
ELSE
SET @c = @c+rand()*10 
CONTINUE
END
 PRINT @c;

DECLARE @k INT SET @k = 1
DECLARE @d INT SET @d = (SELECT PRICE FROM CAR WHERE CAR.ID=@k)  WHILE @d >6000
BEGIN
PRINT @d
IF (@d>6000) AND (@d<6500)
BREAK
ELSE
SET @k = @k+1
SET @d = (SELECT PRICE FROM CAR WHERE CAR.ID=@k)
CONTINUE
END
 PRINT @d


--	1 ������ ��� �������� ��������� �������;

IF OBJECT_ID (N'dbo.ISOweek', N'FN') IS NOT NULL 
DROP FUNCTION dbo.ISOweek;

GO
CREATE FUNCTION dbo.ISOweek (@PRICE int) RETURNS CHAR(15)
WITH EXECUTE AS CALLER AS
BEGIN
DECLARE @man int; 
DECLARE @ISOweek char(15); 
SET @man= @PRICE

IF (@man<=10000) SET @ISOweek='������'; 
IF (@man>10000 AND @man<30000) SET @ISOweek='���������';
IF (@man>=30000) SET @ISOweek='������';

RETURN(@ISOweek); 
END;

GO
SET DATEFIRST 1;
SELECT dbo.ISOweek(300000) AS '�����';

--	1 ������ ��� �������� �������, ������� ���������� ��������� ��������;

IF OBJECT_ID (N'ufn_SalesByStore', N'IF') IS NOT NULL
DROP FUNCTION db_owner.ufn_SalesByStore; 
GO
CREATE FUNCTION db_owner.ufn_SalesByStore(@carid int) RETURNS TABLE
AS RETURN (
SELECT d.PRICE AS "����", t.NAME AS "�����", t.COUNTRY AS "������"
FROM CAR d, CARBRAND t
WHERE d.KOD_CARBRAND =t.ID and d.PRICE>@carid
GROUP BY t.NAME, d.PRICE, t.COUNTRY
);

GO
SELECT * from db_owner.ufn_SalesByStore(10000);

--	2 ������� ��� �������� ��������� ��� ����������;
DROP PROCEDURE IF EXISTS Count_Andrey;
go

CREATE PROCEDURE Count_Andrey
AS
Select count(e.NAME) from EMPLOYEE e
where e.NAME='������' 
Go

DROP PROCEDURE IF EXISTS Count_Big_Salary;
go

CREATE PROCEDURE Count_Big_Salary
AS
Select count(e.NAME) from EMPLOYEE e
where e.SALARY>17000 
Go

EXECUTE Count_Andrey
EXECUTE Count_Big_salary

--	2 ������� ��� �������� ��������� c ������� ����������;
DROP PROCEDURE IF EXISTS Count_Andrey_Salary;
go

CREATE PROCEDURE Count_Andrey_Salary @Sum_salary as Int
AS
Select count(NAME) from EMPLOYEE
WHERE NAME='������' and SALARY>=@Sum_salary 
Go

DROP PROCEDURE IF EXISTS Count_Car_WHITE_PRICE;
go

CREATE PROCEDURE Count_Car_WHITE_PRICE @Price as Int
AS
Select count(NAME) from CAR
WHERE COLOR ='�����' and PRICE>=@Price
Go

EXEC Count_Andrey_Salary 60
EXEC Count_Car_WHITE_PRICE 10000

--	2 ������� ��� �������� ��������� c �������� ����������� � RETURN;

DROP PROCEDURE IF EXISTS checkname;

GO
CREATE PROCEDURE checkname @param int AS
IF (SELECT SUTFNAME FROM EMPLOYEE WHERE ID = @param)
= '����������'
RETURN 1 ELSE RETURN 2

DROP PROCEDURE IF EXISTS checkage;

GO
CREATE PROCEDURE checkage @param int AS
IF (SELECT AGE FROM BUYER WHERE ID = @param)
= '30'
RETURN 1 ELSE RETURN 2

DECLARE @return_status int
EXECUTE @return_status = checkage 1 SELECT 'Return Status' = @return_status 

--	2 ������� ��� �������� ��������� ���������� ������ � ������� ���� ������ UPDATE;
DROP PROC IF EXISTS update_proc

GO
CREATE PROC update_proc AS
UPDATE EMPLOYEE SET SALARY = SALARY+300

DROP PROC IF EXISTS update_proc2
GO
CREATE PROC update_proc2 AS
UPDATE EMPLOYEE SET SALARY = SALARY-300

EXEC update_proc
EXEC update_proc2

--	2 ������� ��� �������� ��������� ���������� ������ �� ������ ���� ������ SELECT;
DROP PROC IF EXISTS select_color_car

go
CREATE PROC select_color_car @k CHAR(10) AS
SELECT * FROM CAR WHERE COLOR=@k

DROP PROC IF EXISTS select_brand_car

go
CREATE PROC select_brand_car @k INT AS
SELECT * FROM CAR WHERE KOD_CARBRAND=@k

EXEC select_color_car '�����'

EXEC select_brand_car 1

-- ������� 1. ������� ������� ��� ���������� ������� �������������� �������� �+�, �- �, �*� � �/� ��� ������ ���������� ���� bigint, �������� ����������� � ��������:
drop function if exists Calculator

go
CREATE FUNCTION Calculator (@Opd1 bigint, @Opd2 bigint, @Oprt char(1) = '*')
RETURNS bigint
AS BEGIN
DECLARE @Result bigint SET @Result =
CASE @Oprt
WHEN '+' THEN @Opd1 + @Opd2 WHEN '-' THEN @Opd1 - @Opd2
WHEN '*' THEN @Opd1 * @Opd2 WHEN '/' THEN @Opd1 / @Opd2 ELSE 0
END
Return @Result END

SELECT dbo.Calculator(4,5, '+'), dbo.Calculator(3,7, '*') - dbo.Calculator(64,4,'/')*2

-- ������� 2. ������� �������, ������������ ������� � ������������ ������� ��������, �������� ����������� � ������������:
DROP FUNCTION IF EXISTS DYNTAB

go
CREATE FUNCTION DYNTAB (@State char(10))
RETURNS Table AS
RETURN SELECT CAR.NAME, CAR.YEAR, CAR.COLOR FROM CAR WHERE COLOR = @state

SELECT * FROM DYNTAB ('�����')
ORDER BY NAME, YEAR, COLOR

--???
-- ������� 3. ������� �������, ����������� ������� ������ �� ���������, ��������� � �������� ����������� �������, �������� ����������� � ������������:
DROP FUNCTION IF EXISTS ParseStr

go
CREATE FUNCTION ParseStr (@String nvarchar(500))
RETURNS @tabl TABLE
(Number int IDENTITY (1,1) NOT NULL,
Substr nvarchar (30)) AS
BEGIN
DECLARE @Str1 nvarchar(500), @Pos int SET @Str1 = @String
WHILE 1>0 BEGIN
SET @Pos = CHARINDEX(' ', @Str1) IF @POS>0
BEGIN
INSERT INTO @tabl
VALUES (SUBSTRING (@Str1,1,@Pos)) END
ELSE BEGIN
INSERT INTO @tabl VALUES (@Str1) BREAK
END END RETURN END

DECLARE @TestString nvarchar(500)
Set @TestString = 'SQL Server 2019'
SELECT * FROM ParseStr (@TestString)
*/