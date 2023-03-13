
select * from edutec..CursoProgramado where IdCiclo='2022-01';
go

declare @comando varchar(1000), @ciclo varchar(50);
set @ciclo = '2022-01';
set @comando = 'select * from edutec..CursoProgramado where IdCiclo=''' + @ciclo + '''';
print @comando;
go

select * from edutec..CursoProgramado where IdCiclo='2022-01'
go

