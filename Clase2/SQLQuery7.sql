
delete from turismo..prueba;

truncate table prueba

DBCC SQLPERF (LOGSPACE);

DBCC SHRINKFILE (N'TURISMOLOG', 0, TRUNCATEONLY)

select * from TURISMO..PRUEBA;
go

insert into turismo..PRUEBA values('Hola');
go

