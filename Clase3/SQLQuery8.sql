

begin tran;
go

insert into demo2 values(1,'Los Olivos');
insert into demo2 values(2,'Comas');
go

select * from demo2 where id in (1,2);
go

select @@TRANCOUNT
go


