
create table demo2(
  id int primary key,
  dato varchar(100)
);

begin tran;
go

insert into demo2 values(100,'Lima');
insert into demo2 values(200,'Chiclayo');
go

select * from demo2 where id in (100,200);
go

select @@TRANCOUNT
go

commit tran;
go





