
select * from curso;
go

select * from ALUMNO;
go

USE EduTec; 
GO 

SELECT * INTO dbo.Curso2 
FROM dbo.Curso 
WHERE 1=2; 
GO 

SELECT * FROM dbo.Curso2; 
GO


SELECT TOP 0 * INTO dbo.Curso3
FROM dbo.Curso; 
GO 

SELECT * FROM dbo.Curso3; 
GO

EXEC xp_cmdshell 'dir *.exe';  
GO  

sp_configure
go


sp_configure 'show advanced options', 1; 
RECONFIGURE; 
go 

sp_configure; 
GO 

sp_configure 'xp_cmdshell', 1; 
RECONFIGURE; 
GO

declare @comando varchar(400) 
set @comando = 'bcp "SELECT top 5 * FROM [EduTec].[dbo].[Profesor]" queryout F:\TMP\DATOS\test.xls -Slocalhost -Usa -Psql -c -C RAW -t "," ' 
exec master..xp_cmdshell @comando 
GO

SELECT TOP 0 * INTO dbo.Curso4
FROM dbo.Curso; 
GO 

SELECT * FROM dbo.Curso4; 
GO


bulk insert EduTec.dbo.Curso4
from 'F:\TMP\DATOS\Curso_A.dat' 
with (formatfile='F:\TMP\DATOS\Curso.xml');
go


SELECT * FROM dbo.Curso4; 
GO