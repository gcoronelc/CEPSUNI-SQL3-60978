
-- ILUSTRACION DE LOS BACKUPS

USE master 
go

select * from sysdevices;
go

EXEC sp_addumpdevice 'disk', 'Dispositivo02', 'F:\backup\Dispositivo02.bak'
go

create table algo( id int, dato varchar(100) );
go

-- Domingo

insert into algo values( 100, 'Dato domingo');
go

BACKUP DATABASE demo
TO Dispositivo02
with 
	name = 'Completo domingo', 
	description = 'Backup completo de la base de datos DEMO', 
	INIT;
go

restore headeronly from Dispositivo02
go


-- Lunes

insert into algo values( 200, 'Dato Lunes');
go

BACKUP DATABASE demo
TO Dispositivo02
with 
	name = 'Diferencial Lunes', 
	description = 'Backup diferencial del lunes de la base de datos DEMO', 
	DIFFERENTIAL;
go

restore headeronly from Dispositivo02
go

-- Martes

insert into algo values( 300, 'Dato Martes');
go

BACKUP DATABASE demo
TO Dispositivo02
with 
	name = 'Diferencial Martes', 
	description = 'Backup diferencial del martes de la base de datos DEMO', 
	DIFFERENTIAL;
go

restore headeronly from Dispositivo02
go


-- RESTAURACION 1

USE master
GO

DROP DATABASE DEMO
GO

restore headeronly from Dispositivo02
go

RESTORE DATABASE DEMO 
FROM Dispositivo02
WITH FILE=1, RECOVERY
GO

SELECT * FROM DEMO..ALGO;
GO

-- RESTAURACION 2

USE master
GO

DROP DATABASE DEMO
GO

restore headeronly from Dispositivo02
go

RESTORE DATABASE DEMO 
FROM Dispositivo02
WITH FILE=1, NORECOVERY
GO

RESTORE DATABASE DEMO 
FROM Dispositivo02
WITH FILE=2, RECOVERY
GO

SELECT * FROM DEMO..ALGO;
GO



-- RESTAURACION 3

USE master
GO

DROP DATABASE DEMO
GO

restore headeronly from Dispositivo02
go

RESTORE DATABASE DEMO 
FROM Dispositivo02
WITH FILE=1, NORECOVERY
GO

RESTORE DATABASE DEMO 
FROM Dispositivo02
WITH FILE=3, RECOVERY
GO

SELECT * FROM DEMO..ALGO;
GO
