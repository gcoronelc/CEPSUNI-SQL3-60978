

select @@VERSION;
go

erika_ys@hotmail.com;josequispe9726@gamil.com;erika.yac@gmail.com

-- 01 Enviando un mensaje sencillo. 
EXEC msdb.dbo.sp_send_dbmail 
@profile_name = 'PERFIL_01',
@recipients = 'erika_ys@hotmail.com;josequispe9726@gamil.com;erika.yac@gmail.com', 
@body = 'Enviando correo desde SQL Server.', 
@subject = 'Prueba SQL MAIL'; 
GO


-- 02 Se envía el resultado de una consulta 
EXEC msdb.dbo.sp_send_dbmail 
@profile_name = 'PERFIL_01', 
@recipients = 'gcoronel@uni.edu.pe;erika_ys@hotmail.com;josequispe9726@gamil.com;erika.yac@gmail.com', 
@query = 'SELECT * FROM Northwind.dbo.Customers', 
@subject = 'Listado Clientes', 
@attach_query_result_as_file = 1; 
GO

-- Limpiar los mensajes del log 
DELETE FROM msdb.dbo.sysmail_event_log; 
GO


-- HTML

DECLARE @tableHTML  NVARCHAR(MAX) ;

SET @tableHTML =
    N'<H1 style="color:blue;">Work Order Report</H1>'; 
    
EXEC msdb.dbo.sp_send_dbmail 
	@recipients='gcoronel@uni.edu.pe',
    @subject = 'Work Order List',
    @body = @tableHTML,
    @body_format = 'HTML' ;

