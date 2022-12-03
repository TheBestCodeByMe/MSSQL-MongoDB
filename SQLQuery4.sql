USE [carsales]
GO
CREATE ROLE [Salesman]
GO
USE [carsales]
GO
ALTER AUTHORIZATION ON SCHEMA::[db_datawriter] TO [Salesman]
GO
