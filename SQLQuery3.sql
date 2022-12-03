sp_addlogin 'Uliana12',sysname, 'carsales'

USE [carsales]
GO
CREATE USER [Uliana12] FOR LOGIN [Uliana12]
GO
USE [carsales]
GO
ALTER ROLE [Salesman] ADD MEMBER [Uliana12]
GO

USE [carsales]
GO
CREATE USER [Uliana2] FOR LOGIN [Uliana2]
GO
USE [carsales]
GO
ALTER ROLE [Manager] ADD MEMBER [Uliana2]
GO

USE [carsales]
GO
GRANT DELETE TO [Uliana2]
GO