

use EDUTEC;
go

select * from profesor;
go

create table demo( a varchar10) );
go


-- Activando la alerta 
raiserror('Error de usuario.',16,1) with log; 
go


BACKUP DATABASE NORTHWIND TO DISK = 'F:\backup\NORTHWIND_BACKUP.BAK' WITH INIT

SELECT * FROM Alumno;
GO

SELECT CP.IdCurso, c.NomCurso, cp.Horario 
FROM CURSOPROGRAMADO CP
JOIN CURSO C ON CP.IdCurso = C.IdCurso
WHERE IdCiclo = '2022-12'
GO

ALTER PROCEDURE USP_ENVIAR_PROMOCION
AS
BEGIN
DECLARE @tableHTML  NVARCHAR(MAX), @destinos VARCHAR(500);
SET @tableHTML =
    N'<H1>CATALOGO DE CURSOS</H1>' +
    N'<table border="1">' +
    N'<tr><th>ID</th><th>CURSO</th>' +
    N'<th>HORARIO</th></tr>' +
    CAST ( ( SELECT td = CP.IdCurso, '',
                    td = c.NomCurso, '',
                    td = cp.Horario, ''
			FROM CURSOPROGRAMADO CP
			JOIN CURSO C ON CP.IdCurso = C.IdCurso
			WHERE IdCiclo = '2022-12' 
            ORDER BY CP.IdCurso ASC
            FOR XML PATH('tr'), TYPE 
    ) AS NVARCHAR(MAX) ) +
    N'</table>' ;

SET @destinos = '';
SELECT TOP 4 @destinos = @destinos + EmailAlumno + ';'
FROM Alumno
ORDER BY IdAlumno;

EXEC msdb.dbo.sp_send_dbmail @recipients=@destinos,
    @subject = 'CATALOGO DE CURSOS ACTUALES',
    @body = @tableHTML,
    @body_format = 'HTML' ;

END;
GO


EXEC USP_ENVIAR_PROMOCION
GO

EXEC msdb.dbo.sp_send_dbmail @recipients='danw@Adventure-Works.com',
    @subject = 'Work Order List',
    @body = @tableHTML,
    @body_format = 'HTML' ;


