CREATE DATABASE carsales  
 ON PRIMARY                   
   ( NAME = carSale_data,       
     FILENAME = 'D:\BSUIR\7sem\SiMUBD\laba2\carsales_data.mdf',
     SIZE = 5MB, 
     MAXSIZE = 75MB,
     FILEGROWTH = 3MB ),
 FILEGROUP Secondary
   ( NAME = carSale2_data,
     FILENAME = 'D:\BSUIR\7sem\SiMUBD\laba2\carsales3_data2.ndf',
     SIZE = 3MB, 
	 MAXSIZE = 50MB,
     FILEGROWTH = 15% ),
   ( NAME = carSale3_data,
     FILENAME = 'D:\BSUIR\7sem\SiMUBD\laba2\carsales3_data3.ndf',
     SIZE = 4MB, 
     FILEGROWTH = 4MB )
 LOG ON
   ( NAME = carSale_log,
     FILENAME = 'D:\BSUIR\7sem\SiMUBD\laba2\carsales3_log.ldf',
     SIZE = 1MB,
     MAXSIZE = 10MB,
     FILEGROWTH = 20% ),
   ( NAME = carSale2_log,
     FILENAME = 'D:\BSUIR\7sem\SiMUBD\laba2\carsales3_log2.ldf',
     SIZE = 512KB,
     MAXSIZE = 15MB,
     FILEGROWTH = 10% )
 GO  