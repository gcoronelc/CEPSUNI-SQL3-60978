-- Dispositivo de almacenamiento de copias de seguridad

USE master 
go

select * from sysdevices;
go

EXEC sp_addumpdevice 'disk', 'Dispositivo01', 'F:\backup\Dispositivo01.bak'
go

BACKUP DATABASE educa
TO Dispositivo01
with name = 'EDUCA', description = 'Backup completo de la base de datos EDUCA', INIT;
go

BACKUP DATABASE edutec
TO Dispositivo01
with name = 'EDUTEC', description = 'Backup completo de la base de datos EDUTEC';
go

restore headeronly from Dispositivo01
go

RESTORE DATABASE EDUCA 
FROM Dispositivo01
with FILE = 1, RECOVERY;
go

RESTORE DATABASE EDUTEC 
FROM Dispositivo01
with FILE = 2, RECOVERY;
go



