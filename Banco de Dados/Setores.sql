create database datafound;
use datafound;

create table setores (
idacesso int primary key auto_increment,
data timestamp default current_timestamp, 
prateleira char(2) not null,
bloqueio varchar(10) default 'inativo', 
	constraint chkbloqueio check(bloqueio in ('inativo', 'ativo')),
setor varchar(20) not null,
constraint chksetor check(setor in ('brinquedos', 'eletronicos', 'higiene','cama mesa e banho','alimentos e bebidas'))
);

insert into setores (bloqueio, prateleira, setor) values
('ativo', 4, 'higiene');
insert into setores (bloqueio, prateleira, setor) values
('inativo', 3, 'eletronicos');
insert into setores (bloqueio, prateleira, setor) values
('inativo', 3, 'brinquedos');
insert into setores (bloqueio, prateleira, setor) values
('inativo', 1, 'cama mesa e banho'),
('ativo', 2, 'alimentos e bebidas'),
('ativo', 4, 'eletronicos'),
('inativo', 5, 'cama mesa e banho'),
('ativo', 8, 'alimentos e bebidas');

select * from setores;
select * from setores order by prateleira;
select * from setores order by bloqueio;
select * from setores order by idacesso desc;
select * from setores where prateleira > 3 order by idacesso;
select * from setores order by data;
select * from setores where setor = 'eletronicos';
select * from setores where setor = 'alimentos e bebidas';
select * from setores where setor = 'cama mesa e banho';
select * from setores where setor = 'brinquedos';
select * from setores where bloqueio = 'ativo';

select concat('O registro de id ', idacesso, ' possui o status ', bloqueio, ' e foi na prateleira ', prateleira, ' no setor ', setor, '.') as Frase from setores;  
