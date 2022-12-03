USE [carsales]
GO
CREATE ROLE [Manager]
GO
USE [carsales]
GO
ALTER AUTHORIZATION ON SCHEMA::[db_datareader] TO [Manager]
GO
